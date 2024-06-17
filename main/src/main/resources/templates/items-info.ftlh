<#import "blocks/template.ftlh" as t>
<@t.template user url>
<#--    <div class="mt-5" style="height: 60px">-->
<#--    </div>-->

<#--    <h1 style="text-align: center">Подробнее о фотографии пользователя ${item.user.getName()}</h1>-->
    <style>
        .container {
            height: 90px;
            display: flex;
            align-items: flex-start;
        }
        .image {
            width: 30%; /* или нужный вам размер */
        }
        .comments {
            width: 70%; /* или нужный вам размер */
            margin-left: 30px;
        }
        .comment-form {
            margin-bottom: 30px;
        }
        .scrollable-area {
            height: 300px; /* Высота области, может быть изменена по вашему усмотрению */
            overflow-y: scroll; /* Добавляем вертикальную прокрутку */
            border: 1px solid #ccc; /* Опционально, добавляем границу для области */
        }

        /* Стили для отдельного комментария */
        .form-group {
            margin: 10px;
            padding: 10px;
            border-bottom: 1px solid #eee; /* Опционально, добавляем разделитель */
        }
    </style>

    <div class="container">
        <div class="image">
            <img src="/images/${item.id}" height="300px" style="border:2px solid black; border-radius: 40px">
            <a>Описание: ${item.description}</a>
        </div>
        <div class="comments">
            <div class="comment-form">
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
            </div>
            <div class="scrollable-area">
                <#list comments as comment>
                    <div class="form-group">
                        <h5>${comment.dateOfCreated}</h5>
                        <h6>${comment.user.name} - ${comment.text}</h6>
                    </div>
                    <hr>
                </#list>
            </div>
        </div>
    </div>















<#--    <img src="/images/${item.id}" height="200px" style="border:2px solid black; border-radius: 20px">-->

<#--    <h2>Описание: ${item.description}</h2>-->
<#--    <h2>Количество лайков: <span id="likeCount"></span></h2>-->
<#--    <script>-->
<#--        const url = '/likes/${item.id}';-->
<#--        const likeCountElement = document.getElementById('likeCount');-->

<#--        fetch(url)-->
<#--            .then(response => response.json())-->
<#--            .then(data => {-->
<#--                likeCountElement.textContent = data.likes;-->
<#--            })-->
<#--            .catch(error => {-->
<#--                console.error('Error:', error);-->
<#--            });-->
<#--    </script>-->

<#--    <div class="mt-3 mx-auto d-block">-->
<#--        <button class="btn btn-outline-success " type="button"-->
<#--                onclick="window.location.href='/user/${item.user.id}'">-->
<#--            Перейти в профиль пользователя ${item.user.getName()}-->
<#--        </button>-->
<#--    </div>-->

<#--    <#if user.getEmail()??>-->
<#--        <form action="/items/${item.id}/comments/create" method="post">-->
<#--            <div class="form-group">-->
<#--                <label for="text">Комментарий</label>-->
<#--                <input type="text" class="form-control" id="text" required name="text">-->
<#--            </div>-->
<#--            <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--            <div class="form-group">-->
<#--                <button class="btn btn-outline-success" type="submit">-->
<#--                    Оставить комментарий-->
<#--                </button>-->
<#--            </div>-->
<#--        </form>-->
<#--        <form action="/items/${item.id}/likes/add" method="post">-->
<#--            <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--            <button class="btn btn-outline-success" type="submit">-->
<#--                Поставить лайк-->
<#--            </button>-->
<#--        </form>-->
<#--    </#if>-->

<#--    <#list comments as comment>-->
<#--        <hr>-->
<#--        <div class="form-group">-->
<#--            <h5>${comment.dateOfCreated}</h5>-->
<#--            <h6>${comment.user.name} - ${comment.text}</h6>-->
<#--        </div>-->
<#--    </#list>-->
</@t.template>