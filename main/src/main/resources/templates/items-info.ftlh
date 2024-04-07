<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>

    <h1 style="text-align: center">Подробнее о фотографии</h1>

    <img src="/images/${item.id}" height="200px">

    <h2>id ${item.id}</h2>
    <h2>Наименование ${item.name}</h2>
    <h2>Описание ${item.description}</h2>
    <h2>Размер ${item.size}</h2>
    <h2>Пользователь ${item.user.getEmail()}</h2>

    <#if user.getEmail()??>
        <form action="/comment" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" style="width: 100%" class="btn btn-dark">Оставить комментарий</button>
        </form>
    </#if>


</@t.template>