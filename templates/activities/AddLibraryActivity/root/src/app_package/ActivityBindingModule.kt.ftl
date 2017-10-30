package ${packageName}.di

import ${packageName}.MainActivity
import ${packageName}.di.scope.ActivityScope

import dagger.Module
import dagger.android.ContributesAndroidInjector

@Module
internal abstract class ActivityBindingModule {

    @ActivityScope
    @ContributesAndroidInjector
    internal abstract fun ${activityClass?uncap_first}(): ${activityClass}

}
