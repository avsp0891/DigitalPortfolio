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

    <div class="mt-3 mx-auto d-block">
        <button class="btn btn-outline-success " type="button"
                onclick="window.location.href = '/user/${item.user.id}'">
            Посмотреть профиль пользователя
        </button>
    </div>

    <#if user.getEmail()??>
        <form action="/items/${item.id}/comments/create" method="post">
            <div class="form-group">
                <label for="text">Комментарий</label>
                <input type="text" class="form-control" id="text" required name="text">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="form-group">
            <button class="btn btn-outline-success" type="submit">
                Оставить комментарий
            </button>
            </div>
        </form>
    </#if>

    <#list comments as comment>
        <hr>
        <div class="form-group">
            <h5>${comment.dateOfCreated}</h5>
            <h6>${comment.user.name} - ${comment.text}</h6>
        </div>
    </#list>


</@t.template>