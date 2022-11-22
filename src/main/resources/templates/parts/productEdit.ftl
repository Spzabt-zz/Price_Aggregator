<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Додати товар
</a>
<div class="collapse <#if product??>show</#if>" id="collapseExample">
    <form id="productAdding" method="post" enctype="multipart/form-data">
        <div class="mt-3">
            <div class="input-group mb-3">
                <input type="text" class="form-control ${(nameError??)?string('is-invalid', '')}"
                       name="name" placeholder="Введіть назву продукту"/>
                <#if nameError??>
                    <div class="invalid-feedback">
                        ${nameError}
                    </div>
                </#if>
            </div>
            <div class="input-group mb-3">
                <select name="brandName" class="form-select ${(brandNameError??)?string('is-invalid', '')}"
                        form="productAdding" aria-label="Default select example">
                    <option selected>Відкрийте список</option>
                    <#list brands as brand>
                        <option value="${brand.brandName}">${brand.brandName}</option>
                    <#else>
                        No brands
                    </#list>
                </select>
                <#if brandNameError??>
                    <div class="invalid-feedback">
                        ${brandNameError}
                    </div>
                </#if>
            </div>
            <div class="input-group mb-3">
                <input type="text" class="form-control ${(descriptionError??)?string('is-invalid', '')}"
                       name="description"
                       placeholder="Опис"/>
                <#if descriptionError??>
                    <div class="invalid-feedback">
                        ${descriptionError}
                    </div>
                </#if>
            </div>
            <div class="input-group mb-3">
                <input type="number" class="form-control ${(priceError??)?string('is-invalid', '')}"
                       name="price"
                       placeholder="Ціна"/>
                <#if priceError??>
                    <div class="invalid-feedback">
                        ${priceError}
                    </div>
                </#if>
            </div>
            <div class="input-group mb-3">
                <input type="text" class="form-control ${(shopNameError??)?string('is-invalid', '')}"
                       name="shopName"
                       placeholder="Назва магазину"/>
                <#if shopNameError??>
                    <div class="invalid-feedback">
                        ${shopNameError}
                    </div>
                </#if>
            </div>
            <div class="input-group mb-3">
                <input type="url" class="form-control"
                       name="shopUrl ${(shopUrlError??)?string('is-invalid', '')}"
                       placeholder="Посилання на магазин"/>
                <#if shopUrlError??>
                    <div class="invalid-feedback">
                        ${shopUrlError}
                    </div>
                </#if>
            </div>
            <div class="input-group mb-3">
                <input class="form-control" id="inputGroupFile02" type="file" name="file"/>
                <label class="input-group-text" for="inputGroupFile02">Завнтажити</label>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="input-group mb-3">
                <button class="btn btn-primary" type="submit">Додати</button>
            </div>
        </div>
    </form>
</div>
