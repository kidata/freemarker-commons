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
