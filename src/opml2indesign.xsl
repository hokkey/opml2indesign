<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet  [
  <!ENTITY lf     "&#x0a;">
]>

<!--
============================================================

  opml2indesign.xsl

  Copyright (c) 2014 y_hokkey
  Released under the MIT license
  http://opensource.org/licenses/mit-license.php

============================================================
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" indent="yes" cdata-section-elements=""/>

  <!-- この数値よりも深いノードは、階層を無視して出力する -->
  <xsl:variable name="max-level" select="12"/>

	<xsl:template match="/">
		<xsl:element name="Root">

			<xsl:apply-templates select="opml/body"/>

		</xsl:element>
	</xsl:template>


	<!--********************* body *********************-->
	<xsl:template match="body">

    <xsl:element name="body">
      <xsl:apply-templates select="outline">
        <xsl:with-param name="level" select="1"/>
      </xsl:apply-templates>

    </xsl:element>

	</xsl:template>

  <!--********************* outline *********************-->
  <xsl:template match="outline">

    <!-- 引数 -->
    <xsl:param name="level"/>

    <!-- 変数 -->
    <xsl:variable name="head">
      <xsl:value-of select="@text"/>
    </xsl:variable>
    <xsl:variable name="body">
      <xsl:value-of select="@_note"/>
    </xsl:variable>
    <xsl:variable name="hlevel">
      <xsl:call-template name="hlevel-logic">
        <xsl:with-param name="level" select="$level"/>
      </xsl:call-template>
    </xsl:variable>

    <!-- 構造 -->
    <xsl:if test="$head!=''">
      <xsl:element name="{$hlevel}">
        <xsl:value-of select="$head"/>
      </xsl:element>
      <!-- この改行は必須 -->
      <xsl:text>&#x0a;</xsl:text>
    </xsl:if>

    <xsl:if test="$body!=''">
      <xsl:element name="note">
        <xsl:value-of select="$body"/>
      </xsl:element>
      <!-- この改行は必須 -->
      <xsl:text>&#x0a;</xsl:text>
    </xsl:if>

    <!-- 再起処理 -->
    <xsl:apply-templates select="./outline">
      <xsl:with-param name="level" select="$level + 1"/>
    </xsl:apply-templates>

  </xsl:template>

  <!-- hlevel-logic -->
  <xsl:template name="hlevel-logic">
    <!-- 引数 -->
    <xsl:param name="level"/>
    <xsl:choose>

      <!-- 一定以上の深さの場合は、$max-levelのままにする -->
      <xsl:when test="$level > $max-level">
        <xsl:value-of select="concat('h', $max-level)"/>
      </xsl:when>

      <xsl:otherwise>
        <xsl:value-of select="concat('h', $level)"/>
      </xsl:otherwise>
    </xsl:choose>


  </xsl:template>


</xsl:stylesheet>
