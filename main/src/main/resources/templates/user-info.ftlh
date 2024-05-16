<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center">Информация о пользователе</h1>
    <hr>
    <div style="text-align: center">
        <img src="/static/images/avatar.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Email: <b>${user.getEmail()}</b>
    </div>
    <br>
    <hr>
    <h1 style="text-align: center">Изображения пользователя ${user.name}</h1>
    <br>
    <table class="table table-hover">
    <#list items as item>
        <tr>
<#--            <th><img src="/images/${item.id}" height="200px" class=""></th>-->
            <th><a href="/items/${item.id}"><img src="/images/${item.id}" height="200px" class="mx-auto d-block" style="border:2px solid black; border-radius: 20px"></a></th>
            <th><#if userByPrincipal.getId() == item.user.id>
                    <form action="/items/delete/${item.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button class="btn btn-outline-success" type="submit">
                            Удалить
                        </button>
                    </form>
                </#if></th>
        </tr>
    <#else>
        <h3>Фотографий нет</h3>
    </#list>
    </table>
<#--    <#list items as item>-->
<#--        <hr>-->
<#--        <div>-->
<#--            <img src="/images/${item.id}" height="200px" class="mx-auto d-block">-->
<#--        </div>-->
<#--        <div class="row super">-->
<#--            <div class="mt-3 mx-auto d-block">-->
<#--                <button class="btn btn-outline-success " type="button"-->
<#--                        onclick="window.open('/items/${item.id}')">-->
<#--                    Подробнее-->
<#--                </button>-->
<#--            </div>-->
<#--        </div>-->
<#--         <#if userByPrincipal.getId() == item.user.id>-->
<#--        <form action="/items/delete/${item.id}" method="post">-->
<#--            <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--            <button class="btn btn-outline-success" type="submit">-->
<#--                Удалить-->
<#--            </button>-->
<#--        </form>-->
<#--         </#if>-->
<#--    <#else>-->
<#--        <h1 style="text-align: center">Не найдено</h1>-->
<#--    </#list>-->
</@t.template>