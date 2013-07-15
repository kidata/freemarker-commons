<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Utilities to work with dates
  -
  - Author: Laurent Pireyn
  -->

<#-- Constants -->

<#-- See http://en.wikipedia.org/wiki/ISO_8601 -->
<#assign ISO_8601_PATTERN = "yyyy-MM-dd'T'HH:mmZ" />

<#-- Functions -->

<#function toIso8601 date>
    <#return date?string(ISO_8601_PATTERN)>
</#function>

<#function fromIso8601 string>
    <#return string?date(ISO_8601_PATTERN)>
</#function>
