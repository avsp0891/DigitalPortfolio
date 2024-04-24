<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center">Изображения тут</h1>
    <#list items as item>
        <hr>
        <div>
            <img src="/images/${item.id}" height="600px" class="mx-auto d-block">
        </div>
        <div class="row super">
            <div class="mt-3 mx-auto d-block">
                <button class="btn btn-outline-success " type="button"
                        onclick="window.location.href = '/items/${item.id}'">
                    Подробнее
                </button>
            </div>
        </div>
    </#list>
</@t.template>
