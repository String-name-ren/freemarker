<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<span style="color :  red"><h3>赋值&运算</h3></span>
<#assign v1=33 v2=66>
v1+v2 = ${v1+v2};<br/>
v1-v2 = ${v1-v2};<br/>
v1*v2 = ${v1*v2};<br/>
v1/v2 = ${v1/v2};<br/>

a+b = ${a+b};<br/>
a-b = ${a-b};<br/>
a*b = ${a*b};<br/>
a/b = ${a/b};<br/>
<br/><br/><br/>

<span style="color :  red"><h3>if判断</h3></span>

<#if flag && (a == 10)>
 flag is ${flag?string("yes","no")}<br/>
</#if>

<#assign x = 13>
<#if (x>a)>
    x大于a
    <#elseif (x>b && x<a)>
    x大于b，小于a
    <#else>
    x小于b
</#if>
<br/><br/><br/>


<span style="color :  red"><h3>&& || !</h3></span>

<#if (a == 10 && b == 5)>
    a == 10 && b == 5<br/>
</#if>

<#if (a == 10 || b == 5)>
    a == 10 || b == 5<br/>
</#if>

<#if (a != 10 || b == 5)>
    a != 10 || b == 5<br/>
</#if>
<br/><br/><br/>



<span style="color :  red"><h3>switch case break default</h3></span>
<span style="color :  darkmagenta">freemarker的switch支持字符串<br/></span>
<#assign var=11>
<#switch var>
    <#case 10>
    <#case 11>
        10 or 11<br/><#break>
    <#case 20>
        20<br/><#break>
    <#case 30>
        30<br/><#break>
    <#default>
        我是默认值<br/><#break>
</#switch>

<br/><br/><br/>

<span style="color :  red"><h3>字符串操作</h3></span>
<span style="color :  darkmagenta">freemarker的函数命名不遵循驼峰匹配，而是使用下划线，类似于数据库字段命名<br/></span>
<#assign str1="hello">
<#assign str2="world">
<li>拼接</li>
<span style="color :  fuchsia">${str1+str2}</span>
<li>长度</li>
<span style="color :  fuchsia">${(str1+str2)?length}</span>
<li>大写</li>
<span style="color :  fuchsia">${(str1+str2)?upper_case}</span>
<li>小写</li>
<span style="color :  fuchsia">${(str1+str2)?lower_case}</span>
<li>截取</li>
<span style="color :  fuchsia">${(str1+str2)?substring(3,8)}</span>
<li>index_of</li>
<span style="color :  fuchsia">${(str1+str2)?index_of("o")}</span>
<li>last_index_of</li>
<span style="color :  fuchsia">${(str1+str2)?last_index_of("o")}</span>
<li>替换</li>
<span style="color :  fuchsia">${(str1+str2)?replace("w","W")}</span>
<br/><br/><br/>

<span style="color :  red"><h3>自定义函数</h3></span>
<#assign myList=[2,5,7,8,2,1,6,5]>

<span style="color :  darkmagenta">未排序<br/></span>
<#list myList as item>
    ${item},
</#list>
<br/>
<span style="color :  darkmagenta">排序<br/></span>
<#list sort_int(myList) as item>
    ${item},
</#list>
<br/>
<span style="color :  darkmagenta">freemarker排序<br/></span>
<#list (myList?sort) as item>
    ${item},
</#list>
<br/>
<span style="color :  darkmagenta">freemarker排序-反转<br/></span>
<#list (myList?sort?reverse) as item>
    ${item},
</#list>
<br/>
<span style="color :  darkmagenta">size<br/></span>
${myList?size}
<br/>
<span style="color :  darkmagenta">直接取值<br/></span>
${myList[5]}
<br/><br/><br/>


<span style="color :  red"><h3>自定义指令</h3></span>
<@auth param=param param2=param2;result,result2,result3>
    ${result}<br/>
    ${result2}<br/>
    <#if boo>
        返回true
    </#if>
    <table border="2" >
        <#if result3??>
            <#list result3 as goods >
                <tr>
                    <td>${goods.name}</td>
                    <td>${goods.price}</td>
                </tr>
            </#list>
        </#if>
    </table>
</@auth>

<@role role>
    ${role}
</@role>
<br/><br/><br/>


<span style="color :  red"><h3>常用内建函数</h3></span>
<span style="color :  fuchsia"><h4>Sequence的内置函数</h4></span>

first : ${goodsList?first}<br/>
last : ${goodsList?last}<br/>
正常 : <table border="2" >
            <#list goodsList as goods >
                <tr>
                    <td>${goods.name}</td>
                    <td>${goods.price}</td>
                </tr>
            </#list>
        </table><br/>
reverse  : <table border="2" >
    <#list goodsList?reverse as goods >
        <tr>
            <td>${goods.name}</td>
            <td>${goods.price}</td>
        </tr>
    </#list>
</table><br/>
size  : ${goodsList?size }<br/>
sort  : <table border="2" >
    <#list goodsList?sort as goods >
        <tr>
            <td>${goods.name}</td>
            <td>${goods.price}</td>
        </tr>
    </#list>
</table><br/>
sort_by  : <table border="2" >
    <#list goodsList?sort_by("price") as goods >
        <tr>
            <td>${goods.name}</td>
            <td>${goods.price}</td>
        </tr>
    </#list>
</table><br/>


<span style="color :  fuchsia"><h4>Hash的内置函数</h4></span>

<span style="color :  orangered"><h5>1. hash?keys 返回hash里的所有key,返回结果为sequence<br/></h5></span>
<span style="color :  orangered"><h5>2. hash?values 返回hash里的所有value,返回结果为sequence<br/><br/></h5></span>

<#assign user={"name":"hailang", "sex":"man"}>
<#assign keys=user?keys>
<#list keys as key>
    ${key}=${user[key]}
</#list><br/>
<#list user?values as val>
${val}
</#list><br/>


<span style="color :  fuchsia"><h4>操作字符串函数</h4></span>

<#assign strVar = "  this is a test  ">
<#assign str = "  Hello  ">

<span style="color :  orangered"><h5>1. substring（start,end）从一个字符串中截取子串<br/></h5></span>

${strVar?substring(0)}<br/>
${strVar?substring(3)}<br/>
${strVar?substring(3,8)}<br/>

<span style="color :  orangered"><h5>2. cap_first 将字符串中的第一个单词的首字母变为大写。<br/></h5></span>
${strVar?cap_first}<br/>

<span style="color :  orangered"><h5>3. uncap_first将字符串中的第一个单词的首字母变为小写。<br/></h5></span>

${str?uncap_first}<br/>

<span style="color :  orangered"><h5>4. capitalize将字符串中的所有单词的首字母变为大写<br/></h5></span>
${strVar?capitalize}<br/>


<span style="color :  orangered"><h5>5. date,time，datetime将字符串转换为日期<br/>
    注意：如果指定的字符串格式不正确将引发错误。<br/>
    </h5></span>
<#assign date1="2009-10-12"?date("yyyy-MM-dd")>
<#assign date2="9:28:20"?time("HH:mm:ss")>
<#assign date3="2009-10-12 9:28:20"?datetime("yyyy-MM-dd HH:mm:ss")>
${date1}<br/>
${date2}<br/>
${date3}<br/>

<span style="color :  orangered"><h5>6. ends_with 判断某个字符串是否由某个子串结尾，返回布尔值。<br/>
        注意：布尔值必须转换为字符串才能输出<br/></h5></span>


${strVar?ends_with("test")?string}<br/>
${strVar?trim?ends_with("test")?string}<br/>


<span style="color :  orangered"><h5>7. html 用于将字符串中的<、>、&和"替换为对应得<br/></h5></span>

${"<font style='color :  orangered'>我是字体</font>"}<br/>
${"<font style='color :  orangered'>我是字体</font>"?html}<br/>

<span style="color :  orangered"><h5>8. index_of（substring,start）在字符串中查找某个子串，返回找到子串的第一个字符的索引，如果没有找到子串，则返回-1。<br/></h5></span>

${strVar?trim?index_of("is")}<br/>
${strVar?trim?index_of("is",4)}<br/>

<span style="color :  orangered"><h5>9. length返回字符串的长度<br/></h5></span>
${strVar?length}<br/>
${strVar?trim?length}<br/>

<span style="color :  orangered"><h5>10. lower_case将字符串转为小写<br/></h5></span>
${str?lower_case}<br/>

<span style="color :  orangered"><h5>11. upper_case将字符串转为大写<br/><br/></h5></span>
${str?upper_case}<br/>

<span style="color :  orangered"><h5>12. contains 判断字符中是否包含某个子串。返回布尔值<br/></h5></span>
${str?contains("ll")?string}<br/>


<span style="color :  orangered"><h5>13. number将字符串转换为数字<br/></h5></span>
${"111.11"?number}<br/>
${"111.11"?number?is_number?string}<br/>

<span style="color :  orangered"><h5>14. replace用于将字符串中的一部分从左到右替换为另外的字符串。<br/></h5></span>
${strVar?replace("is","IS")}<br/>


<#list "aa,bb,cc,dd"?split(",") as item>
    ${item}<br/>
</#list>

<span style="color :  orangered"><h5>16. trim 删除字符串首尾空格 ${"String"?trim} 结果为String<br/></h5></span>
${strVar?trim}<br/>



<span style="color :  fuchsia"><h4> 操作数字</h4></span>

<span style="color :  orangered"><h5>1. c 用于将数字转换为字符串<br/></h5></span>
${123?c?is_string?string}<br/>

<span style="color :  orangered"><h5>2. string用于将其他类型转换为字符串<br/></h5></span>
${true?string}<br/>


<span style="color :  orangered"><h5>3. Freemarker中预订义了三种数字格式：number,currency（货币）和percent(百分比)其中number为默认的数字格式转换<br/></h5></span>
${strVar?trim}<br/>

<#assign tempNum=20>
${tempNum}<br/>
${tempNum?string.number}或${tempNum?string("number")}<br/>
${tempNum?string.currency}或${tempNum?string("currency")} <br/>
${tempNum?string. percent}或${tempNum?string("percent")} <br/>

<span style="color :  fuchsia"><h4>操作布尔值</h4></span>

<span style="color :  orangered"><h5>string 用于将布尔值转换为字符串输出<br/></h5></span>
${true?string}<br/>


<br/><br/><br/>





</body>
</html>