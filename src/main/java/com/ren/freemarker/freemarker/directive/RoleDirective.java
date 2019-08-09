package com.ren.freemarker.freemarker.directive;

import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

/**
 * 描述
 *
 * @author: renpenghui
 * @date: 2019-08-08 18:09
 **/
@Component
public class RoleDirective implements TemplateDirectiveModel {

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        env.setVariable("role", builder.build().wrap("我是大boss!"));
        body.render(env.getOut());

    }
}
