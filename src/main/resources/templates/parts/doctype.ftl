<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <title>Price aggregator</title>
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
        <link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
    </head>
    <body>
    <#include "navbar.ftl">
    <div class="container mt-5">
        <#nested>
    </div>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/jquery-3.6.1.slim.min.js"></script>
    <script src="/static/js/popper.min.js"></script>
    </body>
    </html>
</#macro>
