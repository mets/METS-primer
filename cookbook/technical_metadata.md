---
title: Technical metadata for images
parent: METS Cookbook
---
# Technical metadata for images

**Technical metadata** is metadata about a component of the METS
object, such as a digital content file. One might, for example,
have a `<md>` element which includes technical metadata regarding
a file's preparation:

## TODO use current version of NISO/MIX schema

```xml
<mets:md ID="AMD001" USE="TECHNICAL">
  <mets:mdWrap MIMETYPE="text/xml" MDTYPE="NISOIMG" LABEL="NISO Img.Data">
    <mets:xmlData>
      <niso:MIMEtype>image/tiff</niso:MIMEtype>
      <niso:Compression>LZW</niso:Compression>
      <niso:PhotometricInterpretation>8
      </niso:PhotometricInterpretation>
      <niso:Orientation>1</niso:Orientation>
      <niso:ScanningAgency>NYU Press</niso:ScanningAgency>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

Within a file section, a `<file>` element within a `<fileGrp>` might
then identify the administrative metadata pertaining to the file to
which it points by referencing an MDID attribute for its `<md>`
element:

```xml
<mets:file ID="FILE001" MDID="AMD001">
  <mets:FLocat LOCTYPE="URL" LOCREF="http://dlib.nyu.edu/press/testing.tif"/>
</mets:file>
```

Below, there are links to a few technical metadata standards:

- [MIX XML Schema](https://www.loc.gov/standards/mix/)
- [NISO Technical Metadata for Still Images](https://www.niso.org/publications/ansiniso-z3987-2006-r2017-data-dictionary-technical-metadata-digital-still-images)
- [TextMD](https://www.loc.gov/standards/textMD/)
- [AudioMD and VideoMD](https://www.loc.gov/standards/amdvmd/index.html)
