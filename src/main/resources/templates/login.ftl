<#import "parts/doctype.ftl" as doctype>
<#import "parts/login.ftl" as l>

<@doctype.page>
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>
    <@l.login "/login" false/>
</@doctype.page>