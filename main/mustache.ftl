<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Simplified Mustache engine
  -
  - Author: Laurent Pireyn
  -->

<#-- Functions -->

<#function eval expression hash>
    <#local expression = expression?trim />

    <#if (expression?starts_with('!'))>
        <#-- Comment -->
        <#return "">
    </#if>
    <#if (expression?starts_with('&'))>
        <#local name = expression?substring(1) />
        <#local escape = false />
    <#else>
        <#local name = expression />
        <#local escape = true />
    </#if>

    <#if (!hash[name]??)>
        <#return "">
    </#if>

    <#local value = hash[name] />
    <#if (escape)>
        <#local value = value?html />
    </#if>
    <#return value>
</#function>

<#function processed template hash>
    <#local tokens1 = template?split('{{') />
    <#if (tokens1?size == 1)>
        <#-- No placeholders -->
        <#return template>
    </#if>

    <#local result = tokens1[0] />
    <#list tokens1[1..] as token1>
        <#local tokens2 = token1?split('}}') />
        <#if (tokens2?size != 2)>
            <#stop "Invalid Mustache template">
        </#if>

        <#local result = result + eval(tokens2[0], hash) + tokens2[1] />
    </#list>

    <#return result>
</#function>

<#-- Macros -->

<#macro process hash>
    <#local template><#nested></#local>
    ${processed(template, hash)}<#t>
</#macro>
