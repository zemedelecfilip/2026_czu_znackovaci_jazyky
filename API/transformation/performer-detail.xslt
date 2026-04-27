<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:param name="performerId"/>

    <xsl:template match="/festival">
<xsl:variable name="p" select="performers/performer[@id=$performerId]"/>
{
  "id": "<xsl:value-of select="$p/@id"/>",
  "name": "<xsl:value-of select="$p/@name"/>",
  "type": "<xsl:value-of select="$p/@type"/>"<xsl:if test="$p/@genre">,
  "genre": "<xsl:value-of select="$p/@genre"/>"</xsl:if>,
  "performances": [
<xsl:for-each select="program/day/event[@performer=$performerId]">
    {
      "id": "<xsl:value-of select="@id"/>",
      "day": "<xsl:value-of select="../@date"/>",
      "theme": "<xsl:value-of select="../@theme"/>",
      "start": "<xsl:value-of select="@start"/>",
      "end": "<xsl:value-of select="@end"/>",
      "venueId": "<xsl:value-of select="@venue"/>",
      "venue": {
        "id": "<xsl:value-of select="/festival/venues/venue[@id=current()/@venue]/@id"/>",
        "name": "<xsl:value-of select="/festival/venues/venue[@id=current()/@venue]/name"/>",
        "description": "<xsl:value-of select="/festival/venues/venue[@id=current()/@venue]/description"/>",
        "capacity": <xsl:value-of select="/festival/venues/venue[@id=current()/@venue]/capacity"/>
      }
    }<xsl:if test="position()!=last()">,</xsl:if>
</xsl:for-each>
  ]
}
    </xsl:template>
</xsl:stylesheet>