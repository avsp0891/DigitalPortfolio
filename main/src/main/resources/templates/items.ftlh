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
<#--    <h1 style="text-align: center">Последние изображения</h1>-->
    <#list items as item>
        <hr>
        <div>
            <a href="/items/${item.id}"><img src="/images/${item.id}" height="600px" class="mx-auto d-block" style="border:2px solid black; border-radius: 20px"></a>

        </div>
        <div>



<#--            <i class="fa-regular fa-heart"></i>-->
<#--            <i class="fa-solid fa-heart"></i>-->
        </div>
        <div class="row super">
            <div class="mt-3 mx-auto d-block">
                <h4>Количество лайков:  <span id="likeCount-${item.id}"></span></h4>
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
                <#if user.getEmail()??>
                <form action="/items/${item.id}/likes/add" method="post" class="mt-3 mx-auto d-block">
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
