
package com.shangcheng.psychology.common.utils;

import java.util.HashMap;


/**
 * Map工具类
 *
 * @author Mark sunlightcs@gmail.com
 */
public class MapUtils extends HashMap<String, Object> {

    @Override
    public MapUtils put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
