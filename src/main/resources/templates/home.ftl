<#import "parts/doctype.ftl" as doctype>
<#include "parts/security.ftl">

<@doctype.page>
    <h1>Привіт, <#if username??>${username}<#else>гість. Увійдіть в систему для розблокування навігації.</#if></h1>
    <div class="list-group">
        <a href="/category" class="list-group-item list-group-item-action <#if currentUserId != -1><#else>disabled</#if>">1.
            Вибір категорії комп'терних комплектуючих.</a>
        <a href="/product/2" class="list-group-item list-group-item-action <#if currentUserId != -1><#else>disabled</#if>">2.
            Показати сторінку зі списком товарів відповідної категорії.</a>
        <a href="/product/2" class="list-group-item list-group-item-action <#if currentUserId != -1><#else>disabled</#if>">3.
            Фільтр параметрів.</a>
        <a href="/product/2" class="list-group-item list-group-item-action <#if currentUserId != -1><#else>disabled</#if>">4.
            Додати товар до порівняння -> Видалити товар з порівняння -> Показати детальну інформацію про товар.</a>
        <a href="/product/2" class="list-group-item list-group-item-action <#if currentUserId != -1><#else>disabled</#if>">5.
            Додати новий товар (якщо адміністратор) -> Видалити товар (якщо адміністратор).</a>
        <a href="/product/2" class="list-group-item list-group-item-action <#if currentUserId != -1><#else>disabled</#if>">6.
            Показати детальну інформацію про товар.</a>
        <a href="/product/2" class="list-group-item list-group-item-action <#if currentUserId != -1><#else>disabled</#if>">7.
            Залишити коментар -> Видалити коментар.</a>
        <a href="/profile" class="list-group-item list-group-item-action <#if currentUserId != -1><#else>disabled</#if>">8.
            Редагувати профіль.</a>
    </div>
</@doctype.page>