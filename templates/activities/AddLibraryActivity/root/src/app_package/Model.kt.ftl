package ${packageName}.di.key

import java.lang.annotation.RetentionPolicy.RUNTIME

import java.lang.annotation.Documented
import java.lang.annotation.Retention

import javax.inject.Qualifier

/**
 * Qualifies bindings relating to [android.os.Build.MODEL].
 */
@Qualifier
@Retention(RUNTIME)
@Documented
annotation class Model
