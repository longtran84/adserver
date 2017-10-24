package com.fintechviet;

import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

/**
 * Created by tungn on 10/24/2017.
 */
@Component
public class CustomizationPage implements EmbeddedServletContainerCustomizer {
    @Override
    public void customize(ConfigurableEmbeddedServletContainer container) {
        container.addErrorPages(new ErrorPage(HttpStatus.METHOD_NOT_ALLOWED, "/pageNotFound"));
        container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/pageNotFound"));
        container.addErrorPages(new ErrorPage("/errorPage"));
    }
}
