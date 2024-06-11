## **Technical Metadata**
In addition to intellectual property rights information, long-term management and preservation of digital resources requires information regarding the technical characteristics of the digital content.  Such technical metadata about text, image, audio, and video data is best produced when the digital content is originally created.  The following record, encoded using the MIX format conforming to the NISO Z39.87 specification, provides technical metadata for the first master TIFF image in our book:


```xml
<mets:techMD ID="TECHTIFF01">
  <mets:mdWrap MDTYPE="NISOIMG">
    <mets:xmlData>
    <mix:mix>
      <mix:BasicImageParameters>
        <mix:Format>
          <mix:MIMEType>image/tiff</mix:MIMEType>
          <mix:ByteOrder>little-endian</mix:ByteOrder>
          <mix:Compression>
            <mix:CompressionScheme>1</mix:CompressionScheme>
          </mix:Compression>
          <mix:PhotometricInterpretation>
            <;mix:ColorSpace>1</mix:ColorSpace>
          </mix:PhotometricInterpretation>
          <mix:Segments>
            <mix:StripOffsets>17810</mix:StripOffsets>
            <mix:RowsPerStrip>3948</mix:RowsPerStrip>
            <mix:StripByteCounts>10256904</mix:StripByteCounts>
          </mix:Segments>
          <mix:PlanarConfiguration>1</mix:PlanarConfiguration>
        </mix:Format>
        <mix:File>
          <mix:Orientation>1</mix:Orientation>
        </mix:File>
      </mix:BasicImageParameters>
      <mix:ImageCreation>
        <mix:ScanningSystemCapture>
          <mix:ScanningSystemSoftware>
            <mix:ScanningSoftware>Adobe Photoshop CS Macintosh</mix:ScanningSoftware>
          </mix:ScanningSystemSoftware>
        </mix:ScanningSystemCapture>
        <mix:DateTimeCreated>2006-03-13T12:05:05</mix:DateTimeCreated>
      </mix:ImageCreation>
      <mix:ImagingPerformanceAssessment>
        <mix:SpatialMetrics>
          <mix:SamplingFrequencyUnit>2</mix:SamplingFrequencyUnit>
          <mix:XSamplingFrequency>600</mix:XSamplingFrequency>
          <mix:YSamplingFrequency>600</mix:YSamplingFrequency>
          <mix:ImageWidth>2598</mix:ImageWidth>
          <mix:ImageLength>3948</mix:ImageLength>
        </mix:SpatialMetrics>
        <mix:Energetics>
          <mix:BitsPerSample>8&lt;/mix:BitsPerSample>
          <mix:SamplesPerPixel>1&lt;/mix:SamplesPerPixel>
        </mix:Energetics>
      </mix:ImagingPerformanceAssessment>
    </mix:mix>
    </mets:xmlData>
  </mets:mdWrap>
</mets:techMD>
```

As with our other examples, this metadata record is in XML format, and so it is wrapped within `<mdWrap>` and `<xmlData>` tags.  Note that this record is wrapped in a `<techMD>` element (which would itself be inserted in the `<amdSec>` portion of a METS document), and that the `<techMD>` tag has an ID attribute with a value of "TECHTIFF01" allowing us to reference this record from elsewhere in the METS document.

Unlike our previous examples, however, where we wished to associate the metadata records in question with the entirety of the digital object, in this case we want to associate this technical metadata record with a specific image file.  So in this case, we alter the `<file>` tag for the appropriate image file within the `<fileSec>` to include an ADMID attribute linking the image file to the appropriate technical metadata as follows:


```xml
<mets:fileSec>
  <mets:fileGrp USE="archive image">
    <mets:file ID="epi01m" MIMETYPE="image/tiff" ADMID="TECHTIFF01">
      <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/
       full/01.tif" LOCTYPE="URL"/>
    </mets:file>
    . . . 
  </mets:fileGrp>
</mets:fileSec>
```