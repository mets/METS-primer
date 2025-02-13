---
title: Technical metadata for images
parent: METS How-Tos
---
# Technical metadata for images

**Technical metadata** is metadata about a component of the METS object, such as a digital content file. One might, for example, have a `<md>` element which includes technical metadata regarding a file's preparation:

## Example

```xml
<mets:md ID="MD001" USE="TECHNICAL">
  <mets:mdWrap MIMETYPE="text/xml" MDTYPE="MIX" LABEL="NISO Img.Data">
    <mets:xmlData>
      <mix:mix xmlns:mix="http://www.loc.gov/mix/v20" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.loc.gov/mix/v20 https://www.loc.gov/standards/mix/mix.xsd">
        <mix:BasicDigitalObjectInformation>
          <mix:FormatDesignation>
            <mix:formatName>image/tiff</mix:formatName>
          </mix:FormatDesignation>
          <mix:Compression>
            <mix:compressionScheme>LZW</mix:compressionScheme>
          </mix:Compression>
        </mix:BasicDigitalObjectInformation>
        <mix:BasicImageInformation>
          <mix:BasicImageCharacteristics>
            <mix:PhotometricInterpretation>
              <mix:colorSpace>DeviceGray</mix:colorSpace>
            </mix:PhotometricInterpretation>
          </mix:BasicImageCharacteristics>
        </mix:BasicImageInformation>
        <mix:ImageCaptureMetadata>
          <mix:orientation>normal*</mix:orientation>
        </mix:ImageCaptureMetadata>
        <mix:ChangeHistory>
          <mix:ImageProcessing>
            <mix:processingAgency>NYU Press</mix:processingAgency>
          </mix:ImageProcessing>
        </mix:ChangeHistory>
      </mix:mix>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

Within a file section, a `<file>` element within a `<fileGrp>` might then identify the administrative metadata pertaining to the file to which it points by referencing an MDID attribute for its `<md>` element:

```xml
<mets:file ID="FILE001" MDID="MD001">
  <mets:FLocat LOCTYPE="URL" LOCREF="http://dlib.nyu.edu/press/testing.tif"/>
</mets:file>
```

Below, there are links to a few technical metadata standards:

- [MIX XML Schema](https://www.loc.gov/standards/mix/)
- [NISO Technical Metadata for Still Images](https://www.niso.org/publications/ansiniso-z3987-2006-r2017-data-dictionary-technical-metadata-digital-still-images)
- [TextMD](https://www.loc.gov/standards/textMD/)
- [AudioMD and VideoMD](https://www.loc.gov/standards/amdvmd/index.html)
