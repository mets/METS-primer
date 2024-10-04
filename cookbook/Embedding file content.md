# Embedding file content: `<FContent>`

The **file content** element `<FContent>` is used to identify a content
file contained internally within a METS document. The content file must
be either Base64 encoded and contained within the subsidiary `<binData>`
wrapper element, or consist of XML information and be contained within
the subsidiary `<xmlData>` wrapper element. An xml data element
`<xmlData>` is used to contain an XML encoded file. The content of an
`<xmlData>` element can be in any namespace or in no namespace. As
permitted by the XML Schema Standard, the processContents attribute
value for the metadata in an `<xmlData>` element is set to "lax".
Therefore, if the source schema and its location are identified by means
of an xsi:schemaLocation attribute, then an XML processor will validate
the elements for which it can find declarations. If a source schema is
not identified, or cannot be found at the specified schemaLocation, then
an XML validator will check for well-formedness, but otherwise skip over
the elements appearing in the `<xmlData>` element. METS default encoding
scheme is UTF-8 Unicode.

See also:

* [[Embedding XML content in METS]]
* [[Embedding binary data in METS]]
##### File content -- example

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www/loc/gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www/loc/gov/METS/v2
   http://www/loc/gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  ...
  <mets:fileSec>
    <mets:fileGrp ID="TIFF_GRP01" USE="MASTER IMAGE">
      <mets:file ID="epi01m" SIZE="65768" CREATED="2006-04-11T07:35:22"
          MIMETYPE="image/tiff" ADMID="MIX_v1.0_TIFF_epio1m">
        <mets:FContent ID="eip01m.tiff" USE="Preservation Master">
          <mets:binData>[base 64 encoded data goes here]</mets:binData>
        </mets:FContent>
      </mets:file>
    </mets:fileGrp>
  <mets:fileSec>
  ...
```