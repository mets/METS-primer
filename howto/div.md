---
title: Representing parts of a digital object
parent: METS How-Tos
---
# Representing parts of a digital object

The structural divisions of the hierarchical organization provided by a `<structMap>` are represented by **division** `<div>` elements, which can be nested to any depth. Each `<div>` element can represent either an intellectual (logical) division or a physical division. It can explicitly identify the form of `<div>` it represents via its TYPE attribute. Thus in the case of a digitized book subdivided by the `<structMap>` into nested `<div>` elements representing chapters and then pages, the TYPE attribute values of the `<div>` elements at each successive level of the hierarchy might be "book", "chapter", and "page".

The optional LABEL attribute value can identify a `<div>` element in a specific manner suitable for presentation to the user of the digital object. So, a hierarchical presentation of the `<div>` LABEL attribute values would typically form a kind of "table of contents" that digital library patrons could use to comprehend and navigate the content represented by a digital object encoded using METS. The LABEL attribute could, of course, serve different purposes in different applications of the METS standard.

`<fileGrp>` may point to pertinent metadata groups `<mdGrp>` and metadata elements `<md>` in the Metadata Section `<mdSec>` of the METS document by means of an MDID attribute.

A `<div>` element at any level can be associated with one or more metadata groups `<mdGrp>` and metadata elements `<md>` in the Metadata Section `<mdSec>` of the METS document by means of its MDID attribute. It is assumed that any metadata referenced by a `<div>` element pertains to the division as a whole. For example: the root `<div>` in a digital object encoded using METS that represents a video might point to a `<md>` element that expresses the copyright and access restriction information for the entire video.

## Example

The simple encoding fragment below demonstrates the div features described thus far, including the TYPE, LABEL, and MDID attributes.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/METS/v2
      http://www.loc.gov/standards/mets/mets.xsd
      http://www.loc.gov/mods/v3 http://www.loc.gov/mods/v3/mods-3-1.xsd"
    OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:mdSec>
    <mets:md ID="DMD1" USE="DESCRIPTIVE">
      <mets:mdWrap MDTYPE="MODS">
        <mets:xmlData>
          <mods:mods>
            <mods:titleInfo>
              <mods:title>Martial Epigrams</mods:title>
            </mods:titleInfo>
          </mods:mods>
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
  </mets:mdSec>
  [...]
  <mets:structSec>
    <mets:structMap TYPE="physical">
      <mets:div TYPE="book" LABEL="Martial Epigrams II" MDID="DMD1">
        <mets:div TYPE="page" LABEL="Blank page"/>
        <mets:div TYPE="page" LABEL="Page i: Series title page"/>
        <mets:div TYPE="page" LABEL="Page ii: Blank page"/>
        <mets:div TYPE="page" LABEL="Page iii: Title page"/>
        <mets:div TYPE="page" LABEL="Page iv: Publication info"/>
        <mets:div TYPE="page" LABEL="Page v: Table of contents"/>
        <mets:div TYPE="page" LABEL="Page vi: Blank page"/>
        <mets:div TYPE="page" LABEL="Page 1: Half title page"/>
        <mets:div TYPE="page" LABEL="Page 2 (Latin)"/>
        <mets:div TYPE="page" LABEL="Page 3 (English)"/>
        <mets:div TYPE="page" LABEL="Page 4 (Latin)">
        <mets:div TYPE="page" LABEL="Page 5 (English)"/>
        <mets:div TYPE="page" LABEL="Page 6 (Latin)"/>
        <mets:div TYPE="page" LABEL="Page 7 (English)"/>
      </mets:div>
    </mets:structMap>
  </mets:structSec>
</mets:mets>
```

Through its subsidiary elements, each `<div>` element points to the digital content that manifests it. It can do so through one or more `<mptr>` element, if this content is represented by one or more external METS documents, or through one or more `<fptr>` element, if this content is represented by one or more `<file>` elements in the `<fileSec>` In addition to or instead of directly pointing to digital content via its child `<fptr>` and/or `<mptr>` elements, a `<div>` element may itself contain `<div>` elements that further subdivide the content represented by the division.
