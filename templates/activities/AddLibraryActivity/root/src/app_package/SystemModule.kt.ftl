package ${packageName}.di

import android.content.Context

import ${packageName}.di.key.Model

import javax.inject.Named

import dagger.Module
import dagger.Provides

import android.os.Build.MODEL


@Module
class SystemModule {

    @Provides
    @Model
    fun provideModel(): String {
        return MODEL
    }

    @Provides
    @Named(value = "packageName")
    fun providePackageName(context: Context): String {
        return context.packageName
    }
}
