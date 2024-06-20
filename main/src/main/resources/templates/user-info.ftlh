<#import "blocks/template.ftlh" as t>
<@t.template user url>

    <style>
        .image-container {
            position: relative;
            display: inline-block;
        }

        .delete-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .delete-btn:hover {
            opacity: 0.8;
        }

        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            grid-gap: 10px;
        }

        .gallery img {
            width: 200px;
            height: 200px;
            object-fit: cover;
        }
    </style>


    <script>
        function deleteImage(btn) {
            window.btnDelete = btn;
            var itemId = btnDelete.getAttribute('data-id');
            $('#deleteModal').modal('show');
            var form = $('#deleteForm');
            form.attr('action', '/items/delete/' + itemId);
        }

        $('#confirmDelete').click(function () {
            // Удаление изображения
            window.btnDelete.parentElement.remove();
            // Закрытие модального окна
            $('#deleteModal').modal('hide');
        });

    </script>

    <div class="nav nav-tabs fixed-top" id="cat_tab" role="tablist"
         style="margin-top:115px; border-bottom: 0px; display: flex; justify-content: flex-end;">
<#--        <a class="nav-item nav-link" id="tab_cat_addCat" data-toggle="pill" role="tab" aria-controls="v-pills-profile"-->
<#--           aria-selected="false" style="background-color: transparent; border-color: transparent">-->
<#--            <div style="text-align: center;">-->
<#--                <li class="nav-item">-->
<#--                    <button type="button" class="btn" style="border-radius: 360px"-->
<#--                            data-toggle="modal"-->
<#--                            data-target="#addCat">-->
<#--                        <img src="/static/images/plus-circle.svg" height="140px" width="140px">-->
<#--                    </button>-->
<#--                </li>-->
<#--            </div>-->
<#--        </a>-->
        <#list user.getCats() as cat>
            <a class="nav-item nav-link" id="tab_cat_${cat.getId()}" data-toggle="pill"
               href="#tab_cat_content_${cat.getId()}" role="tab" aria-controls="v-pills-profile" aria-selected="false"
               style="background-color: transparent; border-color: transparent">
                <div style="text-align: center;">
                    <img src="/images/logo/${cat.logoId}" height="140px" width="140px"
                         style="border:2px solid black; border-radius: 40px; object-fit: cover;">
                    <div style="margin-top: 10px; font-size: 25px;">${cat.getName()}</div>
                </div>
            </a>
        </#list>
    </div>
    <div class="tab-content" id="v-pills-tabContent">
        <#list user.getCats() as cat>
            <div class="tab-pane fade" id="tab_cat_content_${cat.getId()}" role="tabpanel"
                 aria-labelledby="v-pills-profile-tab" style="margin-top:280px;">
                <table class="table" style="margin-top: 250px; background-color: #717bbd52;">
                    <thead>
                    <tr>
                        <th>Кличка</th>
                        <th>Пол</th>
                        <th>Дата рождения</th>
                        <th>Порода</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${cat.getName()}</td>
                        <td>${cat.getGender()}</td>
                        <td>${cat.getBirthday()}</td>
                        <td>${cat.getBreed()}</td>
                    </tr>
                    </tbody>
                </table>
                <div class="gallery">
                    <#list items as item>
                        <#if item.cat.getId() == cat.getId()>
                            <div class="image-container">
                                <a href="/items/${item.id}">
                                    <img src="/images/${item.id}" alt="${item.getName()}" height="600px"
                                         class="mx-auto d-block" style="border:2px solid black; border-radius: 20px">
                                </a>
                                <#if userByPrincipal.getId() == item.user.id>
                                    <button class="delete-btn" onclick="deleteImage(this)" data-id=${item.id}>X</button>
                                </#if>
                            </div>
                        </#if>
                    </#list>
                </div>
            </div>
        </#list>
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
         aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Подтверждение
                        удаления</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Вы уверены, что хотите удалить это изображение?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Отмена
                    </button>
                    <form id="deleteForm" action="/items/delete/" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit" class="btn btn-danger" id="confirmDelete">
                            Удалить
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</@t.template>