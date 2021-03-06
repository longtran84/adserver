package com.fintechviet.common.swagger;

import com.fasterxml.classmate.TypeResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMethod;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseMessageBuilder;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ResponseMessage;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import static com.google.common.collect.Lists.newArrayList;
import static springfox.documentation.builders.PathSelectors.regex;

import java.util.List;;

@Configuration
@EnableSwagger2
class SwaggerConfig {

    private static final String ads = "adser";
    private static final String UT = "utils";

    @Value("${spring.application.name}")
    protected String name;

    @Autowired
    private TypeResolver typeResolver;


    @Bean
    public Docket utilsApi() {
        ApiInfo utils = buildApiInfo(UT);

        return new Docket(DocumentationType.SWAGGER_2)
                .useDefaultResponseMessages(true)
                .groupName(UT)
                .apiInfo(utils)
                .select()
                .paths(regex(".*/"+UT+".*"))
                .build().useDefaultResponseMessages(false)
                .globalResponseMessage(RequestMethod.GET, buildGlobalResponses());
    }
    
    @Bean
    public Docket adsApi() {
        ApiInfo adsInfo = buildApiInfo(ads);
        List<ResponseMessage> resp = buildGlobalResponses();

        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.fintechviet.ads.web"))
                .paths(regex(".*/"+ads+".*"))
                .build()
                .apiInfo(adsInfo);
    }    


    private List<ResponseMessage> buildGlobalResponses() {
        return newArrayList(new ResponseMessageBuilder()
                .code(500)
                .message("Unexpected error during execution")
                .responseModel(new ModelRef("Error"))
                .build(),
        		new ResponseMessageBuilder() 
        	      .code(403)
        	      .message("Forbidden!")
        	      .build());
    }

    private ApiInfo buildApiInfo(String version) {
        return new ApiInfoBuilder()
                .title(name)
                .description("Fintech dev test")
                .version(version)
                .build();
    }
}