package com.zhangy.selfwork.common.token;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.RetentionPolicy;

@Target({ElementType.METHOD})   
@Retention(RetentionPolicy.RUNTIME)   
@Documented 
public @interface Token {
	boolean save() default false;

    boolean remove() default false;
}
