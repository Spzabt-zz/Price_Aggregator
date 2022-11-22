<#import "parts/doctype.ftl" as doctype>
<#include "parts/security.ftl">

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
                <a class="card-text" href="${product.shopUrl}">${product.shopUrl}</a>
            </h5>
        </div>
    </div>
    <ol class="list-group list-group-numbered mt-3">
        <#if comments??>
            <#list comments as comment>
                <li class="list-group-item d-flex justify-content-between align-items-start">
                    <div class="ms-2 me-auto">
                        <div class="fw-bold">${comment.user.username}</div>
                        ${comment.text}
                    </div>
                    <#if comment.user.id == currentUserId>
                        <form action="/comment-delete/${comment.id}" method="post">
                            <input class="col btn btn-outline-secondary btn-sm" type="submit" value="Видалити коментар">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </#if>
                </li>
            <#else>
                Немає коментарів
            </#list>
        </#if>
    </ol>
    <form id="leaveComment" action="/product-details/${product.id}" method="post">
        <div class="form-floating mt-3">
            <textarea name="comment" class="form-control" placeholder="Залиште коментар тут" form="leaveComment"
                      id="floatingTextarea2"
                      style="height: 100px"></textarea>
            <label for="floatingTextarea2">Коментарі</label>
            <#if message??>
                <div class="alert alert-${messageType}" role="alert">
                    ${message}
                </div>
            </#if>
        </div>
        <button class="btn btn-primary mt-3" type="submit" id="button-addon2">Надіслати</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>

</@doctype.page>