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

## NA-323

Specimin Output:
```
package com.cogvio.time;

import java.time.Clock;
import java.time.Instant;
import java.time.ZoneId;

public final class MutableClock extends Clock {

    private Instant instant;

    private ZoneId zone;

    private MutableClock(final Instant instant, final ZoneId zone) {
        this.setZone(zone);
        this.setInstant(instant);
    }

    public void setInstant(final Instant instant) {
        throw new Error();
    }

    public void setZone(final ZoneId zone) {
        throw new Error();
    }

    public ZoneId getZone() {
        throw new Error();
    }

    public MutableClock withZone(final ZoneId newZone) {
        throw new Error();
    }

    public Instant instant() {
        throw new Error();
    }
}

```

Perses Output:
```
package com.cogvio.time;

import java.time.Instant;
import java.time.ZoneId;

class MutableClock {
  Instant instant;
  ZoneId zone;

  MutableClock() {}
}

```
Line counts using same formatting:
* Specimin: 27
* Perses: 8

Differences:
* Perses doesn't include clock
* Perses removes "public final" before "class" in class declaration and removes "extends"
* Perses removes "private" from variable declarations
* Perses removes arguments for MutableClock()
* Specimin replaces the body of the setters and getters with "throw new Error();" while perses removes them entirely

## Running Perses on Specimin Output

We also ran Perses on the output of Specimin for two cases where the output was
preserved by Specimin, and the output was a single file.

## CF-4614

Perses Output:
```
import java.util.Map;
import java.util.stream.Collectors;

class Version {
  static Map<String, String> getAllVersionInformation() {
    throw new Error();
  }

  {
    String versionInfo =
        Version.getAllVersionInformation().entrySet().stream()
            .map(e -> String.format("%s:%s", e.getKey(), e.getValue()))
            .collect(Collectors.joining());
  }
}

```
lines: 13

Differences:
* One less line than Perses due to Specimin removing the `VERSION_INFORMATION` field
* `getAllVersionInformation` is kept in both, but Specimin changed the body to "throw new Error()" which Perses kept

## NA-323

Perses Output:
```
package com.cogvio.time;

import java.time.Instant;
import java.time.ZoneId;

class MutableClock {
  Instant instant;
  ZoneId zone;

  MutableClock() {}
}

```
lines: 8

Differences:
* None, Perses produced the same output after help from Specimin
