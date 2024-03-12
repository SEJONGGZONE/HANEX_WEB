package com.hanbiz.common;

import java.util.LinkedHashMap;

import com.google.common.base.CaseFormat;

@SuppressWarnings("serial")
public class CamelCaseKeyMap extends LinkedHashMap<Object, Object> {

    @Override
    public Object put(Object key, Object value) {
        return super.put(toLowerCamel((String) key), value);
    }

    private static String toLowerCamel(String key) {
        return CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, key);
    }
}
