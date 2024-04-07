<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous">

<nav class="navbar navbar-expand-lg navbar-light bg-light navbar fixed-top bg-light">
    <a class="navbar-brand" href="#">Котограм</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button"
                        onclick="window.location.href = '/login'">
                    Войти
                </button>
            </li>
            <li class="nav-item">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button"
                        onclick="window.location.href = '/registration'">
                    Зарегистрироваться
                </button>
            </li>
            <li class="nav-item">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button"
                        onclick="window.location.href = '/registration'">
                    Личный кабинет
                </button>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Введите email" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Найти</button>
        </form>
    </div>
</nav>

<head>
    <title>Items</title>
</head>
<body>
<h1>Items</h1>
<#list items as item>
    <div>
<#--        <p><b>${item.description}</b></p>-->
        <img src="/images/${item.id}" height="200px">
        <form action="/items/${item.id}" method="get">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
<#--            <input type="hidden" name="itemId" value=${item.id}/>-->
            <input type="submit" value="Подробнее"/>
        </form>
    </div>
</#list>
<#if user.getEmail()??>
<form action="/items/create" method="post" enctype="multipart/form-data">
    Фотка: <input type="file" name="image"><br><br>
    Описание: <input type="text" name="description"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Добавить фото"/>
</form>
</#if>
</body>
</html>
