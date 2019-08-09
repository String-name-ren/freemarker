package com.ren.freemarker.controller;

import com.ren.freemarker.entity.Goods;
import com.ren.freemarker.entity.User;
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
public class IndexController {

    @GetMapping("index")
    public String index(Model model){
        byte byteVar = 1;
        short shortVar = 2;
        int intVar = 3;
        long longVar = 4;
        float floatVar = 5.5F;
        double doubleVar = 6.6;
        char charVar = 'a';
        boolean booleanVar = false;

        model.addAttribute("byteVar",byteVar);
        model.addAttribute("shortVar",shortVar);
        model.addAttribute("intVar",intVar);
        model.addAttribute("longVar",longVar);
        model.addAttribute("floatVar",floatVar);
        model.addAttribute("doubleVar",doubleVar);
        model.addAttribute("charVar",charVar);
        model.addAttribute("booleanVar",booleanVar);


        String strVar = "我是字符串";
        Date dateVar = new Date();
        java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
        model.addAttribute("strVar",strVar);
        model.addAttribute("dateVar",dateVar);
        model.addAttribute("sqlDate",sqlDate);


        User user = new User();
        user.setUsername("张三疯");
        user.setAge(18);
        user.setSex("男");
        model.addAttribute("user",user);


        String nullVar = null;
        model.addAttribute("nullVar",nullVar);


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


        Map<String,String> mapData = new HashMap<>();
        mapData.put("xxx","123");
        mapData.put("yyy","456");
        mapData.put("zzz","789");
        model.addAttribute("mapData",mapData);

        String html = "<font color='red'>我很牛逼</font>";
        model.addAttribute("html",html);
        return "index";
    }

}
