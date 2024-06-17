<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center; font-family: 'Arial', sans-serif; font-style: oblique">Регистрация</h1>
    <form action="/registration" method="post">
        <div class="form-group myFont">
            <label style="font-size: 25px; font-family: 'Arial', sans-serif; font-style: oblique" for="name">Имя пользователя</label>
            <input type="text" class="form-control" required id="name" name="name">
        </div>
        <div class="form-group p">
            <label style="font-size: 25px; font-family: 'Arial', sans-serif; font-style: oblique" for="email">Электронная почта</label>
            <input type="email" class="form-control" id="email" required name="email">
        </div>
        <div class="form-group p">
            <label style="font-size: 25px; font-family: 'Arial', sans-serif; font-style: oblique" for="password">Пароль</label>
            <input type="password" class="form-control" id="password" required name="password">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="btn btn btn-success btn-lg btn-block" type="submit" style="font-size: 25px; font-family: 'Arial', sans-serif; font-style: oblique">
            Зарегистрироваться
        </button>
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</@t.template>