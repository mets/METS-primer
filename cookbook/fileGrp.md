---
title: "Grouping related files"
parent: METS Cookbook
---
# Grouping related files: `<fileGrp>`

A sequence of file group elements `<fileGrp>` can be used group the
digital files comprising the content of a METS object either into a
flat arrangement. In the case where the content files are
images of different formats and resolutions, for example, one could
group the image content files by format and create a separate
`<fileGrp>` for each image format/resolution such as:

-   one `<fileGrp>` for the thumbnails of the images
-   one `<fileGrp>` for the higher resolution JPEG images
-   one `<fileGrp>` for the archival TIFF images

Meanwhile, the `<structMap>` element can be used to link together the different representations of the same intellectual content.

A `<fileGrp>` may contain zero or more `<file>` elements. As
described below, a `<file>` element may contain `<FLocat>` pointers to
one or more external content files via a URI and/or may itself contain
the file content as XML or binary data using the `<FContent>` element.

Nested (hierarchical) arrangement with file groups is not allowed,
since complex structures are meant to be described in the Structural
map section `<structSec>`.
## Example

The following METS fragment represents the page images of a book that are in TIFF format. The following METS fragment represents the TIFF page images of a book:

```xml
<mets:mets xmlns:mets="http://www/loc.gov/METS/v2"
 xmlns:xsi="http://www/w3/org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
 http://www.loc.gov/standards/mets/mets.xsd" OBJID="ark:/13010/kt9s2009hz"
 LABEL="Martial Epigrams">
  ...
  <mets:fileSec>
    <mets:fileGrp ID="TIFF_GRP01" USE="ARCHIVAL">
      ...
  </mets:fileSec>
  ...
```

There may be other `<fileGrp>`s that contain JPEG or PNG manifestations of the same pages.
