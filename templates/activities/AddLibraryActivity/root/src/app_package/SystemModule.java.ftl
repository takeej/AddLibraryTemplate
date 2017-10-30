package ${packageName}.di;

import android.content.Context;

import ${packageName}.di.key.Model;

import javax.inject.Named;

import dagger.Module;
import dagger.Provides;

import static android.os.Build.MODEL;


@Module
public class SystemModule {

    @Provides
    @Model
    final String provideModel() {
        return MODEL;
    }

    @Provides
    @Named(value = "packageName")
    String providePackageName(Context context){
        return context.getPackageName();
    }
}
