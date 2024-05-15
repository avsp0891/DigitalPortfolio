<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <script>
        window.onbeforeunload = function() {
            sessionStorage.setItem('scrollPosition', window.scrollY);
        };
    </script>
    <script>
        window.onload = function() {
            if (sessionStorage.scrollPosition) {
                window.scrollTo(0, sessionStorage.getItem('scrollPosition'));
            }
        };
    </script>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center">Изображения тут</h1>
    <#list items as item>
        <hr>
        <div>
            <img src="/images/${item.id}" height="600px" class="mx-auto d-block">
            <p>Количество лайков:  <span id="likeCount-${item.id}"></span></p>
            <script>
                const url${item.id} = '/likes/${item.id}';
                const likeCountElement_${item.id} = document.getElementById('likeCount-${item.id}');
                fetch(url${item.id})
                    .then(response => response.json())
                    .then(data => {
                        likeCountElement_${item.id}.textContent = data.likes;
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            </script>
        </div>
        <div>



<#--            <i class="fa-regular fa-heart"></i>-->
<#--            <i class="fa-solid fa-heart"></i>-->
        </div>
        <div class="row super">
            <div class="mt-3 mx-auto d-block">
                <button class="btn btn-outline-success " type="button"
                        onclick="window.location.href = '/items/${item.id}'">
                    Подробнее
                </button>
                <#if user.getEmail()??>
                <form action="/items/${item.id}/likes/add" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button class="btn btn-outline-success" type="submit">
                            Поставить лайк
                        </button>
                </form>
                </#if>
            </div>
        </div>
    </#list>
</@t.template>
