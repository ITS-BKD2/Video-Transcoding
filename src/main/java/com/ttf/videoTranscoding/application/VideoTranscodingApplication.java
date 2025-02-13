package com.ttf.videoTranscoding.application;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.ttf")
public class VideoTranscodingApplication {

	public static void main(String[] args) {
		SpringApplication.run(VideoTranscodingApplication.class, args);
	}

}
