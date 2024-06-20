<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <script>
        window.onbeforeunload = function () {
            sessionStorage.setItem('scrollPosition', window.scrollY);
        };
    </script>
    <script>
        window.onload = function () {
            if (sessionStorage.scrollPosition) {
                window.scrollTo(0, sessionStorage.getItem('scrollPosition'));
            }
        };
    </script>
    <div class="mt-5" style="height: 60px">
    </div>
    <#list items as item>
        <hr>
        <div>
            <a href="/items/${item.id}">
                <img src="/images/${item.id}" height="600px" width="600px" class="mx-auto d-block"
                     style="border:2px solid black; object-fit: cover; border-radius: 20px">
            </a>
        </div>
        <#if user.getEmail()??>
            <div class="row super">
                <div class="mt-3 mx-auto d-block">
                    <div style="display: flex; justify-content: center; align-items: center;">
                        <form action="/items/${item.id}/likes/add" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button id="myButton" type="submit"
                                    style="font-size: 2rem; background: none; border: none;">
                                <svg id="defaultImage" width="32" height="32" viewBox="0 0 16 16"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path fill="cornflowerblue"
                                          d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"></path>
                                </svg>
                            </button>
                        </form>
                        <h4><span id="likeCount-${item.id}"
                                  style="margin-left: 5px;position: relative;top: 5px;"></span></h4>
                    </div>
                </div>
            </div>
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
        </#if>
    </#list>
</@t.template>
