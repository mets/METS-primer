---
title: "Descriptive metadata: embedding binary MARC records"
parent: METS How-Tos
---
# Descriptive metadata: embedding binary MARC records

While it would normally be preferable to include MARC metadata as MARC-XML, or potentially to link to a record in an external system, it is possible when needed to directly include binary data in a METS XML document.

```xml
<md ID="dmd003" USE="DESCRIPTIVE">
  <mdWrap MIMETYPE="application/marc" MDTYPE="MARC" LABEL="OPAC Record">
    <binData>MDI0ODdjam0gIDIyMDA1ODkgYSA0NU0wMDAxMDA...
      [base 64 encoded data goes here]
    </binData>
  </mdWrap>
</md>
```

[Image]

See also: [Embedding binary data in METS](binData.md)
