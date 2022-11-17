<div class="row row-cols-1 row-cols-md-2 g-4 mt-3" id="message-list">
    <#list products as product>
        <div class="col" data-id="${product.id}">
            <div class="card">
                <#if product.filename??>
                    <img src="/img/${product.filename}" class="card-img-top"/>
                </#if>
                <div class="card-body">
                    <h1 class="card-text">${product.name}</h1>
                    <h5 class="card-text">${product.brandName}</h5>
                    <h5 class="card-text">${product.description}</h5>
                    <h5 class="card-text">${product.price}</h5>
                    <h5 class="card-text">${product.shopName}</h5>
                    <h5 class="card-text">${product.shopUrl}</h5>
                </div>
                <div class="card-footer text-muted container">
                    <div class="row">
                        <a class="col align-self-center"
                           href="/comparison/${product.id}">Add to comparison
                        </a>
                        <br/>
                        <#--<form method="delete">
                            <a class="col btn btn-outline-primary"
                               href="/product/${product.id}">Delete product
                            </a>
                        </form>-->
                        <form action="/product-delete/${product.id}" method="post">
                            <input class="col btn btn-outline-primary" type="submit" value="Delete">
                            <#--<input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <#else>
        No products
    </#list>
</div>