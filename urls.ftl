<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Utilities to work with URLs
  -
  - Author: Laurent Pireyn
  -->

<#-- Functions -->

<#function toUrl string>
    <#return string?trim?lower_case?replace('[- \\t\\n\\r,;.?!_\\(\\)\\[\\]\\{\\}]+', '-', 'r')>
</#function>
