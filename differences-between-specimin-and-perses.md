This file lists each bug for which we managed to run both Specimin and Perses,
and discusses the specific differences in the output. Note that the line counts
in this analysis and in Table 1 of the paper might be different: in Table 1, the formatting
used is the JavaParser pretty-printer (Specimin's output format), but in this document both programs have been
reformatted using GJF-like rules, for fairness of comparison.

## CF-4614

Specimin output:
```
package net.mtu.eggplant.checker.parser_error;

import java.util.Map;
import java.util.stream.Collectors;

public final class Version {

    public static Map<String, String> getAllVersionInformation() {
        throw new Error();
    }

    public void method() {
        final String versionInfo = 
                Version.getAllVersionInformation().entrySet().stream()
                        .map(e -> String.format("%s:%s", e.getKey(), e.getValue()))
                        .collect(Collectors.joining("\n"));
    }
}
```

Perses output:
```
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
```

Line counts using same formatting:
* Specimin: 14
* Perses: 14

Differences:
* Perses removes the package declaration
* Perses removes "public final" before "class" in the class declaration
* Specimin removes the `VERSION_INFORMATION` field, which apparently doesn't contribute to the error (why does Perses keep it?)
* Specimin replaces the body of `getAllVersionInformation()` with `throw new Error();`, but Perses leaves it as-is
* Perses moves the contents of the target method `method()` to an initializer block
* Perses removes the `final` from the declaration of the `versionInfo` local