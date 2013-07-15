<#ftl encoding="UTF-8" strip_text=true>

<#--
  - Utilities to write XML
  -
  - Author: Laurent Pireyn
  -->

<#import "strings.ftl" as s>

<#-- Macros -->

<#macro declaration encoding="">
    <?xml version="1.0" encoding="${s.defaultIfEmpty(encoding, .output_encoding)}"?><#t>
</#macro>
