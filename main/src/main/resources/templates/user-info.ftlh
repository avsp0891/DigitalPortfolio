<#import "blocks/template.ftlh" as t>
<@t.template user url>
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
    <#list items as item>
        <hr>
        <div>
            <img src="/images/${item.id}" height="200px" class="mx-auto d-block">
        </div>
        <div class="row super">
            <div class="mt-3 mx-auto d-block">
                <button class="btn btn-outline-success " type="button"
                        onclick="window.location.href = '/items/${item.id}'">
                    Подробнее
                </button>
            </div>
        </div>
    <#else>
        <h1 style="text-align: center">Не найдено</h1>
    </#list>
</@t.template>