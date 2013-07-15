<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Simplified Mustache engine
  -
  - Author: Laurent Pireyn
  -->

<#-- Functions -->

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

        <#local name = tokens2[0]?trim />
        <#if (hash[name]??)>
            <#local result = result + hash[name]?html />
        </#if>

        <#local result = result + tokens2[1] />
    </#list>

    <#return result>
</#function>

<#-- Macros -->

<#macro process hash>
    <#local template><#nested></#local>
    ${processed(template, hash)}<#t>
</#macro>
