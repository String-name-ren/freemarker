package com.ren.freemarker.controller;

import com.ren.freemarker.entity.Goods;
import com.ren.freemarker.entity.User;
import com.ren.freemarker.freemarker.function.SortMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

/**
 * 描述
 *
 * @author: renpenghui
 * @date: 2019-08-05 11:46
 **/
@RequestMapping("/")
@Controller
public class SecondController {

    @GetMapping("second")
    public String index(Model model){
        int a = 10;
        int b = 5;
        model.addAttribute("a",a);
        model.addAttribute("b",b);

        model.addAttribute("flag",true);

        model.addAttribute("param","我是自定义指令参数,hahahah ");
        model.addAttribute("param2","我是第二个参数");

        model.addAttribute("sort_int",new SortMethod());


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
        model.addAttribute("goodsList",goodsList);

        return "second";
    }

}
