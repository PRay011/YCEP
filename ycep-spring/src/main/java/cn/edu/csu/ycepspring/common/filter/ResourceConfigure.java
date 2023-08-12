package cn.edu.csu.ycepspring.common.filter;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ResourceConfigure implements WebMvcConfigurer {
    @Value("${static-resource.map-path}")
    private String mapPath;
    
    @Value("${static-resource.local-path}")
    private String localPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(mapPath).addResourceLocations(localPath);
    }
}
