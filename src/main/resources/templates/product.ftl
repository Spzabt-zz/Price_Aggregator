<#import "parts/doctype.ftl" as doctype>
<#include "parts/security.ftl">

<@doctype.page>

    <#if isAdmin>
        <#include "parts/productEdit.ftl" />
    </#if>

    <form class="mt-3" action="/product/${category_id}" id="productFilter" method="get">
        <div class="input-group mb-3">
            <div class="form-floating">
                <select id="floatingInputPriceSorting" name="filterByPrice" class="form-select"
                        form="productFilter" aria-label="Default select example">
                    <option selected></option>
                    <option value="0">Від дешевих до дорогих</option>
                    <option value="1">Від дорогих до дешевих</option>
                </select>
                <label for="floatingInputPriceSorting">Сортування за ціною</label>
            </div>
            <div class="form-floating">
                <select id="floatingInputBrandSorting" name="filter" class="form-select" form="productFilter"
                        aria-label="Default select example">
                    <option selected></option>
                    <#list brands as brand>
                        <option value="${brand.brandName}">${brand.brandName}</option>
                    <#else>
                        Немає брендів
                    </#list>
                </select>
                <label for="floatingInputBrandSorting">Сортування за брендом</label>
            </div>
            <button class="btn btn-primary" type="submit" id="button-addon2">Пошук</button>
        </div>
    </form>

    <#include "parts/productList.ftl" />

</@doctype.page>