package ${packageName};

<#if useDagger>
import dagger.android.support.DaggerAppCompatActivity;
<#else>
import ${superClassFqcn};
</#if>
import android.os.Bundle;
<#if includeCppSupport!false>
import android.widget.TextView;
</#if>
<#if useDataBinding>
import android.databinding.DataBindingUtil;
import ${packageName}.databinding.${xxxActivityBinding};
</#if>


<#if useDagger>
import ${packageName}.di.key.Model;

import javax.inject.Inject;
import javax.inject.Named;
</#if>


public class ${activityClass} extends <#if useDagger>DaggerAppCompatActivity<#else>${superClass}</#if> {

<#if useDataBinding>
	private ${xxxActivityBinding} binding;
</#if>

<#if useDagger>
	@Inject
	@Model
	String model;

	@Inject
	@Named(value = "packageName")
	String packageName;
</#if>

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
<#if generateLayout>
		<#if useDataBinding>
			binding = DataBindingUtil.setContentView(this, R.layout.${layoutName});
			<#if useDagger>
				binding.message.setText(model + ", " + packageName);
			<#else>
				binding.message.setText("Hello~");
			</#if>
		<#else>
        setContentView(R.layout.${layoutName});
    </#if>
</#if>
<#include "../../../../common/jni_code_usage.java.ftl">
    }
<#include "../../../../common/jni_code_snippet.java.ftl">
}
