<#-- Macro used to add the necessary dependencies to support kotlin to
an app build.gradle -->

<#macro addKotlinPlugins>
<#if generateKotlin>
<#compress>
apply plugin: 'kotlin-android'
apply plugin: 'kotlin-android-extensions'
<#if useDataBinding!false>
apply plugin: 'kotlin-kapt'
</#if>
</#compress>
</#if>
</#macro>

<#macro addKotlinDependencies>
<#if generateKotlin>${getConfigurationName("compile")} "org.jetbrains.kotlin:kotlin-stdlib-jre7:$kotlin_version"</#if>
<#if generateKotlin><#if useDataBinding!false>${getConfigurationName("kapt")} "com.android.databinding:compiler:2.3.3"</#if></#if>
</#macro>


// TODO: <apply plugin /> Is adding the dependencies at the *end* of build.gradle
// TODO: The two macros above, addKotlinPlugins and addKotlinDependencies, are duplicating the work of addAllKotlinDependencies, when
//       creating a new project (isNewProject == true). The only reason is the above bug on <apply plugin />
<#macro addAllKotlinDependencies>
  <#if !isNewProject && (language!'Java')?string == 'Kotlin'>
    <apply plugin="kotlin-android" />
    <apply plugin="kotlin-android-extensions" />
    <#if !hasDependency('org.jetbrains.kotlin:kotlin-stdlib')>
        <dependency mavenUrl="org.jetbrains.kotlin:kotlin-stdlib-jre7:$kotlin_version"/>
        <merge from="root://activities/common/kotlin.gradle.ftl"
                 to="${escapeXmlAttribute(projectLocation)}/build.gradle" />
    </#if>
  </#if>
</#macro>
