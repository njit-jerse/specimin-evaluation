package net.mtu.eggplant.checker.parser_error;

import java.util.Map;
import java.util.stream.Collectors;

public final class Version {

    public static Map<String, String> getAllVersionInformation() {
        throw new Error();
    }

    public void method() {
        final String versionInfo = Version.getAllVersionInformation().entrySet().stream().map(e -> String.format("%s:%s", e.getKey(), e.getValue())).collect(Collectors.joining("\n"));
    }
}
