<#import "login.ftl" as l>
<#include "security.ftl">

<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Price aggregator</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/">Головна сторінка</a>
                </li>
                <#if user?? && currentUserId != -1>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/category">Категорії</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/comparison">Порівняння товарів</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/profile">Профіль</a>
                    </li>
                </#if>
            </ul>

            <div class="navbar-text me-3"><#if user?? && currentUserId != -1>${name}<#else>Увійдіть в систему</#if></div>

            <@l.logout user?? currentUserId/>
        </div>
    </div>
</nav>