<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center">Авторизация</h1>
    <form action="/login" method="post">
        <div class="form-group">
            <label style="font-size: 25px; font-family: 'Arial', sans-serif; font-style: oblique" for="email">Электронная почта</label>
            <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email"
                   name="username">
            <div id="email" class="invalid-feedback">
                Неверная электронная почта
            </div>
        </div>
        <div class="form-group">
            <label style="font-size: 25px; font-family: 'Arial', sans-serif; font-style: oblique" for="password">Пароль</label>
            <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password"
                   name="password">
            <div id="password" class="invalid-feedback">
                Неверный пароль
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="btn btn btn-success btn-lg btn-block" type="submit" style="font-size: 25px; font-family: 'Arial', sans-serif; font-style: oblique">
            Войти
        </button>
    </form>
</@t.template>