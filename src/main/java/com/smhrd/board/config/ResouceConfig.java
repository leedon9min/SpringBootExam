package com.smhrd.board.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// @Configuration : 특정 class 파일, 리소스 접근, 보안설정 등을 정의하는 기능
@Configuration
public class ResouceConfig implements WebMvcConfigurer {

    @Value("${save.path}")
    private String savePath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        // 외부에서 요청: http://localhost:8090/save/cat.jpg
        // -> 실제경로와 연결: C:/save/cat.jpg

        registry.addResourceHandler("/save/**")
                .addResourceLocations( "file:///" + savePath );
    }
}
