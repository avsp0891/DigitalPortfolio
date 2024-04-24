<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center">Панель администратора</h1>
    <hr>
    <table class="table table-hover table-dark">
        <tr>
            <th scope="col">Наименование</th>
            <th scope="col">Email</th>
            <th scope="col">Активность</th>
            <th scope="col">Роли</th>
            <th scope="col">Заблокировать</th>
            <th scope="col">Подробная информация</th>
        </tr>
        <#list users as user>
            <tr>
                <th>${user.name}</th>
                <th>${user.email}</th>
                <th><#if user.active>Активен<#else>Неактивен</#if></th>
                <th><#list user.roles as role>${role}</#list></th>
                <th>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <#if user.active>
                            <input type="submit" class="btn btn-light" value="Заблокировать">
                        <#else>
                            <input type="submit" class="btn btn-light" value="Разблокировать">
                        </#if>
                    </form>
                </th>
                <#--                <th><a href="/admin/user/edit/${user.id}">Редактировние</a></th>-->
                <th><a href="/user/${user.id}">Подробная информация</a></th>
            </tr>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
    </table>
</@t.template>