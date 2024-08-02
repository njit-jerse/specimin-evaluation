package net.mtu.eggplant.checker.parser_error;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;

public final class Version {
  private static final Map<String, String> VERSION_INFORMATION;
  private static final String VERSION;

  static {
    final InputStream stream = Version.class.getResourceAsStream("/fll/resources/git.properties");
    if (null == stream) {
      System.out.println("Unable to find version.properties!");
      VERSION = "NO-PROPERTIES-FILE";
      VERSION_INFORMATION = Collections.emptyMap();
    } else {
      final Properties versionProps = new Properties();
      String version;
      try {
        versionProps.load(stream);
        version = versionProps.getProperty("git.build.version", "NO-PROPERTY");
      } catch (final IOException ioe) {
        System.out.println("Error loading version properties");
        ioe.printStackTrace();
        version = "EXCEPTION";
      } finally {
        try {
          stream.close();
        } catch (final IOException e) {
          System.out.println("Error closing stream");
          e.printStackTrace();
        }
      }
      final Map<String, String> map = new HashMap<>();
      for (final String name : versionProps.stringPropertyNames()) {
        map.put(name, versionProps.getProperty(name));
      }
      VERSION_INFORMATION = Collections.unmodifiableMap(map);
      VERSION = version;
    }
  }

  private Version() {}

  public static String getVersion() {
    if (VERSION.contains("APP-VERSION")) {
      return "devel";
    } else {
      return VERSION;
    }
  }

  public static Map<String, String> getAllVersionInformation() {
    return VERSION_INFORMATION;
  }

  public void method() {
    final String versionInfo =
        Version.getAllVersionInformation().entrySet().stream()
            .map(e -> String.format("%s:%s", e.getKey(), e.getValue()))
            .collect(Collectors.joining("\n"));
  }
}
