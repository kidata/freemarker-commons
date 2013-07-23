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

<h2>Strings</h2>

<#import "../main/strings.ftl" as strings>

<@assert (strings.prefixTrim('abc') == 'abc') "Prefix trimmed string without trimmable characters" />
<@assert (strings.prefixTrim(' \tabc') == 'abc') "Prefix trimmed string with trimmable characters '"+strings.prefixTrim(' \tabc')+"'" />
<@assert (strings.suffixTrim('abc') == 'abc') "Suffix trimmed string without trimmable characters" />
<@assert (strings.suffixTrim('abc \t') == 'abc') "Suffix trimmed string with trimmable characters" />
<@assert (strings.trim('abc') == 'abc') "Trimmed string without trimmable characters" />
<@assert (strings.trim(' \tabc \t') == 'abc') "Trimmed string with trimmable characters" />
<@assert (strings.pluralized(1, 'dog') == '1 dog') "Pluralized word with count of 1" />
<@assert (strings.pluralized(0, 'dog') == '0 dogs') "Pluralized word with count of 0" />
<@assert (strings.pluralized(2, 'dog') == '2 dogs') "Pluralized word with count of 2" />
<@assert (strings.pluralized(2, 'mouse', 'mice') == '2 mice') "Pluralized word with count of 2 and specific plural" />

<h2>URLs</h2>

<#import "../main/urls.ftl" as urls>

<@assert (urls.toUrl('This is a Test! Oh really???') == 'this-is-a-test-oh-really') "String converted to URL" />

<h2>Mustache</h2>

<#import "../main/mustache.ftl" as mustache>

<#assign hash = {
    'abc': '<p>'
} />

<@assert (mustache.eval('x', hash) == '') "Variable not found" />
<@assert (mustache.eval('!abc', hash) == '') "Comment" />
<@assert (mustache.eval('abc', hash) == '&lt;p&gt;') "Escaped variable" />
<@assert (mustache.eval('&abc', hash) == '<p>') "Unescaped variable" />

</body>

</html>
