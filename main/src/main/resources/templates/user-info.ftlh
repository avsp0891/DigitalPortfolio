<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center">Информация о пользователе</h1>
    <hr>
    <div style="text-align: center">
        <img src="/static/images/avatar.png" style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Email: <b>${user.getEmail()}</b>
    </div>
    <h1 style="text-align: center">Котики пользователя ${user.name}</h1>
    <div style="text-align: center" class="mx-auto d-block">
        <table class="table mx-auto d-block">
            <tr>
                <#list user.getCats() as cat>
                    <td class="text-center align-middle">
                        <div class="card" style="width: 18rem; border:3px solid black; border-radius: 20px">
                            <img class="card-img-top" src="/images/logo/${cat.logoId}"
                                 style="border:2px solid black; border-radius: 360px">
                            <div class="card-body">
                                <h5 class="card-title">Имя: ${cat.name}</h5>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Пол: ${cat.gender}</li>
                                    <li class="list-group-item">Порода: ${cat.breed}</li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <button class="btn btn-outline-success" type="button" style="height:60px"
                                        onclick="window.location.href = '/cat/${cat.getId()}'">
                                    Посмотреть фото
                                </button>
                            </div>
                        </div>
                    </td>
                <#else>
                    <h3 style="text-align: center">У вас нет котов</h3>
                </#list>
            <tr>
        </table>
    </div>

</@t.template>