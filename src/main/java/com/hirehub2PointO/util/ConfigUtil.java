package com.hirehub2PointO.util;

import java.io.InputStream;
import java.util.Properties;

public class ConfigUtil {
    private static Properties properties = new Properties();

    static {
        try (InputStream input =
                     ConfigUtil.class
                    .getClassLoader()
                    .getResourceAsStream("config.properties")){

            if (input == null) {
                throw new RuntimeException("config.properties not found");
            }
            properties.load(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Properties getProperties() {
        return properties;
    }
}
