<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Add product
</a>
<div class="collapse <#if product??>show</#if>" id="collapseExample">
    <form method="post" enctype="multipart/form-data">
        <div class="mt-3">
            <div class="input-group mb-3">
                <input type="text" class="form-control"
                       <#--value="<#if product??>${product.name}</#if>"--> name="name" placeholder="Enter product name"/>
            </div>
            <div class="input-group mb-3">
                <input type="text" class="form-control"
                       <#--value="<#if message??>${message.tag}</#if>"--> name="brandName"
                       placeholder="brand name"/>
                <#--<#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>-->
            </div>
            <div class="input-group mb-3">
                <input type="text" class="form-control"
                       name="description"
                       placeholder="description"/>
            </div>
            <div class="input-group mb-3">
                <input type="text" class="form-control"
                       name="price"
                       placeholder="price"/>
            </div>
            <div class="input-group mb-3">
                <input type="text" class="form-control"
                       name="shopName"
                       placeholder="shop name"/>
            </div>
            <div class="input-group mb-3">
                <input type="url" class="form-control"
                       name="shopUrl"
                       placeholder="shop url"/>
            </div>
            <div class="input-group mb-3">
                <input class="form-control" id="inputGroupFile02" type="file" name="file"/>
                <label class="input-group-text" for="inputGroupFile02">Upload</label>
            </div>
            <#--<input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
            <#--<input type="hidden" name="id" value="<#if product??>${product.id}<#else>-1</#if>"/>-->
            <div class="input-group mb-3">
                <button class="btn btn-primary" type="submit">Add</button>
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
