//package com.example.video-transcoding.service;
//
//This code was handwritten using Vim, and as such needs to be integrated with
//the rest of the Sprint Microservice

//import com.example.videoapp.service.VideoTranscoderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;

@Service
public class VideoTranscoderService {

    @Autowired
    private ResourceLoader resourceLoader;
    /*Injects an instance of ResourceLoader when the app context is created
     * 
     * 	The ResourceLoader itself is an interface provided by Spring for loading external files.
     * 	This can happen via filesystem, URLs exc..
     */
    
    /**
     * Fetches a video file from the filesystem and transcodes it to AV1 format using FFmpeg.
     *
     * @param inputFilePath == The path to the input
     * @param outputFilePath == The path to saved output.
     *
     * @throws InterruptedException == FFmpeg process receives and interrupt
     */
    
    public void Mp4ToAV1(String inputFilePath, String outputFilePath) throws IOException, InterruptedException {
       
	// Load the input
	Resource resource = resourceLoader.getResource("file:" + inputFilePath);
        File inputFile = resource.getFile();

        // Check if file exists
        if (!inputFile.exists()) {
            throw new IOException("EBADF " + inputFilePath);
        }

        // Prepare command
        String ffmpegCommand = String.format("ffmpeg -i %s -c:v libaom-av1 -strict experimental %s",
                inputFile.getAbsolutePath(), outputFilePath);

        // Execute command
        ProcessBuilder processBuilder = new ProcessBuilder(ffmpegCommand.split(" "));
        processBuilder.redirectErrorStream(true);

        Process process = processBuilder.start();
        int exitCode = process.waitFor();

        // Check success
        if (exitCode != 0) {
            throw new IOException("FFmpeg returns: " + exitCode);
        }

        System.out.println("Transcoding finished. Output saved to: " + outputFilePath);
    }
}
