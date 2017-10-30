package ${packageName}.di

import android.app.Application

import javax.inject.Singleton

import dagger.BindsInstance
import dagger.Component
import dagger.android.AndroidInjector
import dagger.android.support.AndroidSupportInjectionModule
import dagger.android.support.DaggerApplication

@Singleton
@Component(
        modules = arrayOf(
                AppModule::class,
                SystemModule::class,
                ActivityBindingModule::class,
                AndroidSupportInjectionModule::class
        )
)
interface AppComponent : AndroidInjector<DaggerApplication> {
    @Component.Builder
    interface Builder {
        @BindsInstance
        fun application(application: Application): Builder

        fun build(): AppComponent
    }

}
