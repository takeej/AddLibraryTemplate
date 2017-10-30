package ${packageName}.di.key;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import javax.inject.Qualifier;

/** Qualifies bindings relating to {@link android.os.Build#MODEL}. */
@Qualifier
@Retention(RUNTIME)
@Documented
public @interface Model {}
