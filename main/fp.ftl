<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Utilities for functional programming
  -
  - Author: Laurent Pireyn
  -->

<#-- Functions -->

<#function truePredicate value>
    <#return true>
</#function>

<#function falsePredicate value>
    <#return false>
</#function>

<#function identity value>
    <#return value>
</#function>

<#function add value1 value2>
    <#return value1 + value2>
</#function>

<#function subtract value1 value2>
    <#return value1 - value2>
</#function>

<#function multiply value1 value2>
    <#return value1 * value2>
</#function>

<#function divide value1 value2>
    <#return value1 / value2>
</#function>

<#function filter seq predicate>
    <#local result = [] />
    <#list seq as elem>
        <#if (predicate(elem))>
            <#local result = result + [elem] />
        </#if>
    </#list>
    <#return result>
</#function>

<#function map seq function>
    <#local result = [] />
    <#list seq as elem>
        <#local result = result + [function(elem)] />
    </#list>
    <#return result>
</#function>

<#function fold seq function initial>
    <#local result = initial />
    <#list seq as elem>
        <#local result = function(result, elem) />
    </#list>
    <#return result>
</#function>
