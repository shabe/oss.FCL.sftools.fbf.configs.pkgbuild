<?xml version="1.0"?>
<project name="SF-TRUCLEAN" default="all" xmlns:hlm="http://www.nokia.com/helium">

<#assign target_depends=""/>
<#assign count=0/>
<#assign dollar="$"/>

<#list data as pkg_detail>
<target name="sf-truclean-${count}">
  <sequential>
    <propertyregex override="yes" property="package"  input="${pkg_detail.dst}" regexp=".*sf[\\\/]([^\\^\/]+)[\\\/]([^\\^\/]+)" replace="\1/\2"/>
    <echo message="Calling truclean script for package ${dollar}{package}"/>
      <exec executable="perl" dir="${ant['build.drive']}/" failonerror="false" output="${ant['build.log.dir']}/truclean.log">
        <arg value="${ant['sf.common.config.dir']}/tools/raptor/truclean.pl"/>
        <arg value="--packageexpr=${dollar}{package}"/>
        <arg value="--deliverablesdir=${ant['build.drive']}/build_info/logs/deliverables"/>
      </exec>
  </sequential>
</target>
  
  <#if (count==0)>
    <#assign target_depends="${target_depends}"+"sf-truclean-${count}"/>
  </#if>
  <#if (count>0)>
    <#assign target_depends="${target_depends}"+","+"sf-truclean-${count}"/>
  </#if>
  <#assign count=count+1/>
</#list>

<target name="all" depends="${target_depends}"/>

</project>