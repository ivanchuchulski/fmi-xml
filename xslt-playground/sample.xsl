<?xml version="1.0"?>

<xsl:stylesheet 
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<h1>CD Collection</h1>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th style="text-align:left">Title</th>
						<th style="text-align:left">Artist</th>
						<th style="text-align:left">Country</th>
						<th style="text-align:left">Year</th>
					</tr>
					<!-- some xsl magic here -->
					<xsl:for-each select="catalog/cd">
					<tr>
						<td><xsl:value-of select="title"></xsl:value-of></td>
						<td><xsl:value-of select="artist"></xsl:value-of></td>
						<td><xsl:value-of select="country"></xsl:value-of></td>
						<td><xsl:value-of select="year"></xsl:value-of></td>
					</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>	
	</xsl:template>
</xsl:stylesheet>