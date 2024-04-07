<#import "blocks/template.ftlh" as t>
<@t.template user url>
    <div class="mt-5" style="height: 60px">
    </div>
    <h1 style="text-align: center">Изображения тут</h1>
    <#list items as item>
        <hr>
<#--        <div class="form-group">-->
<#--            <div class="container">-->
<#--                <div class="row" >-->
                    <div class="images-wrap image-flex">
<#--                        <img class="image-center" src="/images/${item.id}" height="600px">-->
                        <img src="/images/${item.id}" height="600px">
                    </div>
<#--                </div>-->
                <div class="row">
                    <div class="col-md-4">
                        <button class="btn btn-outline-success" type="button"
                                onclick="window.location.href = '/items/${item.id}'">
                            Подробнее
                        </button>
                    </div>
                </div>
<#--            </div>-->
<#--        </div>-->
    </#list>
</@t.template>
