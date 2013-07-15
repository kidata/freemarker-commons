<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Functions that provide string representations of values, like the Java toString method
  -
  - Author: Laurent Pireyn
  -->

<#import "core.ftl" as c>
<#import "dates.ftl" as d>

<#-- Functions -->

<#function boolean value>
    <#return value?string>
</#function>

<#function number value>
    <#return value?c>
</#function>

<#function string value>
    <#return "\"" + value?j_string + "\"">
</#function>

<#function date value>
    <#return "date(" + d.toIso8601(value) + ")">
</#function>

<#function sequence value>
    <#local result = "[" />
    <#list value as element>
        <#local result = result + any(element) />
        <#if (element_has_next)>
            <#local result = result + ", " />
        </#if>
    </#list>
    <#return result + "]">
</#function>

<#function hash value>
    <#local result = "{" />
    <#list value?keys as key>
        <#local result = result + string(key) + ": " + any(value[key]) />
        <#if (key_has_next)>
            <#local result = result + ", " />
        </#if>
    </#list>
    <#return result + "}">
</#function>

<#function any value>
    <#local type = c.typeOf(value) />
    <#switch type>
        <#case "boolean">
            <#return boolean(value)>
        <#case "number">
            <#return number(value)>
        <#case "string">
            <#return string(value)>
        <#case "date">
            <#return date(value)>
        <#case "sequence">
            <#return sequence(value)>
        <#case "hash">
            <#return hash(value)>
        <#default>
            <#return type>
    </#switch>
</#function>
