<#import "parts/doctype.ftl" as doctype>
<#import "parts/login.ftl" as l>

<@doctype.page>
    <div class="mb-1">Додати нового користувача</div>
    <@l.login "/registration" true/>
</@doctype.page>