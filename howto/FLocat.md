---
title: Referencing external files
parent: METS How-Tos
---
# Referencing external files

The **file location** element `<FLocat>` provides a pointer to the location of a content file. 

NOTE: `<FLocat>` is an empty element. The location of the resource to which it points MUST be stored in the LOCREF attribute.

See also: [Linking to external resources from METS](locref.md)

## Example

In the following example, the `<fileGrp>` of the TIFF images is represented as is a single `<file>` within that group and the file location:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www/loc/gov/METS/v2"
    xmlns:xsi="http://www/w3/org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www/loc/gov/METS/v2
      http://www/loc/gov/standards/mets/mets.xsd"
    OBJID="ark:/13030/kt9s2009hz"
    LABEL="Martial Epigrams">
  [...]
  <mets:fileSec>
    <mets:fileGrp ID="TIFF_GRP01" USE="MASTER IMAGE">
      <mets:file ID="epi01m" SIZE="65768" CREATED="2006-04-11T07:35:22"
          MIMETYPE="image/tiff" MDID="MIX_v1.0_TIFF_epio1m">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/full/01.tiff"
          LOCTYPE="URL"/>
        </mets:FLocat>
      </mets:file>
    </mets:fileGrp>
  </mets:fileSec>
  [...]
```
