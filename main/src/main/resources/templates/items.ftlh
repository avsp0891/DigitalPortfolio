<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center">Последние изображения</h1>
    <#list items as item>
        <hr>
        <div>
            <a onclick="window.open('/items/${item.id}')"><img src="/images/${item.id}" height="600px" class="mx-auto d-block"></a>
        </div>
    </#list>
</@t.template>
