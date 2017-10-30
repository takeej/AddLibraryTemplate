<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <#include "../common/recipe_manifest.xml.ftl" />
    <@kt.addAllKotlinDependencies />

<#if generateLayout>
    <#include "../common/recipe_simple.xml.ftl" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
</#if>

<#if generateKotlin>
    <instantiate from="root/src/app_package/SimpleActivity.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.kt" />

    <#if useDataBinding>
      <dependency mavenUrl="com.android.databinding:compiler:2.3.3" gradleConfiguration="kapt" />
    </#if>
<#else>
    <instantiate from="root/src/app_package/SimpleActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
</#if>



<#if useDagger!false>
    <dependency mavenUrl="com.google.dagger:dagger:2.11" />
    <dependency mavenUrl="com.google.dagger:dagger-android:2.11" />
    <dependency mavenUrl="com.google.dagger:dagger-android-support:2.11" />
    <#if generateKotlin>
      <dependency mavenUrl="com.google.dagger:dagger-compiler:2.11" gradleConfiguration="kapt" />
      <dependency mavenUrl="com.google.dagger:dagger-android-processor:2.11" gradleConfiguration="kapt" />
    <#else>
      <dependency mavenUrl="com.google.dagger:dagger-compiler:2.11" gradleConfiguration="annotationProcessor" />
      <dependency mavenUrl="com.google.dagger:dagger-android-processor:2.11" gradleConfiguration="annotationProcessor" />
    </#if>


    <mkdir at="${escapeXmlAttribute(srcOut)}/di/key" />
    <mkdir at="${escapeXmlAttribute(srcOut)}/di/scope" />

  <#if isNewProject>
    <#if generateKotlin>
      <instantiate from="root/src/app_package/Model.kt.ftl" to="${escapeXmlAttribute(srcOut)}/di/key/Model.kt" />
      <instantiate from="root/src/app_package/ActivityBindingModule.kt.ftl" to="${escapeXmlAttribute(srcOut)}/di/ActivityBindingModule.kt" />
      <instantiate from="root/src/app_package/AppComponent.kt.ftl" to="${escapeXmlAttribute(srcOut)}/di/AppComponent.kt" />
      <instantiate from="root/src/app_package/AppModule.kt.ftl" to="${escapeXmlAttribute(srcOut)}/di/AppModule.kt" />
      <instantiate from="root/src/app_package/SystemModule.kt.ftl" to="${escapeXmlAttribute(srcOut)}/di/SystemModule.kt" />

      <instantiate from="root/src/app_package/ActivityScope.kt.ftl" to="${escapeXmlAttribute(srcOut)}/di/scope/ActivityScope.kt" />
      <instantiate from="root/src/app_package/FragmentScoped.kt.ftl" to="${escapeXmlAttribute(srcOut)}/di/scope/FragmentScoped.kt" />

      <instantiate from="root/src/app_package/App.kt.ftl" to="${escapeXmlAttribute(srcOut)}/App.kt" />
    <#else>
      <instantiate from="root/src/app_package/Model.java.ftl" to="${escapeXmlAttribute(srcOut)}/di/key/Model.java" />
      <instantiate from="root/src/app_package/ActivityBindingModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/di/ActivityBindingModule.java" />
      <instantiate from="root/src/app_package/AppComponent.java.ftl" to="${escapeXmlAttribute(srcOut)}/di/AppComponent.java" />
      <instantiate from="root/src/app_package/AppModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/di/AppModule.java" />
      <instantiate from="root/src/app_package/SystemModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/di/SystemModule.java" />

      <instantiate from="root/src/app_package/ActivityScope.java.ftl" to="${escapeXmlAttribute(srcOut)}/di/scope/ActivityScope.java" />
      <instantiate from="root/src/app_package/FragmentScoped.java.ftl" to="${escapeXmlAttribute(srcOut)}/di/scope/FragmentScoped.java" />

      <instantiate from="root/src/app_package/App.java.ftl" to="${escapeXmlAttribute(srcOut)}/App.java" />

    </#if>
  </#if>
</#if>

</recipe>
