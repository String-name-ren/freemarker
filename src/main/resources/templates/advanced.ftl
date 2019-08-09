<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<span style="color :  indigo"><h3>macro用法</h3></span>
<div style="color: crimson;font-weight: bold">
    <#macro test1>
        无参数macro
    </#macro>
    <@test1 />
</div>
<br/>

<div style="color: crimson;font-weight: bold">
    <#macro test2 param1 param2>
        有参数macro,param1=${param1},param2=${param2}
    </#macro>
    <@test2 param1="java" param2="python"/>
</div>
<br/>

<div style="color: crimson;font-weight: bold">
    <#macro test3 param1 param2="我是默认值">
        有默认值macro,param1=${param1},param2=${param2}
    </#macro>
    <@test3 param1="java" />
</div>
<br/>

<div style="color: crimson;font-weight: bold">
    <#macro test4 param1 param2="我是默认值"  moreParams...>
        多参数macro,param1=${param1},param2=${param2}<br/>
        moreParams = ${moreParams["param3"]}...${moreParams["paramN"]}
    </#macro>
    <@test4 param1="java" param3="第三个参数" paramN="第N个参数"/>
</div>
<br/>


<span style="color :  indigo"><h3>macro嵌套nested的使用</h3></span>

<a href="/freemarker/nested">跳转此页面查看</a>
<br/><br/>

<span style="color :  indigo"><h3>function、return的使用</h3></span>
<#function avg nums...>
    <#local sum = 0>
    <#list nums as num>
        <#local sum = sum + num>
    </#list>
    <#if nums?size != 0>
        <#return sum / nums?size>
        <#else>
            <#return "没有传参数">
    </#if>
</#function>
${avg(10, 20)}<br/>
${avg(10, 20, 30, 40)}<br/>
${avg()!"没有返回值时我是默认值"}<br/>


<#function func_name params...>
    <#local var_name = "本地变量">
    <#list params as param>
        <#local var_name = var_name + param>
    </#list>
    <#return var_name>
</#function>
${func_name(":this is a test","，string 拼接！")}
</body>
</html>