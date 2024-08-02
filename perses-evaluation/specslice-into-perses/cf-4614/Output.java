import java.util.Map;
import java.util.stream.Collectors;

class Version {
  static Map VERSION_INFORMATION;

  static Map<String, String> getAllVersionInformation() {
    return VERSION_INFORMATION;
  }

  {
    String versionInfo =
        Version.getAllVersionInformation().entrySet().stream()
            .map(e -> String.format("%s:%s", e.getKey(), e.getValue()))
            .collect(Collectors.joining());
  }
}
