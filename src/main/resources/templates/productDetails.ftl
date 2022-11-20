<#import "parts/doctype.ftl" as doctype>

<@doctype.page>

    <div class="card">
        <#if product.filename??>
            <img src="/img/${product.filename}" class="card-img-top"/>
        </#if>
        <div class="card-body">
            <h1 class="card-title">${product.name}</h1>
            <h5 class="card-text">Бренд - ${product.brandName}</h5>
            <h5 class="card-text">Опис: ${product.description}</h5>
            <h5 class="card-text">Ціна - ${product.price}$</h5>
            <h5 class="card-text">Магазин - ${product.shopName}</h5>
            <h5>Посилання на магазин -
            <a class="card-text" href="${product.shopUrl}" >${product.shopUrl}</a>
            </h5>
        </div>
    </div>

</@doctype.page>