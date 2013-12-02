<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Utilities to generate Ant files
  -
  - Author: Laurent Pireyn
  -->

<#import "strings.ftl" as strings>

<#-- Functions -->

<#function p name>
    <#return r'${' + name + '}'>
</#function>

<#-- Macros -->

<#macro depends deps>
    <#if (deps?has_content)>
        depends="${strings.join(deps, ', ')}"<#t>
    </#if>
</#macro>
