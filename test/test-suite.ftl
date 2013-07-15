<!DOCTYPE html>

<html>

<head>
    <title>Pi FreeMarker test suite</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            padding: 1em;
        }

        .assert {
            font-weight: bold;
            margin: 0;
            padding: 0.5em 1em 0.5em 1em;
        }

        .success {
            background-color: lightgreen;
        }

        .failure {
            background-color: red;
        }
    </style>
</head>

<body>

<h1>Pi FreeMarker test suite</h1>

<#macro assert expression message="">
    <#if (expression)>
        <p class="assert success">Success: ${message}</p>
    <#else>
        <p class="assert failure">Failure: ${message}</p>
    </#if>
</#macro>

<h2>Mustache</h2>

<#import "../main/mustache.ftl" as mustache>

<#assign hash = {
    'abc': '<p>'
} />

<@assert (mustache.eval('x', hash) == '') "Variable not found" />
<@assert (mustache.eval('abc', hash) == '&lt;p&gt;') "Escaped variable" />
<@assert (mustache.eval('&abc', hash) == '<p>') "Unescaped variable" />

</body>

</html>
