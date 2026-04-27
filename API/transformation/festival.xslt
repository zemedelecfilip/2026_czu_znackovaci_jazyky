<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/festival">
{
  "id": "drumce-na-kopecku-<xsl:value-of select="@year"/>",
  "name": "<xsl:value-of select="@name"/>",
  "year": <xsl:value-of select="@year"/>,
  "location": {
    "country": "<xsl:value-of select="@location"/>",
    "venueArea": "areál ČZU",
    "address": "Kamýcká 129, 165 00 Praha-Suchdol"
  },
  "description": "Třídenní open-air hudební festival zaměřený na českou hudební scénu, propojující rock, rap a mladé talenty ze středních škol, učilišť a hudebních akademií.",
  "dates": {
    "start": "<xsl:value-of select="program/day[1]/@date"/>",
    "end": "<xsl:value-of select="program/day[last()]/@date"/>",
    "days": [
<xsl:for-each select="program/day">
      {
        "date": "<xsl:value-of select="@date"/>",
        "theme": "<xsl:value-of select="@theme"/>"
      }<xsl:if test="position()!=last()">,</xsl:if>
</xsl:for-each>
    ]
  },
  "tickets": {
    "currency": "CZK",
    "categories": [
      {
        "code": "full-pass",
        "name": "Full Festival Pass",
        "price": 1490,
        "validFrom": "<xsl:value-of select="program/day[1]/@date"/>",
        "validTo": "<xsl:value-of select="program/day[last()]/@date"/>"
      },
      {
        "code": "day-pass-friday",
        "name": "Pátek / Rock Day",
        "price": 690,
        "validFrom": "<xsl:value-of select="program/day[1]/@date"/>",
        "validTo": "<xsl:value-of select="program/day[1]/@date"/>"
      },
      {
        "code": "day-pass-saturday",
        "name": "Sobota / Rap Day",
        "price": 690,
        "validFrom": "<xsl:value-of select="program/day[2]/@date"/>",
        "validTo": "<xsl:value-of select="program/day[2]/@date"/>"
      },
      {
        "code": "day-pass-sunday",
        "name": "Neděle / Open Mix Day",
        "price": 590,
        "validFrom": "<xsl:value-of select="program/day[3]/@date"/>",
        "validTo": "<xsl:value-of select="program/day[3]/@date"/>"
      }
    ]
  },
  "links": {
    "self": "/api/festival",
    "venues": "/api/venues",
    "performers": "/api/performers",
    "events": "/api/events",
    "website": "/index.html",
    "program": "/program.html",
    "info": "/prakticke_informace.html"
  }
}
    </xsl:template>
</xsl:stylesheet>