[Image]

## `<mdSec>` Metadata Section

The **metadata section** `<mdSec>` records metadata pertaining to the
METS object as a whole or one of its components. The METS document can
have only one metadata section. Multiple metadata subelements `<md>` are
allowed so that metadata can be recorded for each separate item or
component within the METS document. Metadata elements `<md>` can also be
grouped inside Metadata group elements `<mdGrp>`.

METS does not itself provide a vocabulary or syntax for encoding the
included or referred metadata. Content guidelines are supplied by the
specific standard used. METS does, however, provide a means for linking
this metadata to the digital content of the entity and to other types of
metadata related to the object, such as structural metadata.

### Metadata element

A metadata element `<md>` can either wrap the metadata (mdWrap) or
reference it in an external location (mdRef) or both. For example, a
MODS record can be encoded in XML and embedded into the metadata section
or a MARC record could be included in binary format. Alternately, the
metadata section may simply identify the type of metadata it represents
(for example MARC, EAD), and point to this metadata in its external
location via a URI. This is done by the metadata Wrap `<mdWrap>` and
metadata Reference `<mdRef>` elements, which are discussed in more detail
below.

#### Metadata reference

The **metadata reference** element `<mdRef>` element is used to provide
a pointer to metadata which resides outside the METS document.

NOTE: `<mdRef>` is an empty element; the location of the external
metadata must be recorded in the LOCREF attribute, and can be
supplemented by the XPTR attribute as needed.

#### Metadata reference -- example

The following example demonstrates the use of the `<mdRef>` element.

```xml
<mdSec>
  <md ID="DMD1" USE="DESCRIPTIVE">
    <mdRef MIMETYPE="text/xml" LABEL="MODS record" LOCTYPE="URN"
      MDTYPE="MODS" LOCREF="urn:x-nyu:fales1735"/>
  </md>
</mdSec>
```

#### Metadata wrapper -- Example

A **metadata wrapper** element `<mdWrap>` provides a wrapper around
metadata embedded within a METS document. The element is repeatable.
Such metadata can be in one of two forms:

1.  XML-encoded metadata, with the XML-encoding identifying itself as
    belonging to a namespace other than the METS document namespace.

2.  Any arbitrary binary or textual form, PROVIDED that the metadata is
    Base64 encoded and wrapped in a `<binData>` element within the
    internal metadata element.

#### Internal metadata -- elements

The `<mdWrap>` element has two elements:

1. `<binData>` - a wrapper element to contain Base64 encoded
    metadata.

2. `<xmlData>` - a wrapper element to contain XML encoded metadata.

The content of an `<xmlData>` element can be in any namespace or in no
namespace. As permitted by the XML Schema Standard, the processContents
attribute value for the metadata in an `<xmlData>` is set to "lax".
Therefore, if the source schema and its location are identified by means
of an XML schemaLocation attribute, then an XML processor will validate
the elements for which it can find declarations. If a source schema is
not identified, or cannot be found at the specified schemaLocation, then
an XML validator will check for well-formedness, but otherwise skip over
the elements appearing in the `<xmlData>` element.

#### Descriptive metadata wrapper -- example 1

Descriptive metadata is metadata about the content and context of the
data. With descriptive metadata, the content can be identified and
discover. The following example demonstrate the use of the
`<mdWrap>` element:

```xml
<mets:md ID="DMD1" USE="DESCRIPTIVE">
  <mets:mdWrap MDTYPE="MODS">
    <mets:xmlData>
      <mods:mods>
        <mods:titleInfo>
          <mods:title>Epigrams</mods:title>
        </mods:titleInfo>
        <mods:name type="personal">
          <mods:namePart>Martial</mods:namePart>
        </mods:name>
        <mods:name type="personal">
          <mods:namePart>Ker, Walter C. A. (Walter Charles Alan), 1853-1929</mods:namePart>
        </mods:name>
        <mods:typeOfResource>text</mods:typeOfResource>
        <mods:originInfo>
          <mods:place>
            <mods:placeTerm type="text">London</mods:placeTerm>
          </mods:place>
          <mods:publisher>William Heinemann</mods:publisher>
          <mods:dateIssued point="start">1927</mods:dateIssued>
          <mods:dateIssued point="end">1943</mods:dateIssued>
        </mods:originInfo>
        <mods:language>
          <mods:languageTerm type="text">English</mods:languageTerm>
        </mods:language>
        <mods:physicalDescription>
          <mods:extent>2 v.</mods:extent>
        </mods:physicalDescription>
        <mods:note>v. 1 has imprint: Cambridge, Ma. : Harvard University Press, 1943</mods:note>
        <mods:note>Latin and English on opposite pages.</mods:note>
        <mods:subject authority="lcsh">
          <mods:topic>Epigrams, Latin--Translations into English</mods:topic>
        </mods:subject>
        <mods:relatedItem type="series">
          <mods:titleInfo>
            <mods:title>Loeb classical library></mods:title>
          </mods:titleInfo>
        </mods:relatedItem>
        <mods:accessCondition>Unknown</mods:accessCondition>
        <mods:recordInfo>
          <mods:recordContentSource>METS Editorial Board</mods:recordContentSource>
          <mods:recordCreationDate encoding="iso8601">20060316</mods:recordCreationDate>
        </mods:recordInfo>
      </mods:mods>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

#### Descriptive metadata wrapper -- example 2

```xml
<md ID="dmd003" USE="DESCRIPTIVE">
  <mdWrap MIMETYPE="application/marc" MDTYPE="MARC" LABEL="OPAC Record">
    <binData>MDI0ODdjam0gIDIyMDA1ODkgYSA0NU0wMDAxMDA...
      [base 64 encoded data goes here]
    </binData>
  </mdWrap>
</md>
```

[Image]

#### Technical metadata -- example

A **technical metadata** is metadata about a component of the METS
object, such as a digital content file. One might, for example,
have a `<md>` element which includes technical metadata regarding
a file's preparation:

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

#### Intellectual property rights metadata -- example

A **intellectual property rights** **metadata** is metadata about
copyright and licensing pertaining to a component of the METS object.
Rights metadata can be expressed according current rights description
standards (such as CopyrightMD and rightsDeclarationMD) or a locally
produced XML schema.

```xml
<mets:md ID="ADMRTS1" USE="RIGHTS">
  <mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="METSRights">
    <mets:xmlData>
      <rts:RightsDeclarationMD RIGHTSCATEGORY="PUBLIC DOMAIN">
        <rts:Context CONTEXTCLASS="GENERAL PUBLIC">
          <rts:Constraints CONSTRAINTTYPE="RE-USE">
            <rts:ConstraintDescription>This volume was published in Great
              Britain in 1927 by William Heineman (London) with a reference to
              G.P. Putnam's Sons in New York. (The verso of the title page says
              "Printed in Great Britain" and notes that is was originally
              published in 1920 and reprinted in 1927). Because this work was
              published abroad before 1978 without compliance with US Copyright
              formalities and because it entered the public domain in its home
              country as of 1 January 1996, it is now also considered in the
              public domain in the United States without any constraints on use.
            </rts:ConstraintDescription>
          </rts:Constraints>
        </rts:Context>
      </rts:RightsDeclarationMD>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

#### Source metadata -- example

**Source metadata** is descriptive and administrative metadata about
the source format or media of a component of the METS object such as
a digital content file. It is often used for discovery, data
administration or preservation of the digital object.
Source metadata can be expressed according to current source description
standards (such as PREMIS) or a locally produced XML schema.

For our *Epigrams* example digital object, we could have used
`<sourceMD>` to link to the MARC record describing the print version of
the book from which the images were derived. As another example, when a
digital audio object is created from an open reel tape, we can record
important technical metadata about the tape in `<sourceMD>` within an
`<mdWrap>` element as follows:

```xml
<mets:md ID="SMD_MJF_Tape_0010_Side_A" STATUS="Draft, unformatted"
    CREATED="2006-08-28T15:36:53" USE="SOURCE">
  <mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="Draft AES-X098-SC-03-06-B, version 2006-05-19"
      MIMETYPE="audio/x-wave">
    <mets:xmlData>
      <dataroot xmlns:od="urn:schemas-microsoft-com:officedata"
          generated="2006-08-28T15:36:53">
        <source>
          <ID>1</ID>
          <source_metadata_id>SRC000000001</source_metadata_id>
          <item_face_id_fk>IF000000001</item_face_id_fk>
          <identifier>0001</identifier>
          <identifier_type>MJF tape number</identifier_type>
          <direction>A_PASS</direction>
          <source_format_type>open reel tape</source_format_type>
          <analog_digital_flag>analog</analog_digital_flag>
          <speed>7.5</speed>
          <speed_unit>Inches per second</speed_unit>
          <track_format>half track</track_format>
          <sound_field>stereo</sound_field>
          <noise_reduction>none</noise_reduction>
          <equalization>none</equalization>
          <gauge>0.25</gauge>
          <gauge_unit>Inches</gauge_unit>
          <reel_diameter>7</reel_diameter>
          <reel_diameter_unit>Inches</reel_diameter_unit>
          <bit_depth/>
          <sample_rate/>
        </source>
      </dataroot>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

#### Digital provenance metadata -- example 1

The **digital provenance metadata** could contain metadata about any
preservation-related actions taken on the various files which comprise
a digital object (e.g., those subsequent to the initial digitization of
the files such as transformation or migrations) or, in the case of born
digital materials, the files' creation. In short, digital provenance
should be used to record information that allows both archival/library
staff and scholars to understand what modifications have been made to a
digital object and/or its constituent parts during its life cycle. This
information can then be used to judge how those processes might have
altered or corrupted the object's ability to accurately represent the
original item. One might, for example, record master derivative
relationships and the process by which those derivations have been
created. Digital provenance metadata could contain information regarding
the migration/transformation of a file from its original digitization
(e.g., OCR, TEI, etc.,)to its current incarnation as a digital object
(e.g., JPEG2000). Digital provenance metadata can be
expressed according to current digital provenance description standards
(such as PREMIS) or a locally produced XML schema.

```xml
<mets:md ID="FPRV24_551" USE="PROVENANCE">
  <mets:xmlData>
    <mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="oclcprov">
      <oclcprov:oclcprov>
        <oclcprov:digiprovMD>
          <oclcprov:fixityAlgorithm>Adler-32 </oclcprov:fixityAlgorithm>
          <oclcprov:fixityCheckResults>202947597</oclcprov:fixityCheckResults>
          <oclcprov:fixityCheckStatus>Success</oclcprov:fixityCheckStatus>
          <oclcprov:fixityCheckDate>s006-05-15T09:17:49</oclcprov:fixityCheckDate>
          <oclcprov:virusSoftware>McAfee Virus Scan for Linux v.4.40.0</oclcprov:virusSoftware>
          <oclcprov:virusCheckStatus>Success</oclcprov:virusCheckStatus>
          <oclcprov:virusCheckDate>2006-05-15T09:17:49</oclcprov:virusCheckDate>
          <oclcprov:mimeType>application/pdf</oclcprov:mimeType>
        </oclcprov:digiprovMD>
      </oclcprov:oclcprov>
    </mets:mdWrap>
  </mets:xmlData>
</mets:digiprovMD>
```

#### Digital provenance metadata -- example 2

```xml
<mets:md ID="DP_0755ad93-5fd1-11da-b211-19e7a5cf4814"
    CREATED="2006-11-27T21:37:13" USE="PROVENANCE">
  <mets:mdWrap MDTYPE="PREMIS"
    <mets:xmlData xmlns:premis=http://www.loc.gov/standards/premis/v1
        xsi:schemaLocation="http://www.loc.gov/standards/premis/v1
          http://www.loc.gov/standards/premis/v1/Event-v1-1.xsd">
        <premis:eventIdentifier>
          <premis:eventIdentifierType>Validation</premis:eventIdentifierType>
          <premis:eventIdentifierValue>Ingest_Validation_01</premis:eventIdentifierValue>
        </premis:eventIdentifier>
        <premis:eventType>Validation</premis:eventType>
        <premis:eventDateTime>2006-11-27-08:00</premis:eventDateTime>
        <premis:eventDetail>ValidationResults</premis:eventDetail>
        <premis:eventOutcomeInformation>
        <premis:eventOutcome>Pass</premis:eventOutcome>
          <premis:eventOutcomeDetail>
            <ingestValidation ID="FILE_epi01m.tiff">
              <JhoveOutput>File is of format: TIFF. The file is well
                -formed. The file is valid. </JhoveOutput>
              <IngestValidatorOutput>The computed checksum matches the
                original checksum for file[file:90990250/90990250.pdf]
              </IngestValidatorOutput>
              <IngestValidatorOutput>Original file ID: FILE_epi01m.tiff
                has been changed to FILE_07108e3e-5fd1-11da-b211-19e7a5cf4814
              </IngestValidatorOutput>
              <IngestValidatorOutput>Original file name eip01m>tiff has
                been changed to FILE_07108e3e-5fd1-11da-b211-19e7a5cf4814,pdf
              </IngestValidatorOutput>
            </ingestValidation>
          </premis:eventOutcomeDetail>
        </premis:eventOutcomeInformation>
        <premis:linkingAgentIdentifier>
          <premis:linkingAgentIdentifierType>"Software"/>
          <premis:linkingAgentIdentifierValue>"JHove"/>
        </premis:linkingAgentIdentifier>
        <premis:linkingAgentIdentifier>
          <premis:linkingAgentIdentifierType>"Software"/>
          <premis:linkingAgentIdentifierValue>"SDR_Ingest_Validator"/> </premis:linkingAgentIdentieier>
      </premis:event>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

Examples for implementing PREMIS can be found on the PREMIS
Implementors' Group (PIG) wiki:
http://www.loc.gov/standards/premis/pig.html

