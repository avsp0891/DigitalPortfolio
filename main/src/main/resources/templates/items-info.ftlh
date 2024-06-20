<#import "blocks/template.ftlh" as t>
<@t.template user url>
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
        .comment {
            border: 1px solid #000; /* Изменено на черный цвет */
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .comment-header {
            font-size: 1.2em;
            font-weight: bold;
        }

        .comment-body p {
            font-size: 1em;
            margin-top: 5px;
        }

        .comment-footer {
            text-align: right;
            color: grey;
            font-size: 0.8em;
            margin-top: 10px;
        }
        .form-group {
            /* Добавление направления колонки для вертикального стека */
            display: flex;
            flex-direction: column;
        }

        .form-group-com > div {
            display: flex;
            align-items: center; /* Выравнивание элементов по вертикали */
            justify-content: space-between; /* Распределение пространства между элементами */
        }

        .form-group-com input[type="text"] {
            flex-grow: 1; /* Input займет все доступное пространство */
            margin-right: 10px; /* Отступ справа от input */
        }

        /* Стили для кнопки, если необходимо */
        .form-group-com .btn {
            margin: 0;
            padding: 0;
            height: auto;
            width: auto;
        }

        /* Стили для изображения внутри кнопки */
        .form-group-com .btn img {
            height: 40px;
            width: 40px;
        }
    </style>

    <div class="container">
        <div class="image">
            <img src="/images/${item.id}" height="300px" width="100%" style="border:2px solid black; border-radius: 40px; object-fit: cover;">
            <div style="text-align: center; margin-bottom: 20px;">
                <a style="font-size: 24px;">${item.description}</a>
            </div>
            <div style="text-align: center;">
                <button class="btn btn-success" type="button"
                        onclick="window.location.href = '/user/${author.id}'">
                    Посмотреть профиль пользователя
                </button>
            </div>
        </div>
        <div class="comments">
            <div class="comment-form">
                <#if user.getEmail()??>
                    <form action="/items/${item.id}/comments/create" method="post">
                        <div class="form-group-com">
                            <label style="font-size: 24px;" for="text">Комментарий</label>
                            <div style="display: flex; align-items: center;">
                                <input type="text" class="form-control" id="text" required name="text" style="flex-grow: 1; margin-right: 10px;">
                                <button type="submit" class="btn" style="margin: 0; padding: 0; height: auto; width: auto;">
                                    <img src="/static/images/arrow-right.svg" style="height: 40px; width: 40px;">
                                </button>
                            </div>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                    </form>
                </#if>
            </div>
            <div class="scrollable-area">
                <#list comments as comment>
                    <div class="comment">
                        <div class="comment-header">
                            <span class="comment-author">${comment.user.name}</span>
                        </div>
                        <div class="comment-body">
                            <p>${comment.text}</p>
                        </div>
                        <div class="comment-footer">
                            <span class="comment-date">${comment.dateOfCreatedToString}</span>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
    </div>
</@t.template>