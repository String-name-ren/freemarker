package com.ren.freemarker.config;

import com.ren.freemarker.freemarker.directive.AuthDirective;
import com.ren.freemarker.freemarker.directive.RoleDirective;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

/**
 * 描述
 *
 * @author: renpenghui
 * @date: 2019-08-09 10:25
 **/
@Configuration
public class FreemarkerConfig implements InitializingBean {

    @Autowired
    private freemarker.template.Configuration configuration;

    @Autowired
    private AuthDirective authDirective;

    @Autowired
    private RoleDirective roleDirective;

    @Override
    public void afterPropertiesSet(){
        configuration.setSharedVariable("auth",authDirective);
        configuration.setSharedVariable("role",roleDirective);
    }
}
