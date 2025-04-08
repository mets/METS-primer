---
title: "Descriptive metadata: Embedding binary MARC records"
parent: METS How-Tos
---
# Descriptive metadata: Embedding binary MARC records

While it is normally preferable to include MARC metadata as MARCXML, or potentially to link to a record in an external system, it is also possible, when needed, to directly include binary data in a METS XML document.

```xml
<md ID="dmd003" USE="DESCRIPTIVE">
  <mdWrap MIMETYPE="application/marc" MDTYPE="MARC" LABEL="OPAC Record">
    <binData>MDI0ODdjam0gIDIyMDA1ODkgYSA0NU0wMDAxMDA...
      [Base64-encoded data goes here]
    </binData>
  </mdWrap>
</md>
```

See also: [Embedding binary data in METS](binData.md)
