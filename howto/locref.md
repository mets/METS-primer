---
title: Linking to external resources from METS
parent: METS How-Tos
---
# Linking to external resources from METS

METS uses its own attributes to provide links to external resources from elements within a METS document. Specifically, the LOCREF attribute is used to specify the URL of the pertinent external resource, and the LOCTYPE can be used to specify or associate pertinent metadata with the specified xlink:href link. These attributes are used in two main contexts in METS.

## Context 1: The `<mdRef>` sub-element of `<md>` elements in the `<mdSec>`

The `<mdRef>` element, which appears within `<md>` elements, uses the LOCREF attribute to point to an external resource containing the relevant metadata.
### Example

In the `<mdSec>` below, the LOCREF attribute cites a URL that identifies the location of an external EAD-based description.

```xml
<mets:mdSec>
  <mets:md ID="DMD1">
    <mets:mdRef LABEL="Patrick Breen Papers" LOCTYPE="URL" MDTYPE="EAD"
        LOCREF="http://sunsite2.berkeley.edu/cgi-bin/oac/calher/breenpapers#xyzj0098"/>
  </mets:md>
</mets:mdSec>
```
## Context 2: The `<FLocat>` sub-element of `<file>` elements in the `<fileSec>`

The `<FLocat>` element uses the xlink:href attribute to point to the corresponding content file at its external location. The other XLink simpleLink attributes can also be used to describe this link. 

See also: [Referencing external files](FLocat.md)
### Example

In the example below, the LOCREF attribute uses a URL to identify the location of the pertinent external content file. 

```xml
<mets:fileGrp USE="Full view">
  <mets:file ID="FID1" MIMETYPE="image/jpg" MDID="IMAGE1">
    <mets:FLocat LOCTYPE="URL"
        LOCREF="http://www.museum.cornell.edu/HFJ/permcoll/pdp/img_pr/monstros_l.jpg"/>
  </mets:file>
</mets:fileGrp>
```
