<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Utilities to work with paths
  -
  - Author: Laurent Pireyn
  -->

<#import "strings.ftl" as s>

<#-- Functions -->

<#function parent path>
    <#if (s.isEmpty(path))>
        <#return "">
    </#if>
    <#local index = path?last_index_of("/") />
    <#if (index == -1)>
        <#return "">
    </#if>
    <#return path?substring(0, index)>
</#function>

<#function fileName path>
    <#if (s.isEmpty(path))>
        <#return "">
    </#if>
    <#local index = path?last_index_of("/") />
    <#if (index == -1)>
        <#return path>
    </#if>
    <#return path?substring(index + 1)>
</#function>

<#function baseName fileName>
    <#local index = fileName?last_index_of(".") />
    <#if (index == -1)>
        <#-- No extension -->
        <#return fileName>
    </#if>
    <#return fileName?substring(0, index)>
</#function>

<#function extension fileName>
    <#local index = fileName?last_index_of(".") />
    <#if (index == -1)>
        <#-- No extension -->
        <#return "">
    </#if>
    <#return fileName?substring(index + 1)>
</#function>

<#function absolute path>
    <#if (path?starts_with("/"))>
        <#return path>
    </#if>
    <#return "/" + path>
</#function>

<#function split path>
    <#-- Trim leading / -->
    <#if (path?starts_with("/"))>
        <#local path = path?substring(1) />
    </#if>
    <#-- Trim trailing / -->
    <#if (path?ends_with("/"))>
        <#local path = path?substring(0, path?length - 1) />
    </#if>
    <#-- Empty path results in empty sequence -->
    <#if (s.isEmpty(path))>
        <#return []>
    </#if>
    <#-- Split path -->
    <#return path?split("/")>
</#function>
