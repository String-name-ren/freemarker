package com.ren.freemarker.freemarker.directive;

import com.ren.freemarker.entity.Goods;
import freemarker.core.Environment;
import freemarker.core.StringArraySequence;
import freemarker.template.*;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 描述
 *
 * @author: renpenghui
 * @date: 2019-08-08 18:09
 **/
@Component
public class AuthDirective implements TemplateDirectiveModel {

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
       
        SimpleScalar auth = (SimpleScalar) params.get("param");
        SimpleScalar param2 = (SimpleScalar) params.get("param2");

        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);

        env.setVariable("result", builder.build().wrap(auth.getAsString()));
        env.setVariable("result2", builder.build().wrap(param2.getAsString()));
        env.setVariable("boo", builder.build().wrap(true));

        Goods goods1 = new Goods();
        goods1.setName("水杯");
        goods1.setPrice(199.99);

        Goods goods2 = new Goods();
        goods2.setName("电风扇");
        goods2.setPrice(9.99);

        Goods goods3 = new Goods();
        goods3.setName("荣耀V10");
        goods3.setPrice(1999.99);

        List<Goods> goodsList = new ArrayList<>();
        goodsList.add(goods1);
        goodsList.add(goods2);
        goodsList.add(goods3);

        env.setVariable("result3", builder.build().wrap(goodsList));
        body.render(env.getOut());




    }
}
