<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Utilities to work with strings
  -
  - Author: Laurent Pireyn
  -->

<#-- Functions -->

<#function isEmpty string>
    <#return !string?has_content>
</#function>

<#function isBlank string>
    <#return isEmpty(string?trim)>
</#function>

<#function contains string part>
    <#return string?index_of(part) != -1>
</#function>

<#function defaultIfEmpty string defaultString>
    <#if (isEmpty(string))>
        <#return defaultString />
    </#if>
    <#return string>
</#function>

<#function defaultIfBlank string defaultString>
    <#if (isBlank(string))>
        <#return defaultString />
    </#if>
    <#return string>
</#function>

<#function toBoolean string>
    <#return string?lower_case == "true" />
</#function>

<#function toNumber string>
    <#return string?number />
</#function>

<#function repeat string count>
    <#local result = "" />
    <#if (count > 0)>
        <#list 1..count as index>
            <#local result = result + string />
        </#list>
    </#if>
    <#return result>
</#function>

<#function join sequence separator="">
    <#local result = "" />
    <#list sequence as element>
        <#local result = result + element />
        <#if (element_has_next && !isEmpty(separator))>
            <#local result = result + separator />
        </#if>
    </#list>
    <#return result>
</#function>
