---
title: Referring to external metadata
parent: METS How-Tos
---
# Referring to external metadata

The **metadata reference** element `<mdRef>` element is used to provide a pointer to metadata which resides outside the METS document.

NOTE: `<mdRef>` is an empty element; the location of the external metadata must be recorded in the LOCREF attribute, and can be supplemented by the XPTR attribute as needed.

##### Metadata reference -- example

The following example demonstrates the use of the `<mdRef>` element.

```xml
<mdSec>
  <md ID="DMD1" USE="DESCRIPTIVE">
    <mdRef MIMETYPE="text/xml" LABEL="MODS record" LOCTYPE="URN"
      MDTYPE="MODS" LOCREF="urn:x-nyu:fales1735"/>
  </md>
</mdSec>
```

See also: [Linking to external resources from METS](locref.md)
