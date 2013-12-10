<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Utilities to work with FMPP
  -
  - Author: Laurent Pireyn
  -->

<#import "strings.ftl" as strings>

<#-- Functions -->

<#function getOrCreateSequence hash key>
    <#if (!hash[key]??)>
        <@pp.set hash=hash key=key value=pp.newWritableSequence() />
    </#if>
    <#return hash[key]>
</#function>

<#function getOrCreateHash hash key>
    <#if (!hash[key]??)>
        <@pp.set hash=hash key=key value=pp.newWritableHash() />
    </#if>
    <#return hash[key]>
</#function>

<#-- Macros -->

<#macro setAll destHash srcHash>
    <#list srcHash?keys as key>
        <@pp.set hash=destHash key=key value=srcHash[key] />
    </#list>
</#macro>
