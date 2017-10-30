package ${packageName}.di;

import ${packageName}.${activityClass};
import ${packageName}.di.scope.ActivityScope;

import dagger.Module;
import dagger.android.ContributesAndroidInjector;

@Module
abstract class ActivityBindingModule {

    @ActivityScope
    @ContributesAndroidInjector
    abstract ${activityClass} ${activityClass?uncap_first}();

}
