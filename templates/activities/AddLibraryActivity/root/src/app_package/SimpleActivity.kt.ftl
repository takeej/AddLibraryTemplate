package ${escapeKotlinIdentifiers(packageName)}

<#if useDagger>
import dagger.android.support.DaggerAppCompatActivity
<#else>
import ${superClassFqcn}
</#if>
import android.os.Bundle
<#if includeCppSupport!false>
import kotlinx.android.synthetic.main.${layoutName}.*
</#if>
<#if useDataBinding>
import android.databinding.DataBindingUtil
import ${packageName}.databinding.${xxxActivityBinding}
</#if>

<#if useDagger>
import ${packageName}.di.key.Model

import javax.inject.Inject
import javax.inject.Named
</#if>

class ${activityClass} : <#if useDagger>DaggerAppCompatActivity<#else>${superClass}</#if>() {
<#if useDagger>
@field:[Inject Model]
lateinit var model: String

@field:[Inject Named("packageName")]
lateinit var packageNameStr: String
</#if>

<#if useDataBinding>
    private val binding: ${xxxActivityBinding} by lazy {
        DataBindingUtil.setContentView<${xxxActivityBinding}>(this, R.layout.${layoutName})
    }
</#if>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
<#if generateLayout>
        <#if useDataBinding>
          <#if useDagger>
           binding.message.text = "$model, $packageNameStr"
          <#else>
           binding.message.text="Hello~"
          </#if>
        <#else>
        setContentView(R.layout.${layoutName});
        </#if>
</#if>
<#include "../../../../common/jni_code_usage.kt.ftl">
    }
<#include "../../../../common/jni_code_snippet.kt.ftl">
}
