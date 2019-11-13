<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>

  <h1>1-1</h1>
   <xsl:for-each select="//track">
      <xsl:if test="@length='4:04'">
         <li>
            <xsl:value-of select="."/>
         </li>
      </xsl:if>
   </xsl:for-each>

  <h1>1-2</h1>
   <xsl:for-each select="//track">
      <xsl:if test="string-length('.') &lt; 15">
         <li>
           <xsl:value-of select="."/>
         </li>
      </xsl:if>
   </xsl:for-each>

  <h1>1-3</h1>
   <xsl:for-each select="//track">
      <xsl:if test="position() mod 2 = 0">
         <li>
           <td><xsl:value-of select="."/></td>
         </li>
      </xsl:if>
   </xsl:for-each>

  <h1>2-1</h1>
   <xsl:for-each select="//track">
      <xsl:choose>
         <!-- big string -->
         <xsl:when test="string-length(.) &gt; 15">
            <li>
              <xsl:value-of select="."/> : big string
            </li>         
         </xsl:when>
         <!-- small string -->
         <xsl:when test="string-length(.) &lt; 15">
            <li>
              <xsl:value-of select="."/> : small string
            </li>         
         </xsl:when>
         <!-- medium string -->
         <xsl:otherwise>
            <li>
               <xsl:value-of select="."/> : medium string
            </li>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:for-each>


  </body>
  </html>
</xsl:template>

</xsl:stylesheet>