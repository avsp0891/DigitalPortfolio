<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center">Фотографии </h1>
    <hr>
    <div style="text-align: center">
        <img src="/images/logo/${cat.logoId}"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${cat.name}</h2>
    </div>
    <br>
    <br>
    <button type="button" style="height:60px" class="btn btn-outline-success"
            data-toggle="modal"
            data-target="#addPhoto">
        Добавить фото
    </button>
    <table class="table table-hover">
        <#list items as item>
            <#if item.cat.getId() == cat.getId()>
                <tr>
                    <th><a href="/items/${item.id}"><img src="/images/${item.id}" height="200px" class="mx-auto d-block"
                                                         style="border:2px solid black; border-radius: 20px"></a></th>
                    <th><#if userByPrincipal.getId() == item.user.id>
                            <form action="/items/delete/${item.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button class="btn btn-outline-success" type="submit">
                                    Удалить
                                </button>
                            </form>
                        </#if></th>
                </tr>
            </#if>
        <#else>
            <h3>Фотографий нет</h3>
        </#list>
    </table>
    <div class="modal fade" id="addPhoto" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Добавить фотографию</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/items/create" method="post" enctype="multipart/form-data">
                        Фотография: <input type="file" name="image"><br><br>
                        Описание: <input type="text" name="description"><br><br>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="hidden" name="cat" value="${cat.getId()}"><br><br>
                        <button type="submit" class="btn btn-primary">Подтвердить</button>
                    </form>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
</@t.template>