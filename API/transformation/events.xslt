<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/festival">
{
  "page": 1,
  "pageSize": <xsl:value-of select="count(program/day/event)"/>,
  "totalItems": <xsl:value-of select="count(program/day/event)"/>,
  "totalPages": 1,
  "filters": {
    "day": null,
    "venueId": null,
    "performerId": null
  },
  "items": [
<xsl:for-each select="program/day/event">
    {
      "id": "<xsl:value-of select="@id"/>",
      "day": "<xsl:value-of select="../@date"/>",
      "theme": "<xsl:value-of select="../@theme"/>",
      "start": "<xsl:value-of select="@start"/>",
      "end": "<xsl:value-of select="@end"/>",
      "performerId": "<xsl:value-of select="@performer"/>",
      "venueId": "<xsl:value-of select="@venue"/>"
    }<xsl:if test="position()!=last()">,</xsl:if>
</xsl:for-each>
  ]
}
    </xsl:template>
</xsl:stylesheet>