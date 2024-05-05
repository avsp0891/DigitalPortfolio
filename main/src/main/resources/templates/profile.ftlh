<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center">Личный кабинет</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <img src="/static/images/avatar.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Электронная почта: <b>${user.email}</b>
        <br>
        <br>
        <#if user.getEmail()??>
        <#--            <form action="/items/create" method="post" enctype="multipart/form-data">-->
        <#--                Фотка: <input type="file" name="image"><br><br>-->
        <#--                Описание: <input type="text" name="description"><br><br>-->
        <#--                <input type="hidden" name="_csrf" value="${_csrf.token}">-->
        <#--                <input type="submit" value="Добавить фото"/>-->
        <#--            </form>-->
        </#if>
        <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
           href="/user/${user.id}">
            Мой профиль
        </a>
    </div>
</@t.template>