<#import "parts/doctype.ftl" as doctype>

<@doctype.page>
    <h5>${username}</h5>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль: </label>
            <div class="col-sm-6">
                <input class="form-control" type="password" name="password" placeholder="Пароль"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email: </label>
            <div class="col-sm-6">
                <input class="form-control" type="email" name="email" placeholder="some@some.com" value="${email!""}"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Зберегти</button>
    </form>
</@doctype.page>