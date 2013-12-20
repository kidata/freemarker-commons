<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Core functions and macros
  -
  - Author: Laurent Pireyn
  -->

<#-- Functions -->

<#function typeOf value>
    <#if (value?is_boolean)>
        <#return "boolean">
    </#if>
    <#if (value?is_number)>
        <#return "number">
    </#if>
    <#if (value?is_string)>
        <#return "string">
    </#if>
    <#if (value?is_date)>
        <#return "date">
    </#if>
    <#if (value?is_sequence)>
        <#return "sequence">
    </#if>
    <#if (value?is_hash || value?is_hash_ex)>
        <#return "hash">
    </#if>
    <#if (value?is_method)>
        <#return "method">
    </#if>
    <#if (value?is_macro)>
        <#return "macro">
    </#if>
    <#if (value?is_directive)>
        <#return "directive">
    </#if>
    <#if (value?is_node)>
        <#return "node">
    </#if>
    <#if (value?is_transform)>
        <#return "transform">
    </#if>
    <#return "unknown">
</#function>

<#function toSequence value>
    <#if (value?is_sequence)>
        <#return value>
    </#if>
    <#return [value]>
</#function>

<#function subHash hash prefix stripPrefix=false>
    <#local result = {} />
    <#list hash?keys as key>
        <#if (key?starts_with(prefix))>
            <#if (stripPrefix)>
                <#local newKey = key?substring(prefix?length) />
            <#else>
                <#local newKey = key />
            </#if>
            <#local result = result + {newKey: hash[key]} />
        </#if>
    </#list>
    <#return result>
</#function>
