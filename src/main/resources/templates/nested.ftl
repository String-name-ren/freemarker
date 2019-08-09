<#include "./template.ftl"/>

<@htmlHead title="FreeMarker宏测试 ">
    <script src="${basePath}/js/index.js" type="text/javascript"></script>
    <script type="text/javascript">
        function test(){
           alert("111");
        }
        test();
        aaa();
    </script>
</@htmlHead>

<@htmlBody>
    哈哈哈<br><br><br>
    <input id="test1" type="text" name="name1" value="我的祖国"><br><br><br>
    <img src="${basePath}/image/1.jpg"><br><br><br>
    <a href="#" onclick="test()">测试jquery</a>
</@htmlBody>