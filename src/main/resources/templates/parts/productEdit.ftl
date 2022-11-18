<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Додати товар
</a>
<div class="collapse <#if product??>show</#if>" id="collapseExample">
    <form id="productAdding" method="post" enctype="multipart/form-data">
        <div class="mt-3">
            <div class="input-group mb-3">
                <input type="text" class="form-control"
                       <#--value="<#if product??>${product.name}</#if>"--> name="name" placeholder="Введіть назву продукту"/>
            </div>
            <div class="input-group mb-3">
                <#--<input type="text" class="form-control"
                       &lt;#&ndash;value="<#if message??>${message.tag}</#if>"&ndash;&gt; name="brandName"
                       placeholder="brand name"/>-->
                <select name="brandName" class="form-select" form="productAdding" aria-label="Default select example">
                    <option selected>Відкрийте список</option>
                    <#list brands as brand>
                        <option value="${brand.brandName}">${brand.brandName}</option>
                    <#else>
                        No brands
                    </#list>
                </select>
                <#--<#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>-->
            </div>
            <div class="input-group mb-3">
                <input type="text" class="form-control"
                       name="description"
                       placeholder="Опис"/>
            </div>
            <div class="input-group mb-3">
                <input type="number" class="form-control"
                       name="price"
                       placeholder="Ціна"/>
            </div>
            <div class="input-group mb-3">
                <input type="text" class="form-control"
                       name="shopName"
                       placeholder="Назва магазину"/>
            </div>
            <div class="input-group mb-3">
                <input type="url" class="form-control"
                       name="shopUrl"
                       placeholder="Посилання на магазин"/>
            </div>
            <div class="input-group mb-3">
                <input class="form-control" id="inputGroupFile02" type="file" name="file"/>
                <label class="input-group-text" for="inputGroupFile02">Завнтажити</label>
            </div>
            <#--<input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
            <#--<input type="hidden" name="id" value="<#if product??>${product.id}<#else>-1</#if>"/>-->
            <div class="input-group mb-3">
                <button class="btn btn-primary" type="submit">Додати</button>
            </div>
        </div>
    </form>
</div>
<#--
${product.filename}
<h1 class="card-text">${product.name}</h1>
<h5 class="card-text">${product.brandName}</h5>
<h5 class="card-text">${product.description}</h5>
<h5 class="card-text">${product.price}</h5>
<h5 class="card-text">${product.shopName}</h5>
<h5 class="card-text">${product.shopUrl}</h5>-->
