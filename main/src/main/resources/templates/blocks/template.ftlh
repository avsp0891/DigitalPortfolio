<#macro template user url>
    <!doctype html>
    <html lang="ru">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<#--        <link rel="stylesheet" href="/static/css/style.css">-->

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">

        <title>Kotogram</title>
    </head>
    <body>

    <header>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar fixed-top bg-light">
                <a class="navbar-brand" href="/">Kotogram</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <#if user.email??>
                        <#if url != '/profile'>
                            <li class="nav-item">
                                <button class="btn btn-outline-success" type="button"
                                        onclick="window.location.href = '/profile'">
                                    Личный кабинет
                                </button>
                            </li>
                        </#if>
                        <li class="nav-item">
                            <form action="/logout" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button class="btn btn-outline-success" type="submit">
                                    Выйти
                                </button>
                            </form>
                        </li>
                        <#else>
                        <li class="nav-item">
                            <button class="btn btn-outline-success" type="button"
                                    onclick="window.location.href = '/login'">
                                Войти
                            </button>
                        </li>
                        <li class="nav-item">
                            <button class="btn btn-outline-success" type="button"
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

    <div class="container images-wrap image-flex">
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
    </body>
    </html>
</#macro>