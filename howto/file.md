---
title: Describing digital object content
parent: METS How-Tos
---
# Describing digital object content

The `<file>` element provides access to the content files for the digital object being described by the METS document. A `<file>` element may contain one or more `<FLocat>` elements, which provide pointers to a content file, and/or a `<FContent>` element, which wraps an encoded version of the file. Embedding files using `<FContent>` can be a valuable feature for exchanging digital objects between repositories or for archiving versions of digital objects for off-site storage. All `<FLocat>` and `<FContent>` elements should identify and/or contain identical copies of a single file. The `<file>` element is recursive, thus allowing sub-files or component files of a larger file to be listed in the inventory. For example, files contained within an archive, such as a TAR or ZIP file, could be represented this way. Alternatively, by using the `<stream>` element, a smaller component of a file or of a related file can be placed within a `<file>` element. Finally, by using the `<transformFile>` element, it is possible to include within a `<file>` element a different version of a file that has undergone a transformation - for example, as a result of format migration.

Read more:

* [Referencing external files](FLocat.md)
* [Embedding file content](FContent.md)
* [Representing parts of files](stream.md)
* [Handling 'wrapper' file formats](transformFile.md)
## Example

The physical book example that we have been using represents each page by `<div>` elements, one for each of the three different image manifestations (TIFF, JPEG, or GIF). The `<fileGrp>` for the TIFF images is represented in the following example as a single file within that group.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www/w3/org/2001/XMLSchema-instance"
 xsi:schemalocation="http://www.loc.gov/METS/v2
 http://www/loc/gov/standards/mets/mets.xsd" OBJID="ark:/13010/kt9s2009hz"
 LABEL="Martial Epigrams">
  ...
  <mets:fileSec>
    <mets:fileGrp ID="TIFF_GRP01" USE="MASTER IMAGE">
      <mets:file ID="epi01m" SIZE="65768" CREATED="2006-04-11T07:35:22"
      MIMETYPE="image/tiff" MDID="MIX_v1.0_TIFF_epi01m">
      ...
      </mets:file>
    </mets:fileGrp>
  </mets:fileSec>
  ...
```
