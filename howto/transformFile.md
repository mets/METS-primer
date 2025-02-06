---
title: Handling 'Wrapper' file formats
parent: METS How-Tos
---
# Handling "Wrapper" file formats

The **transform file** `<transformFile>` element provides a means to
access any subsidiary files listed below a `<file>` element by
indicating the steps required to unpack or transform the subsidiary
files, such as decompressing, decrypting, or un-archiving files. This element is repeatable.
## Example

The following example describes a *.tar.gz file which has two embedded
files within it, one a TIFF file and the other a JPEG file of the same
image. To use the `<fileSec>` to describe these files, you could use the
`<transformFile>` element in the following way:

```xml
<mets:fileSec ID="TransformEX_01">
  <mets:fileGrp ID="TAR_GZ_container_01" USE="Container">
    <mets:file MIMETYPE="application/tar.gz" USE="Container">
      <mets:FLocat LOCREF="file://sample01.tar.gz" ID="sampleTar01.gz"
        LOCTYPE="URL" />
      <mets:transformFile TRANSFORMORDER="1" TRANSFORMTYPE="decompression"
        TRANSFORMALGORITHM="gunzip">
      <mets:transformFile TRANSFORMORDER="2" TRANSFORMTYPE="decompression"
        TRANSFORMALGORITHM="tar">
      </mets:transformFile>
      <mets:file SEQ="1" MIMETYPE="image/tiff"
          CHECKSUM="c1b82611e48066016ceb8daa93d46de7"CHECKSUMTYPE="MD5">
        <mets:FLocat LOCREF="file://sample01_image01.tiff" LOCTYPE="URL"
          USE="Archival Master"/>
      </mets:file>
      <mets:file SEQ="2" MIMETYPE="image/jpeg"
          CHECKSUM="c3cb82611e48066016ceb8daa93d46df5" CHECKSUMTYPE="MD5">
        <mets:FLocat LOCREF="file://sample01_image01jpeg"
          LOCTYPE="URL"USE="Display Derivative"/>
    </mets:file>
  </mets:fileGrp>
</mets:fileSec>
```
