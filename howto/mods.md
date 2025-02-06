---
title: Including descriptive metadata with MODS
parent: METS How-Tos
---
# Including descriptive metadata with MODS

Descriptive metadata is metadata about the content and context of the
data. With descriptive metadata, the content can be identified and
discover. The following example demonstrate the use of the
`<mdWrap>` element:

```xml
<mets:md ID="DMD1" USE="DESCRIPTIVE">
  <mets:mdWrap MDTYPE="MODS">
    <mets:xmlData>
      <mods:mods>
        <mods:titleInfo>
          <mods:title>Epigrams</mods:title>
        </mods:titleInfo>
        <mods:name type="personal">
          <mods:namePart>Martial</mods:namePart>
        </mods:name>
        <mods:name type="personal">
          <mods:namePart>Ker, Walter C. A. (Walter Charles Alan), 1853-1929</mods:namePart>
        </mods:name>
        <mods:typeOfResource>text</mods:typeOfResource>
        <mods:originInfo>
          <mods:place>
            <mods:placeTerm type="text">London</mods:placeTerm>
          </mods:place>
          <mods:publisher>William Heinemann</mods:publisher>
          <mods:dateIssued point="start">1927</mods:dateIssued>
          <mods:dateIssued point="end">1943</mods:dateIssued>
        </mods:originInfo>
        <mods:language>
          <mods:languageTerm type="text">English</mods:languageTerm>
        </mods:language>
        <mods:physicalDescription>
          <mods:extent>2 v.</mods:extent>
        </mods:physicalDescription>
        <mods:note>v. 1 has imprint: Cambridge, Ma. : Harvard University Press, 1943</mods:note>
        <mods:note>Latin and English on opposite pages.</mods:note>
        <mods:subject authority="lcsh">
          <mods:topic>Epigrams, Latin--Translations into English</mods:topic>
        </mods:subject>
        <mods:relatedItem type="series">
          <mods:titleInfo>
            <mods:title>Loeb classical library></mods:title>
          </mods:titleInfo>
        </mods:relatedItem>
        <mods:accessCondition>Unknown</mods:accessCondition>
        <mods:recordInfo>
          <mods:recordContentSource>METS Editorial Board</mods:recordContentSource>
          <mods:recordCreationDate encoding="iso8601">20060316</mods:recordCreationDate>
        </mods:recordInfo>
      </mods:mods>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

[Descriptive metadata - embedding binary MARC records](binary_marc.md)
