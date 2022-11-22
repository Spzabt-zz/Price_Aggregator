<#include "security.ftl">

<#if message??>
    <div class="alert alert-${messageType}" role="alert">
        ${message}
    </div>
</#if>
<div class="row row-cols-1 row-cols-md-2 g-4 mt-3" id="message-list">
    <#list products as product>
        <div class="col" data-id="${product.id}">
            <div class="card">
                <#if product.filename??>
                    <img src="/img/${product.filename}" class="card-img-top"/>
                </#if>
                <div class="card-body">
                    <h1 class="card-title">${product.name}</h1>
                    <h5 class="card-text">${product.brandName}</h5>
                    <h5 class="card-text">${product.price}$</h5>
                    <a href="/product-details/${product.id}" class="btn btn-primary">Деталі товару</a>
                </div>
                <div class="card-footer text-muted container">
                    <form action="/comparison/${product.id}" method="post">
                        <input class="col btn btn-outline-primary mb-2" type="submit" value="Додати до порівняння">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                    <#if isAdmin>
                        <form action="/product-delete/${product.id}" method="post">
                            <input class="col btn btn-outline-secondary" type="submit" value="Видалити">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </#if>
                </div>
            </div>
        </div>
    <#else>
        Немає продуктів
    </#list>
</div>