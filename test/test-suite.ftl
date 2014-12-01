<!DOCTYPE html>

<html>

<head>
    <title>FreeMarker Commons test suite</title>
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

<h1>FreeMarker Commons test suite</h1>

<#macro assert expression message="">
    <#if (expression)>
        <p class="assert success">Success: ${message}</p>
    <#else>
        <p class="assert failure">Failure: ${message}</p>
    </#if>
</#macro>

<h2>Core</h2>

<#import "../main/core.ftl" as core>

<#assign result = core.subHash({'a.b': 1, 'x.y': 2, 'a': 3}, 'a.', false) />
<@assert (result?keys?size == 1 && result['a.b']?? && result['a.b'] == 1) "Sub hash with untouched prefix" />
<#assign result = core.subHash({'a.b': 1, 'x.y': 2, 'a': 3}, 'a.', true) />
<@assert (result?keys?size == 1 && result['b']?? && result['b'] == 1) "Sub hash with trimmed prefix" />

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

<h2>FP</h2>

<#import "../main/fp.ftl" as fp>

<#assign result = fp.filter([1, 2, 3], fp.truePredicate) />
<@assert (result?size == 3) "Filter with true predicate" />
<#assign result = fp.filter([1, 2, 3], fp.falsePredicate) />
<@assert (result?size == 0) "Filter with false predicate" />
<#assign result = fp.map([1, 2, 3], fp.identity) />
<@assert (result?size == 3 && result[0] == 1) "Map with identity" />
<@assert (fp.fold([1, 2, 3], fp.add, 0) == 6) "Fold with add" />
<@assert (fp.fold([1, 2, 3], fp.multiply, 1) == 6) "Fold with multiply" />

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
