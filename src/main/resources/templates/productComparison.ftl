<#import "parts/doctype.ftl" as doctype>

<@doctype.page>

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

</@doctype.page>