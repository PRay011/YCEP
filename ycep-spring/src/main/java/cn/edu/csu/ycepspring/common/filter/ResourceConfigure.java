package cn.edu.csu.ycepspring.common.filter;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ResourceConfigure implements WebMvcConfigurer {
    /**
     * 访问路径前缀
     */
    private static final String staticResourcePath = "/static/**";

    /**
     * 本地保存路径
     */
    private static final String mapToLocalPath = "file:static/";

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(staticResourcePath).addResourceLocations(mapToLocalPath);
    }
}
