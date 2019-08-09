package com.ren.freemarker.freemarker.function;

import freemarker.template.SimpleSequence;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import java.util.Collections;
import java.util.List;

/**
 * 描述
 *
 * @author: renpenghui
 * @date: 2019-08-08 17:18
 **/
public class SortMethod implements TemplateMethodModelEx {
    @Override
    public Object exec(List args) throws TemplateModelException {
        SimpleSequence ss = (SimpleSequence)args.get(0);
        List list = ss.synchronizedWrapper().toList();
        Collections.sort(list);
        return list;
    }
}
