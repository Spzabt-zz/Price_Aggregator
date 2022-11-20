<#import "parts/doctype.ftl" as doctype>

<@doctype.page>
    <#--<table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Фото</th>
            <th scope="col">Назва</th>
            <th scope="col">Бренд</th>
            <th scope="col">Опис</th>
            <th scope="col">Ціна</th>
            <th scope="col">Магазин</th>
            <th scope="col">Посилання на магазин</th>
            <th scope="col">Деталі товару</th>
            <th scope="col">Видалити з порівняння</th>
        </tr>
        </thead>
        <tbody>
        <#list products as product>
            <tr>
                <th scope="row">
                    ${product.product.id}
                </th>
                <td>
                    <#if product.product.filename??>
                        <img src="/img/${product.product.filename}" class="card-img-top"/>
                    </#if>
                </td>
                <td>${product.product.name}</td>
                <td>${product.product.brandName}</td>
                <td>${product.product.description}</td>
                <td>${product.product.price}$</td>
                <td>${product.product.shopName}</td>
                <td>
                    <a class="card-text" href="${product.product.shopUrl}">${product.product.shopUrl}</a>
                </td>
                <td>
                    <a href="/product-details/${product.product.id}" class="btn btn-primary">Деталі товару</a>
                </td>
                <td>
                    <form action="/comparison-delete/${product.product.id}" method="post">
                        <input class="col btn btn-outline-secondary" type="submit" value="Видалити з порівняння">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </td>

            </tr>
        <#else>
            Немає продуктів
        </#list>
        </tbody>
    </table>-->

    <div class="card-group" id="message-list">
        <#list products as product>
                <div class="card">
                    <#if product.product.filename??>
                        <img src="/img/${product.product.filename}" class="card-img-top"/>
                    </#if>
                    <div class="card-body">
                        <h1 class="card-title">${product.product.name}</h1>
                        <h5 class="card-text">Бренд - ${product.product.brandName}</h5>
                        <h5 class="card-text">Опис: ${product.product.description}</h5>
                        <h5 class="card-text">Ціна - ${product.product.price}$</h5>
                        <h5 class="card-text">Магазин - ${product.product.shopName}</h5>
                        <h5>Посилання на магазин -
                            <a class="card-text" href="${product.product.shopUrl}">${product.product.shopUrl}</a>
                        </h5>
                        <a href="/product-details/${product.product.id}" class="btn btn-primary">Деталі товару</a>
                    </div>
                    <div class="card-footer text-muted container">
                        <form action="/comparison-delete/${product.product.id}" method="post">
                            <input class="col btn btn-outline-secondary" type="submit" value="Видалити з порівняння">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
        <#else>
            Немає продуктів
        </#list>
    </div>

    <#--<div class="row row-cols-1 row-cols-md-2 g-4 mt-3" id="message-list">
        <#list products as product>
            <div class="col" data-id="${product.id}">
                <div class="card">
                    <#if product.product.filename??>
                        <img src="/img/${product.product.filename}" class="card-img-top"/>
                    </#if>
                    <div class="card-body">
                        <h1 class="card-title">${product.product.name}</h1>
                        <h5 class="card-text">Бренд - ${product.product.brandName}</h5>
                        <h5 class="card-text">Опис: ${product.product.description}</h5>
                        <h5 class="card-text">Ціна - ${product.product.price}$</h5>
                        <h5 class="card-text">Магазин - ${product.product.shopName}</h5>
                        <h5>Посилання на магазин -
                            <a class="card-text" href="${product.product.shopUrl}">${product.product.shopUrl}</a>
                        </h5>
                        <a href="/product-details/${product.product.id}" class="btn btn-primary">Деталі товару</a>
                    </div>
                    <div class="card-footer text-muted container">
                        <form action="/comparison-delete/${product.product.id}" method="post">
                            <input class="col btn btn-outline-secondary" type="submit" value="Видалити з порівняння">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
            </div>
        <#else>
            Немає продуктів
        </#list>
    </div>-->

</@doctype.page>