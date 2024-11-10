<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace=""
  exclude-result-prefixes="#all"
  version="3.0">
  
<!--
    Turn a downloaded WikiBase page into a snippet of XHTML for use in Eleventy.
    
    Ash Clark
    2024
  -->
  
  <xsl:output encoding="UTF-8" indent="no" method="xhtml" omit-xml-declaration="yes"/>
  
 <!--
      PARAMETERS
   -->
 <!--
      GLOBAL VARIABLES
   -->
  
  
 <!--
      FALLBACK TEMPLATES
   -->
  
  <xsl:template match="*" mode="#all">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates select="@*" mode="#current"/>
      <xsl:apply-templates mode="#current"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="@* | text() | comment()" mode="#all">
    <xsl:copy/>
  </xsl:template>
  
  <xsl:template match="processing-instruction()" mode="#all"/>
  
  
 <!--
      TEMPLATES, #default mode
   -->
  
  <xsl:template match="/">
    <xsl:processing-instruction name="eleventy">
      <xsl:text>title="</xsl:text>
      <xsl:value-of select="/html/head/title"/>
      <xsl:text>"</xsl:text>
    </xsl:processing-instruction>
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates select="/html/body/div[@id eq 'content']"/>
  </xsl:template>
  
  <xsl:template match="div[@role eq 'main']">
    <main>
      <xsl:apply-templates select="@* | node()"/>
    </main>
  </xsl:template>
  
  <xsl:template match="h2 | h3 | h4 | h5 | h6">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates select="span[@class eq 'mw-headline']/@*"/>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="span[@class eq 'mw-headline']">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="i">
    <em>
      <xsl:apply-templates select="@* | node()"/>
    </em>
  </xsl:template>
  
  <xsl:template match="tt">
    <code>
      <xsl:apply-templates select="@* | node()"/>
    </code>
  </xsl:template>
  
  <xsl:template match="div[normalize-space(.) eq ''] 
                     | p[normalize-space(.) eq '']
                     | span[@class eq 'mw-editsection']
                     | div[@id eq 'siteSub']"/>
  
  
 <!--
      NAMED TEMPLATES
   -->
  
 <!--
      FUNCTIONS
   -->
  
</xsl:stylesheet>