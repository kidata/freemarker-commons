<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Utilities to write JSON
  -
  - Author: Laurent Pireyn
  -->

<#import "core.ftl" as c>
<#import "strings.ftl" as s>
<#import "dates.ftl" as d>

<#-- Constants -->

<#assign LEVEL_INDENT = 4 />
<#assign LEVEL_INDENT_STRING = s.repeat(" ", LEVEL_INDENT) />

<#-- Macros -->

<#macro indent level>
    ${s.repeat(LEVEL_INDENT_STRING, level)}<#t>
</#macro>

<#macro null level=0>
    <@indent level />null<#t>
</#macro>

<#macro boolean value level=0>
    <@indent level />${value?string}<#t>
</#macro>

<#macro number value level=0>
    <@indent level />${value?c}<#t>
</#macro>

<#macro string value level=0>
    <@indent level />"${value?j_string}"<#t>
</#macro>

<#macro date value level=0>
    <@string d.toIso8601(value) level /><#t>
</#macro>

<#macro array value level=0>
    <@indent level />[<#lt>
    <#list value as element>
        <@any element level + 1 /><#if (element_has_next)>,</#if><#lt>
    </#list>
    <@indent level />]<#t>
</#macro>

<#macro object value level=0>
    <@indent level />{<#lt>
    <#list value?keys as key>
        <@string key level + 1 />: <@any value[key] /><#if (key_has_next)>,</#if><#lt>
    </#list>
    <@indent level />}<#t>
</#macro>

<#macro any value level=0>
    <#local type = c.typeOf(value) />
    <#switch type>
        <#case "boolean">
            <@boolean value level />
            <#break>
        <#case "number">
            <@number value level />
            <#break>
        <#case "string">
            <@string value level />
            <#break>
        <#case "date">
            <@date value level />
            <#break>
        <#case "sequence">
            <@array value level />
            <#break>
        <#case "hash">
            <@object value level />
            <#break>
        <#default>
            <#stop "Cannot convert value of type " + type + " to JSON">
    </#switch>
</#macro>
