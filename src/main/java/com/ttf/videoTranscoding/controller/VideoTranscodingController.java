package com.ttf.videoTranscoding.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.client.RestClient;


@RestController
public class VideoTranscodingController {

    private final DiscoveryClient discoveryClient;
    private final RestClient restClient;
    @Value("${spring.application.name}")
    private String appName;

    public VideoTranscodingController(DiscoveryClient discoveryClient, RestClient.Builder restClientBuilder) {
        this.discoveryClient = discoveryClient;
        restClient = restClientBuilder.build();
    }

    @GetMapping("/helloworld")
    public String helloWorld() {
        return "Hello world from " + appName;
    }

    @GetMapping("/showServices")
    public String showServices() {

        String[] services = {"VideoTranscoding", "VideoUpload", "Users", "Streaming", "Comments"};

        for (String service : services) {

            ServiceInstance serviceInstance = discoveryClient.getInstances(service).get(0);
            String ServiceResponse = restClient.get()
                    .uri(serviceInstance.getUri() + "/helloWorld")
                    .retrieve()
                    .body(String.class);
            return ServiceResponse;

        }
        return null;

    }

}
