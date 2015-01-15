<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Utilities to work with URLs
  -
  - Author: Laurent Pireyn
  -->

<#import "strings.ftl" as s>

<#-- Functions -->

<#function toUrl string>
    <#return s.trim(string?lower_case?replace("[- \\t\\n\\r,;.?!_\\(\\)\\[\\]\\{\\}]+", "-", "r"), "-")>
</#function>
