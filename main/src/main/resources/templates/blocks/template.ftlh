<#macro template user url>
    <!doctype html>
    <html lang="ru">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <#--        <link rel="stylesheet" href="/static/css/style.css">-->
        <title>Kotogram</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">
<#--        <link rel="stylesheet" type="text/css" href="/static/css/style.css">-->

    </head>
    <body style=" background-image: url('/static/images/body.jpg')!important;
<#--    <body style=" background-image: url('https://bogatyr.club/uploads/posts/2023-03/1679096347_bogatyr-club-p-fon-zoo-foni-vkontakte-80.jpg')!important;-->
/*        background-size: cover; !* Покрывает весь экран, сохраняя пропорции *!*/
            background-size: 100% auto;
        background-repeat: repeat;
        background-position: center;">

    <header>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light navbar fixed-top"
                 style="background-color: #e3f2fd;">
                <a class="navbar-brand" href="/">
                    <img src="/static/images/logo3.png" style="width:90px;height:90px; border:2px solid white"
                         class="rounded"
                         alt="Kotogram"></a>

                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <#if user.email??>
                        <li class="nav-item col-md-4">
                            <button type="button" style="height:60px" class="btn btn-outline-success"
                                    data-toggle="modal"
                                    data-target="#addPhoto">
                                Добавить фото
                            </button>
                        </li>
                         <#if url != '/user/'>
                             <li class="nav-item col-md-4">
                                 <button class="btn btn-outline-success" type="button" style="height:60px"
                                          onclick="window.location.href = '/user/${user.id}'">
                                     Мой профиль
                                 </button>
                             </li>
                         </#if>
                        <#if url != '/profile'>
                            <li class="nav-item">
                                <button class="btn btn-outline-success" type="button" style="height:60px"
                                        onclick="window.location.href = '/profile'">
                                    Личный кабинет
                                </button>
                            </li>
                        </#if>
                        <#if user.isAdmin()>
                            <li class="nav-item">
                                <button class="btn btn-outline-success" type="button" style="height:60px"
                                        onclick="window.location.href = '/admin'">
                                    Панель администратора
                                </button>
                            </li>
                        </#if>
                        <li class="nav-item col-md-4">
                            <form action="/logout" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button class="btn btn-outline-success" type="submit" style="height:60px">
                                    Выйти
                                </button>
                            </form>
                        </li>
                        <#else>
                        <li class="nav-item col-md-4">
                            <button class="btn btn-outline-success" type="button" style="height:60px"
                                    onclick="window.location.href = '/login'">
                                Войти
                            </button>
                        </li>
                        <li class="nav-item col-md-4">
                            <button class="btn btn-outline-success" type="button" style="height:60px"
                                    onclick="window.location.href = '/registration'">
                                Регистрация
                            </button>
                        </li>
                    </ul>
                    </#if>
                </div>
            </nav>
        </div>
    </header>
    <div id="fix-for-navbar-fixed-top-spacing" style="height: 70px;">&nbsp;</div>
    <div class="container">
        <div class="modal fade" id="addCat" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Добавить котика</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/cat/create" method="post" enctype="multipart/form-data">
                            <table>
                                <tr>
                                    <td>Фотография:</td>
                                    <td style="display: flex; align-items: center; justify-content: center; height: 50px;"><input type="file" name="image"><br><br></td>
                                </tr>
                                <tr>
                                    <td>Кличка:</td>
                                    <td style="display: flex; align-items: center; justify-content: center; height: 50px;"><input type="text" name="name"><br><br></td>
                                </tr>
                                <tr>
                                    <td>Пол: </td>
                                    <td style="display: flex; align-items: center; justify-content: center; height: 50px;"><input type="text" name="gender"><br><br></td>
                                </tr>
                                <tr>
                                    <td>Порода:</td>
                                    <td style="display: flex; align-items: center; justify-content: center; height: 50px;"><input type="text" name="breed"><br><br></td>
                                </tr>
                            </table>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button type="submit" class="btn btn-primary">Добавить</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addPhoto" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Добавить фотографию</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/cat/create" method="post" enctype="multipart/form-data">
                            <table>
                                <tr>
                                    <td>Фотография: </td>
                                    <td style="display: flex; align-items: center; justify-content: center; height: 50px;">
                                        <input type="file" name="image" style="margin-left: 0; text-align: left;"><br><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Описание: </td>
                                    <td style="display: flex; align-items: center; justify-content: center; height: 50px;">
                                        <input type="text" name="description" style="margin-left: 0; text-align: left;"><br><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td> <label for="myCats">Выберите кота: </label></td>
                                    <td style="display: flex; align-items: center; justify-content: center; height: 50px;">
                                        <select id="myCats" name="cat" style="margin-left: 0; text-align: left;">
                                            <#list user.getCats() as cat>
                                                <option value="${cat.id}">${cat.name}</option>
                                            <#else>
                                                <option value="0">У вас нет котов</option>
                                            </#list>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button type="submit" class="btn btn-primary">Добавить</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <#nested/>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/45ae46d285.js" crossorigin="anonymous"></script>
    </body>
    </html>
</#macro>