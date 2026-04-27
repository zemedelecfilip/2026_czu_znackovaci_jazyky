<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:param name="eventId"/>

    <xsl:template match="/festival">
<xsl:variable name="e" select="program/day/event[@id=$eventId]"/>
{
  "id": "<xsl:value-of select="$e/@id"/>",
  "day": "<xsl:value-of select="$e/../@date"/>",
  "theme": "<xsl:value-of select="$e/../@theme"/>",
  "start": "<xsl:value-of select="$e/@start"/>",
  "end": "<xsl:value-of select="$e/@end"/>",
  "performerId": "<xsl:value-of select="$e/@performer"/>",
  "venueId": "<xsl:value-of select="$e/@venue"/>",
  "performer": {
    "id": "<xsl:value-of select="/festival/performers/performer[@id=$e/@performer]/@id"/>",
    "name": "<xsl:value-of select="/festival/performers/performer[@id=$e/@performer]/@name"/>",
    "type": "<xsl:value-of select="/festival/performers/performer[@id=$e/@performer]/@type"/>"<xsl:if test="/festival/performers/performer[@id=$e/@performer]/@genre">,
    "genre": "<xsl:value-of select="/festival/performers/performer[@id=$e/@performer]/@genre"/>"</xsl:if>
  },
  "venue": {
    "id": "<xsl:value-of select="/festival/venues/venue[@id=$e/@venue]/@id"/>",
    "name": "<xsl:value-of select="/festival/venues/venue[@id=$e/@venue]/name"/>",
    "description": "<xsl:value-of select="/festival/venues/venue[@id=$e/@venue]/description"/>",
    "capacity": <xsl:value-of select="/festival/venues/venue[@id=$e/@venue]/capacity"/>
  }
}
    </xsl:template>
</xsl:stylesheet>