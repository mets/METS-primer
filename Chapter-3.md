Juha is currently editing:

- Select just needed parts with critical approach
- Transform to METS 2 and uniform layout with other Chapters
- Possibly merge Chapters 2 and 3 ?
- Split to separate subpages

***

[Image]

# Chapter 3: From the schema perspective

This chapter will discuss and expand on upon the schema and as such will
present sections, elements and attributes in the same order as they
appear in the schema. Early reviews requested that elements be expressed
in their `<element>` form in this chapter. The first time reader will
encounter instances where an `<element>` name is not fully spelled out
prior to use, for example when an element encountered earlier in the
schema is referenced. This chapter was envisioned primarily as a
reference tool for implementers who wish to dip in and out of specific
sections as needed.

As discussed in Chapter 2 many of the examples will be drawn from
Martial's *Epigrams*, for consistency and for the ease of using a text
to illustrate these concepts. Although text is not the only genre or
content type that may be encoded using METS, most of the examples are
drawn from images of pages of text. METS has also been used to encode
audio, video, audio/video, TEI, and other formats. In cases where other
content type structures can concisely illustrate usage they will be used
as well.

This documentation uses the term "METS document" to refer to the
serialized XML document conforming to the METS schema. By contrast, the
term "METS object" refers to the entire digital artifact represented by
the METS document, including any externally referenced content or
metadata needed to constitute a complete object. How an implementer
chooses to use the identifiers associated with the mets root element may
vary depending upon the situation.

[Image]

## `<mets>` METS root element

The root element `<mets>` establishes the container for the information
being stored and/or transmitted by the standard.

```xml
<mets:mets OBJID="loc.natlib.ihas.200003790"
 PROFILE="http://www.loc.gov/mets/profiles/00000007.xml"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
   http://www.loc.gov/standards/mets/mets.xsd">
```

### Elements contained in the root element

The METS document structure consists of seven major sections, which in
turn may contain a variety of elements and attributes as specified in
the METS schema.

At the most general level a METS document may contain the following
sections: each of which is described in its own section of this chapter.

**METS Header** -- The METS Header contains metadata describing the METS
document itself, including such information as creator, editor, etc.

**Metadata Section** -- This section contains metadata that is external
to the METS document, internally embedded metadata, or both. Multiple
instances of both external and internal metadata may be included in the
metadata section. The Metadata Section can have for example descriptive
metadata, information about how the files were created and stored,
intellectual property rights, metadata regarding the original source
object from which the digital object was derived, information regarding
the provenance of the files that comprise the object (i.e.,
master/derivative file relationships, and migration/transformation
information).

**File Section** -- A list of all files that contain content which make
up the electronic versions of the digital object. File elements may be
grouped within File Group elements, to provide for subdividing the files
by object version or other criteria such as file type, size etc.

**Structural Map Section** -- Structural Map Section outlines a
hierarchical structure for the digital object, and links the elements
of that structure to content files and metadata that pertain to each
element.

### METS root element example

This example uses: XML version 1.0 with UTF-8 encoding, an enumerated
list of the standards used in this record with the URLs, the OBJID for
this digital object represented by the METS document in the form of a
URN, and a human readable LABEL which describes the work being encoded
(in this case, the title of the work).

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
   http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz"
 LABEL="Martial Epigrams">
```

[Image]

## `<metsHdr>` METS Header 

The **mets header** element `<metsHdr>` captures metadata about the METS
document itself, not the digital object the METS document encodes.
Although it records a more limited set of metadata, it is very similar
in function and purpose to the headers employed in other schema such as
the Text Encoding Initiative (TEI) or in the Encoded Archival
Description (EAD).

### Elements contained in the METS header

The `<metsHdr>` may include: document author or agent, any alternative
identifiers for a METS document, creation and update dates and times,
and the status of the METS document.

#### Agent

The **agent** element `<agent>` provides for various parties and their
roles with respect to the METS record to be documented.

#### Agent -- elements

The element `<agent>` has two sub-elements, **name** `<name>` and
**note** `<note>`. The element `<name>` can be used to record the full
name of the document agent. The `<note>` element can be used to record
any additional information regarding the agent's activities with
respect to the METS document.

#### Agent -- example

This example shows a METS document that was created on 9th of May 2006
at 10:30 a.m., by Rick Beaubien.

```xml
<metsHdr CREATEDATE="2006-05-09T10:30:00">
  <mets:agent ROLE="CREATOR">
    <mets:name>Rick Beaubien</mets:name>
  </mets:agent>
</metsHdr>
```

#### Alternative identifiers

The **alternative identifier** element `<altRecordID>` allows one to use
alternative record identifier values for the digital object represented
by the METS document; the primary record identifier is stored in the
OBJID attribute in the root `<mets>` element.

#### Alternative identifiers -- examples

First example: expanding on the basic example, altRecordID reflects the
Library of Congress Control Number (LCCN) associated with the
manifestation "20023838".

```xml
<metsHdr CREATEDATE="2006-05-09T00:00:00>
  <mets:agent ROLE="CREATOR">
    <mets:name>Rick Beaubien</mets:name>
  </mets:agent>
  <mets:altRecordID TYPE="LCCN">20022838</mets:altRecordID>
<mets:metsHdr>
```

In the second example, altRecordID reflects the University of
California, San Diego's internal identification code for the object;
this example also reflects various uses of the role attribute on agent.

```xml
<metsHdr CREATEDATE="2004-02-22T00:00:00"
    LASTMODDATE="2004-03-16T00:00:00" RECORDSTATUS="production">
  <mets:agent ROLE="CREATOR" TYPE="ORGANIZATION">
    <mets:name>UCSD</mets:name>
    <mets:note>SIP METS submitted to CDL.</mets:note>
  </mets:agent>
  <mets:agent ROLE="PRESERVATION" TYPE="ORGANIZATION">
    <mets:name>California Digital Library</mats:name>
    <mets:note>SIP METS and associated file(s) placed in Preservation Repository.</mets:note>
  </mets:agent>
  <mets:agent ROLE="EDITOR" TYPE="ORGANIZATION">
    <mets:name>California Digital Library</mets:name>
    <mets:note>DIP METS created.</mets:note>
  </mets:agent>
  <mets:agent ROLE="DISSEMINATOR" TYPE="ORGANIZATION">
    <mets:name>California Digital Library</mets:name>
    <mets:note>Object placed in production.</mets:note>
  </mets:agent>
  <mets:altRecordID TYPE="UCSD">siogc29s5</altRecordID>
</metsHdr>
```

### METS header example

Modification to this example record is indicated in LASTMODDATE.

```xml
<metsHdr CREATEDATE="2006-05-09T15:00:00"
    LASTMODDATE="2006-05-09T21:00:00>
  <mets:agent ROLE="CREATOR" TYPE="INDIVIDUAL">
    <mets:name>Rick Beaubien</mets:name>
  </mets:agent>
  <mets:altRecordID TYPE="LCCN">20022838</mets:altRecordID>
</metsHdr>
```

[Image]

## `<mdSec>` Metadata Section

The **metadata section** `<mdSec>` records metadata pertaining to the
METS object as a whole or one of its components. The METS document can
have only one metadata section. Multiple metadata subelements `<md>` are
allowed so that descriptive metadata can be recorded for each separate
item or component within the METS document. Metadata elements `<md>`
can also be grouped inside Metadata group elements `<mdGrp>`.

METS does not itself provide a vocabulary or syntax for encoding the
included or referred metadata. Content guidelines are supplied by the
specific descriptive standard used. METS does, however, provide a means
for linking this metadata to the digital content of the entity and to
other types of metadata related to the object, such as structural
metadata.

### Descriptive metadata elements

A metadata element `<md>` can either wrap the metadata (mdWrap) or
reference it in an external location (mdRef) or both. For example, a
MODS record can be encoded in XML and embedded into the descriptive
metadata section or a MARC record could be included in binary format.
Alternately, the descriptive metadata section may simply identify the
type of descriptive metadata it represents (MARC, EAD, etc), and point
to this metadata in its external location via a URI. This is done by the
metadata Wrap `<mdWrap>` and metadata Reference `<mdRef>` elements,
which are discussed in more detail below.

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
    internal descriptive metadata element.

#### Internal descriptive metadata -- elements

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

The following examples demonstrate the use of the `<mdWrap>` element:

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
          <oclcprov:fixityAlgorithm>Adler-32 </oclcprov:fixityAlgorith>
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
          <premis:linkingAgentIdentidierValue>"SDR_Ingest_Validator"/>
        </premis:linkingAgentIdentidier>
      </premis:event>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

Examples for implementing PREMIS can be found on the PREMIS
Implemention Group (PIG) wiki:
http://www.loc.gov.standards/premis/pig.html

[Image]

## `<file>` File section

The overall purpose of the content **file section** element `<fileSec>`
is to provide an inventory of and the location for the content files
that comprise the digital object being described in the METS document.
This element contains a `<fileGrp>` element which allows files to be
grouped together for various purposes (e.g., by format or use). Within
each `<fileGrp>` there is a `<file>` element for each file that
comprises the encoded document; the `<fileGrp>` elements may also be
used to bring together related files that are relevant to the
composition or rendering of the digital object being described.

`<fileGrp>` may point to pertinent metadata groups `<mdGrp>` and
metadata elements `<md>` in the Metadata Section `<mdSec>` of the METS
document by means of an MDID attribute.

Similarly, `<file>`s within a `<fileGrp>` may point to metadata using
MDID attribute. See `<fileGrp>` discussion below.

### Elements Contained in the File Section

#### File group

A sequence of file group elements `<fileGrp>` can be used group the
digital files comprising the content of a METS object either into a
flat arrangement. In the case where the content files are
images of different formats and resolutions, for example, one could
group the image content files by format and create a separate
`<fileGrp>` for each image format/resolution such as:

-   one `<fileGrp>` for the thumbnails of the images
-   one `<fileGrp>` for the higher resolution JPEGs of the image
-   one `<fileGrp>` for the master archival TIFFs of the images

A `<fileGrp>` may contain zero or more `<file>` elements. As
described below, a `<file>` element may contain `<FLocat>` pointers to
one or more external content files via a URI and/or may itself contain
the file content as XML or binary data using the `<FContent>` element.

Nested (hierarchical) arrangement with file groups is not allowed,
since complex structures are meant to be described in the Structural
map section `<structSec>`. 

#### File group -- example

The following METS fragment represents the page images of a book that
are in TIFF format. Other `<fileGrp>`s in this situation may be those
which pull together the JPEG or the GIF manifestations of the same page
images. The following METS fragment represents the TIFF page images of a
book:

```xml
<mets:mets xmlns:mets="http://www/loc.gov/METS/v2"
 xmlns:xsi="http://www/w3/org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
 http://www.loc.gov/standards/mets/mets.xsd" OBJID="ark:/13010/kt9s2009hz"
 LABEL="Martial Epigrams">
  ...
  <mets:fileSec>
    <mets:fileGrp ID="TIFF_GRP01" USE="MASTER IMAGE">
      ...
  </mets:fileSec>
  ...
```

There may be other `<fileGrp>`s in this situation that pull together
JPEG or GIF manifestations of the same pages.

#### File (element) 

The **file element** `<file>` provides access to the content files for
the digital object being described by the METS document. A `<file>`
element may contain one or more `<FLocat>` elements which provide
pointers to a content file and/or a `<FContent>` element which wraps an
encoded version of the file. Embedding files using `<FContent>` can be a
valuable feature for exchanging digital objects between repositories or
for archiving versions of digital objects for off-site storage. All
`<FLocat>` and `<FContent>` elements should identify and/or contain
identical copies of a single file. The `<file>` element is recursive,
thus allowing sub-files or component files of a larger file to be listed
in the inventory. For example, files contained within an archive tar or
zip file could be represented this way. Alternatively, by using the
`<stream>` element, a smaller component of a file or of a related file
can be placed within a `<file>` element. Finally, by using the
`<transformFile>` element, it is possible to include within a `<file>`
element a different version of a file that has undergone a
transformation for some reason, such as format migration.

#### File (element) -- example

The physical book example that we have been using represents each page
by `<div>`s, one for each of the three different image manifestations
(TIFF, JPEG, or GIF). The `<fileGrp>` of the TIFF images is represented
in the following example as a single file within that group.

```xml
<?xml version="1.0" encoding="UTF-8">
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

#### File location

The **file location** element `<FLocat>` provides a pointer to the
location of a content file. 

NOTE: `<FLocat>` is an empty element. The location of the resource
pointed to MUST be stored in the LOCREF attribute.

#### File Location -- example

In the following example, the `<fileGrp>` of the TIFF images is
represented as is a single `<file>` within that group and the file
location:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www/loc/gov/METS/v2"
 xmlns:xsi="http://www/w3/org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www/loc/gov/METS/v2
 http://www/loc/gov/standards/mets/mets.xsd" OBJID="ark:/13030/kt9s2009hz"
 LABEL="Martial Epigrams">
  ...
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
  ...
```

#### File content

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

#### File content -- example

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

#### Component byte stream

A **component byte stream** element `<stream>` may be composed of one or
more subsidiary streams. An MPEG4 file, for example, might contain
separate audio and video streams, each of which is associated with
technical metadata. The repeatable `<stream>` element provides a
mechanism to record the existence of separate data streams within a
particular file, and the opportunity to associate metadata element `<md>`
with those subsidiary data streams if desired.

#### Component byte stream -- example

Excerpted in the following simplified example is a file section from a
digital object for an oral history interview which is expressed in three
different formats:

  - a TEI-encoded transcript
  - a master audio file in WAV format
  - a derivative audio file in MP3 format

Within the TEI-encoded transcript is embedded a fragment of the audio
file in WAV format which expresses the oral representation of a given
section of the transcript. The XML fragment for the mixed content file
could be illustrated as follows:

```xml
<mets:fileSec>
  <mets:fileGrp ID="FORMAT1" USE="Transcription">
    <mets:file ID="FILE001" MIMETYPE="application/xml"
        SIZE="257537" CREATED="2001-06-10">
      <mets:FLocat LOCTYPE="URL"
          LOCREF="http://dlib.nyu.edu/tamwag/beame.xml"
      </mets:FLocat>
    </mets:file>
  </mets:fileGrp>
  <mets:fileGrp ID="FORMAT2" USE="Master Audio">
    <mets:file ID="FILE002" MIMETYPE="audio/wav" SIZE="64232836"
        CREATED="2001-05-17" GROUPID="AUDIO1">
      <mets:FLocat LOCTYPE="URL"
        LOCREF="http://dlib/nyu.edu/tamwag/beame.wav"
      </mets:FLocat>
    </mets:file>
  </mets:fileGrp>
  <mets:fileGrp ID="MIXEDFORMAT" VERSDATE="2005-4-14"
      USE="Master Component Playback">
    <mets:file ID="FILE004_01" MIMETYPE="application/xml" SIZE="2566764"
        CREATED="2005-4-14">
      <mets:FLocat LOCTYPE="URL"
        LOCREF="http://dlib.nyu.edu/tamwag/beame_comp01.xml"/>
      <mets:stream ID="BEAME_COMP_01" streamType="AUDIO/X-WAV"
        OWNERID="HIST_DEPT05_BEAME_COMP_O1" MDID="MODS_BEAME_COMP_01"/>
    </mets:file>
  </mets:fileGrp>
</mets:fileSec>
```

#### Transform file

The **transform file** `<transformFile>` element provides a means to
access any subsidiary files listed below a `<file>` element by
indicating the steps required to "unpack" or transform the subsidiary
files. This element is repeatable.

#### Transform file -- example 

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

#### Complete file section -- example 1

Each physical page from the book has is represented by three associated
content files in the TIFF, JPEG and GIF formats.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
   http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  ...
  <mets:fileSec>
    <mets:fileGrp USE="MASTER IMAGE">
      <mets:file ID="epi01m" MIMETYPE="image/tiff">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/full/01/tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02m" MIMETYPE="image/tiff">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/full/02.tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03m" MIMETYPE="image/tiff">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/full/03.tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04m" MIMETYPE="image/tiff">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/full/04.tif"
          LOCTYPE="URL"/>
      </mets:file> ...
    </mets:fileGrp>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi01r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/01.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/02.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/03.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/04.jpg"
          LOCTYPE="URL"/>
      </mets:file> ...
    </mets:fileGrp>
    <mets:fileGrp USE="THUMBNAIL IMAGE">
      <mets:file ID="epi01t" MIMETYPE="image/gif">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/gif/01.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02t" MIMETYPE="image/gif">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/gif/02.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03t" MIMETYPE="image/gif">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/gif/03.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04t" MIMETYPE="image/gif">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/gif/04.gif"
          LOCTYPE="URL"/>
      </mets:file> ...
    </mets:fileGrp>
  </mets:fileSec>
</mets:mets>
```

#### Complete file section -- example 2

Again, consider the example of a `<fileSec>` for an oral history
interview which is expressed in three different formats:

- a TEI-encoded transcript
- a master audio file in WAV format
- a derivative audio file in MP3 format.

In this case, the `<fileSec>` contains three subsidiary `<fileGrp>`
elements, one for each different format of the object. The first is an
XML-encoded transcription file, the second is a master audio file in WAV
format, and the third is a derivative audio file in MP3 format. While
such a basic example does not really seem to need the `<fileGrp>`
elements to distinguish the different versions of the object, it does
llustrate how `<fileGrp>` could be useful for objects consisting of
large numbers of scanned page images, or indeed any case where a single
version of the object consists of a large number of files. In those
cases, being able to separate `<file>` elements into `<fileGrp>`
elements makes identifying the files that belong to a particular version
of the document a simple task.

Note the presence of the GROUPID attributes with identical values in the
two audio `<file>` elements, "AUDIO01." These indicate that the two
files, while belonging to different formats of the object, contain the
same basic information. You can use the GROUPID in the same way to
indicate equivalent page image files in digital library objects
containing many scanned page images.

The XML fragment of the mixed format digital object could be illustrated
as follows:

```xml
<mets:fileSec>
  <mets:fileGrp ID="FORMAT1" USE="Transcription">
    <mets:file ID="FILE001" MIMETYPE="application/xml" SIZE="257537"
        CREATED="2001-06-10">
      <mets:FLocat LOCTYPE="URL" LOCREF="http://dlib.nyu.edu/tamwag/beame.xml"/>
    </mets:file>
  </mets:fileGrp>
  <mets:fileGrp ID="FORMAT2" USE="Master Audio">
    <mets:file ID="FILE002" MIMETYPE="audio/wav" SIZE="64232836" CREATED="2001-05-17"
        GROUPID="AUDIO1">
      <mets:FLocat LOCTYPE="URL" LOCREF="http://dlib.nyu.edu/tamwag/beame.wav"/>
    </mets:file>
  </mets:fileGrp>
  <mets:fileGrp ID="FORMAT3" VERSDATE="2001-05-18" USE="Derivative Audio">
    <mets:file ID="FILE003" MIMETYPE="audio/mpeg" SIZE="8238866"
        CREATED="2001-05-18" GROUPID="AUDIO1">
      <mets:FLocat LOCTYPE="URL" LOCREF="http://dlib.nyu.edu/tamwag/beame.mp3"/>
    </mets:file>
  </mets:fileGrp>
</mets:fileSec>
```

[Image]

## `<structSec>` Structural map section

The **structural map section** `<structMap>` provides a means for
organizing the digital content represented by the `<file>` elements
in the `<fileSec>` of the METS document into a coherent hierarchical
structure. (Note, if there is any other structure that better suits
your needs that is fine, but hierarchical structures are most
prevalently used here.) Such a hierarchical structure can be presented
to users to facilitate their comprehension and navigation of the
digital content. It can further be applied to any purpose requiring
an understanding of the structural relationship of the content files or
parts of the content files. The organization may be specified to any
level of granularity (intellectual and or physical) that is desired.
The section may contain one or more structural maps, with using
repeatable <structMap> element, which allows more than one structure
to apply to the digital content represented by the METS document.

The structure provided by the `<structMap>` may be purely
intellectual or logical (such as a book divided into chapters), purely
physical (a book divided into sequences of pages), or a mixture of
logical and physical (a book sub-divided into chapters and subsequently
divided into a sequence of pages). The content organized by the
`<structMap>` may include many mixtures of digital content files:
structured or unstructured text, image, audio, video and/or application
(such as pdf).

In addition to the content represented by the files in the `<fileSec>`
of the same METS documents, the `<structMap>` may also encompass and
organize content represented by integral, external METS documents. Thus,
the `<structMap>` of a METS document representing a digital version of a
journal series might organize the multiple external METS documents
representing the individual issues of the journal in the order of
publication. The `<structMap>`s of the METS documents representing the
individual issues might then organize their content.

In addition to providing a means for organizing content, the
`<structMap>` provides a mechanism for linking content at any
hierarchical level with relevant descriptive and administrative
metadata. For more on this type of linking see the section on the
`<div>` element below.

The hierarchical structure specified by a `<structMap>` is encoded as a
tree of nested `<div>` elements. A `<div>` element may directly point to
content via child file pointer `<fptr>` elements (if the content is
represented in the `<fileSec>` or child METS pointer `<mptr>` elements
(if the content is represented by an external METS document). The
`<fptr>` element may point to a single whole `<file>` element that
manifests its parent `<div>`, or to part of a `<file>` that manifests
its `<div>` It can also point to multiple files or parts of files that
must be played/displayed either in sequence or in parallel to reveal its
structural division. The `<div>`, `<mptr>`, `<fptr>`, and other
`<structMap>` elements that make this sophisticated structuring possible
are described in detail below.

The example encodings in this `<structMap>` section show a variety of
possible ways of structuring a digital version of the Martial
*Epigrams*, some more plausible than others. The main intent throughout
is not to present definitive encodings, but rather just to demonstrate
the variety and flexibility of the structural mechanisms offered by
METS. The best structural choices for a particular work depends on a
variety of factors: the nature of the work being digitized, the
anticipated users of the digital version, the kind or kinds of
presentation desired, the capabilities of the available presentation
programs, etc.

### Elements contained in the structural map section

#### Division

The structural divisions of the hierarchical organization provided by a
`<structMap>` are represented by **division** `<div>` elements, which
can be nested to any depth. Each `<div>` element can represent either an
intellectual (logical) division or a physical division. It can
explicitly identify the form of `<div>` it represents via its TYPE
attribute. Thus in the case of a digitized book subdivided by the
`<structMap>` into nested `<div>` elements representing chapters and
then pages, the TYPE attribute values of the `<div>` elements at each
successive level of the hierarchy might be "book", "chapter", and
"page".

The optional LABEL attribute value can identify a `<div>` element in a
specific manner suitable for presentation to the user of the digital
object. So, a hierarchical presentation of the `<div>` LABEL attribute
values would typically form a kind of "table of contents" that digital
library patrons could use to comprehend and navigate the content
represented by a digital object encoded using METS. The LABEL attribute
could, of course, serve different purposes in different applications of
the METS standard.

`<fileGrp>` may point to pertinent metadata groups `<mdGrp>` and
metadata elements `<md>` in the Metadata Section `<mdSec>` of the METS
document by means of an MDID attribute.

A `<div>` element at any level can be associated with one or more
metadata groups `<mdGrp>` and metadata elements `<md>` in the Metadata
Section `<mdSec>` of the METS document by means of its MDID attribute. It
is assumed that any metadata referenced by a `<div>` element pertains to
the division as a whole. For example: the root `<div>` in a digital object
encoded using METS that represents a video might point to a `<md>` element
that expresses the copyright and access restriction information for the
entire video.

#### Division -- example

The simple encoding fragment below demonstrates the div features
described thus far, including the TYPE, LABEL, and MDID attributes.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:mods="http://www.loc.gov/mods/v3"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
 http://www.loc.gov/standards/mets/mets.xsd
 http://www.loc.gov/mods/v3 http://www.loc.gov/mods/v3/mods-3-1.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:mdSec>
    <mets:md ID="DMD1" USE="DESCRIPTIVE">
      <mets:mdWrap MDTYPE="MODS">
        <mets:xmlData>
          <mods:mods>
            <mods:titleInfo>
              <mods:title>Martial Epigrams</mods:title>
            </mods:titleInfo>
          </mods:mods>
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
  </mets:mdSec>
  ...
  <mets:structSec>
    <mets:structMap TYPE="physical">
      <mets:div TYPE="book" LABEL="Martial Epigrams II" MDID="DMD1">
        <mets:div TYPE="page" LABEL="Blank page"/>
        <mets:div TYPE="page" LABEL="Page i: Series title page"/>
        <mets:div TYPE="page" LABEL="Page ii: Blank page"/>
        <mets:div TYPE="page" LABEL="Page iii: Title page"/>
        <mets:div TYPE="page" LABEL="Page iv: Publication info"/>
        <mets:div TYPE="page" LABEL="Page v: Table of contents"/>
        <mets:div TYPE="page" LABEL="Page vi: Blank page"/>
        <mets:div TYPE="page" LABEL="Page 1: Half title page"/>
        <mets:div TYPE="page" LABEL="Page 2 (Latin)"/>
        <mets:div TYPE="page" LABEL="Page 3 (English)"/>
        <mets:div TYPE="page" LABEL="Page 4 (Latin)">
        <mets:div TYPE="page" LABEL="Page 5 (English)"/>
        <mets:div TYPE="page" LABEL="Page 6 (Latin)"/>
        <mets:div TYPE="page" LABEL="Page 7 (English)"/>
      </mets:div>
    </mets:structMap>
  </mets:structSec>
</mets:mets>
```

Through its subsidiary elements, each `<div>` element points to the
digital content that manifests it. It can do so through one or more
`<mptr>` element, if this content is represented by one or more external
METS documents, or through one or more `<fptr>` element, if this content
is represented by one or more `<file>` elements in the `<fileSec>` In
addition to or instead of directly pointing to digital content via its
child `<fptr>` and/or `<mptr>` elements, a `<div>` element may itself
contain `<div>` elements that further subdivide the content represented
by the division.

#### File pointer

The `<fptr>` or **file pointer** element represents digital content that
manifests its parent `<div>` element. The content represented by an
`<fptr>` element must consist of integral files or parts of files that
are represented by `<file>` elements in the `<fileSec>` Via its FILEID
attribute, an `<fptr>` may point directly to a single integral `<file>`
element that manifests a structural division. (See the section in
Chapter 4 on internal linking above, and the description of the FILEID
attribute in the attribute table for the `<fptr>` element below).
However, an `<fptr>` element may also govern an `<area>` element, a
`<par>` element, or a `<seq>` element which in turn would point to the
relevant file or files. A child `<area>` element can point to part of a
`<file>` that manifests a division, while the `<par>` and `<seq>`
elements can point to multiple files or parts of files that together
manifest a division. (For fuller information on the `<area>`, `<par>`,
and `<seq>` elements see the dedicated sections below).

More than one `<fptr>` element can be associated with a `<div>` element.
Typically sibling `<fptr>` elements represent alternative versions, or
manifestations, of the same content. For example, a page of a manuscript
might be represented by a thumbnail image, a reference image, a master
image, and a structured text version of the page content. Each of these
versions would be represented by a `<file>` element in the `<fileSec>`
The `<div>` element in the `<structMap>` corresponding to this page of
the manuscript would therefore have four child `<fptr>` elements, each
of which points to one of the alternative versions of the content.
Typically sibling `<fptr>` elements represent alternative versions, or
manifestations, of the same content. Additional attributes associated
with the `<fptr>` element include ID and CONTENTIDS. Descriptions of all
of the attributes associated with the `<fptr>` element appear in the
table below.

#### File pointer -- example

The following METS encoding fragment represents a case where the
`<structMap>` as a whole represents a purely physical structure. The
root division represents the whole book, and each structural division
under this root represents a physical page. Each page division has three
associated content files, each of which represents a different image
manifestation (TIFF, JPEG, or GIF) of the same content:

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
 http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams II">
  ...
  <mets:fileSec>
    <mets:fileGrp USE="MASTER IMAGE">
      <mets:file ID="epi01m" MIMETYPE="image/tiff">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/full01.tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02m" MIMETYPE="image/tiff">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/full/02.tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03m" MIMETYPE="image/tiff">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/full/03.tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04m" MIMETYPE="image/tiff">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/full/04.tif"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi01r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/01.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/02.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/03.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/04.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
    <mets:fileGrp USE="THUMBNAIL IMAGE">
      <mets:file ID="epi01t" MIMETYPE="image/gif">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/gif/01.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02t" MIMETYPE="image/gif">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/gif/02.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03t" MIMETYPE="image/gif">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/gif/03.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04t" MIMETYPE="image/gif">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/gif/04.gif"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structSec>
    <mets:structMap TYPE="physical">
      <mets:div TYPE="book" LABEL="Martial Epigrams II" MDID="DMD1">
        <mets:div TYPE="page" LABEL="Blank page">
          <mets:fptr FILEID="epi01m"/>
          <mets:fptr FILEID="epi01r"/>
          <mets:fptr FILEID="epi01t"/>
        </mets:div>
        <mets:div TYPE="page" LABEL="Page i: Half title page">
          <mets:fptr FILEID="epi02m"/>
          <mets:fptr FILEID="epi02r"/>
          <mets:fptr FILEID="epi02t"/>
        </mets:div>
        <mets:div TYPE="page" LABEL="Page ii: Blank page">
          <mets:fptr FILEID="epi03m"/>
          <mets:fptr FILEID="epi03r"/>
          <mets:fptr FILEID="epi03t"/>
        </mets:div>
        <mets:div TYPE="page" LABEL="Page iii: Title page">
          <mets:fptr FILEID="epi04m"/>
          <mets:fptr FILEID="epi04r"/>
          <mets:fptr FILEID="epi04t"/>
        </mets:div>
        ...
      </mets:div>
    </mets:structMap>
  <mets:structSec>
</mets:mets>
```

#### METS pointer 

Like the `<fptr>` element, the **METS pointer** `<mptr>` element
represents digital content that manifests its parent `<div>` element.
Unlike the `<fptr>`, which either directly or indirectly points to
content represented in the `<fileSec>` of the parent METS document, the
`<mptr>` element points to content represented by an external METS
document. Thus, this element allows multiple discrete and separate METS
documents to be organized at a higher level by a separate METS document.
For example, METS documents representing the individual issues in the
series of a journal could be grouped together and organized by a higher
level METS document that represents the entire journal series. Each of
the `<div>` elements in the `<structMap>` of the METS document
representing the journal series would point to a METS document
representing an issue. It would do so via a child `<mptr>` element. Thus
the `<mptr>` element gives METS users considerable flexibility in
managing the depth of the `<structMap>` hierarchy of individual METS
documents.

The `<mptr>` element points to an external METS document by means of an
LOCREF attribute as described in the section on external linking. (See
Chapter 4). This is the same mechanism used for associating `<file>`
elements with external content files in the FLocat element.

#### Mets pointer -- example

The example below illustrates the application of the `<mptr>` element to
the case of a book issued in two volumes, each of which is represented
by a discrete METS document. Using the `<mptr>` element, the METS
document below binds the two separate METS documents representing the
individual volumes together into a single METS document representing the
entire two-volume set.

```xml 
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:mods="http://www.loc.gov/mods/v3"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
   http://www.loc.gov/standards/mets/mets.xsd
   http://www.loc.gov/mods/v3
   http://www.loc.gov/mods/v3/mods-3-1.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams I &amp; II">
  <mets:mdSec>
    <mets:md ID="DMD1" USE="DESCRIPTIVE">
      <mets:mdWrap MDTYPE="MODS">
        <mets:xmlData>
          <mods:mods>
            <mods:titleInfo>
              <mods:title>Epigrams / Martial ; with an English translation by
                Walter C.A. Ker</mods:title>
            </mods:titleInfo>
            <mods:physicalDescription>
              <mods:extent>2 v. ; 17 cm</mods:extent>
            </mods:physicalDescription>
          </mods:mods>
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
  </mets:mdSec>
  ...
  <mets:structSec>
    <mets:structMap TYPE="physical">
      <mets:div TYPE="multivolume book" LABEL="Martial Epigrams I &amp; II" MDID="DMD1">
        <mets:div TYPE="volume" LABEL="Volume I">
          <mets:mptr LOCTYPE="URL"
            LOCREF="http://www.loc.gov/standards/mets/documentation MatrialEpigrams.xml"/>
        </mets:div>
        <mets:div TYPE="volume" LABEL="Volume II">
          <mets:mptr LOCTYPE="URL"
            LOCREF="http://www.loc.gov/standards/mets/documentation/MatialEpigramsII.xml"/>
        </mets:div>
      </mets:div>
    </mets:structMap>
  </mets:structSec>
</mets:mets>
```

#### Area

The **area** `<area>` element typically points to content consisting of
just a portion or area of a file represented by a `<file>` element in
the `<fileSec>` In some contexts, however, the `<area>` element can
also point to content represented by an integral file.

A single `<area>` element would appear as the direct child of a `<fptr>`
element when only a portion of a `<file>`, rather than an integral
`<file>`, manifested the digital content represented by the `<fptr>` In
this case the `<area>` element both identifies the pertinent `<file>`
via its FILEID attribute and specifies the pertinent area of that file
via its SHAPE and COORDS attributes (in the case of image content) or
some combination of BETYPE, BEGIN, END, EXTTYPE and EXTENT attributes
(in the case of text or audio /video content).

Multiple `<area>` elements would appear as the direct children of a
`<par>` element or a `<seq>` element when multiple files or parts of
files manifested the digital content represented by an `<fptr>` element.
As described below, the `<par>` and `<seq>` elements are used to group
multiple files or parts of files that must be played/displayed in
parallel or in sequence to manifest the digital content represented by
the parent `<fptr>` element. In these cases, each individual file, or
file segment, would be represented by a child `<area>` element. When
used as the direct child of an `<fptr>` element, as is described in the
paragraph above, the `<area>` element typically points to just an area
or segment of an integral file. When used in the context of a `<par>` or
`<seq>` element, however, an area element can point either to an
integral file or to a segment of a file as necessary.

#### Area -- example

The example below demonstrates the use of the `<area>` element to
isolate particular areas of the image files that are referenced in the
associated FILEID attributes. It shows both uses of the `<area>` element
as a direct child of an `<fptr>` element and as a direct child of a
`<seq>` element. In the former case, the specified area of the
referenced image manifests the parent division by itself. In the latter
case, the specified areas of two different images must be displayed in
sequence to fully manifest the parent division.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
 http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:fileSec>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi09r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/09.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi11r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/11.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi13r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpeg/13.jpg"
          LOCTYPE="URL"/>
      </mets:file>
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structSec>
    <mets:structMap TYPE="logical">
      <mets:div TYPE="volume" LABEL="Martial Epigrams II">
        <mets:div TYPE="section" LABEL="Book VIII">
          <mets:div TYPE="introduction" LABEL="Introduction: Latin">
            <mets:fptr>
              <mets:seq>
                <mets:area FILEID="epi09r" SHAPE="RECT" COORDS="0,1150,2500,3150"/>
                <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,600,2500,900"/>
              </mets:seq>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram I: Latin">
            <mets:fptr>
              <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,1000,2500,1500"/>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram II: Latin">
            <mets:fptr>
              <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,1500,2500,2350"/>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram III: Latin">
            <mets:fptr>
              <mets:seq>
                <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,2350,2500,3050"/>
                <mets:area FILEID="epi13r" SHAPE="RECT" COORDS="0,500,2500,2100"/>
              </mets:seq>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram IV: Latin">
            <mets:fptr>
              <mets:area FILEID="epi13r" SHAPE="RECT" COORDS="0,2100,2500,2700"/>
            </mets:fptr>
          </mets:div>
        </mets:div>
      </mets:div>
    </mets:structMap>
  <mets:structSec>
</mets:mets>
```

For further examples of how the `<area>` element can be used in the
context of the `<seq>` and `<par>` elements, see the sections on these
elements immediately below.

#### Sequence of files 

The sequence of files `<seq>` element aggregates pointers to files,
parts of files and/or parallel sets of files or parts of files that must
be played or displayed sequentially to manifest a block of digital
content. This might be the case, for example, if the parent `<div>`
element represented a logical division, such as a diary entry, that
spanned multiple pages of a diary and, hence, multiple page image files.
In this case, a `<seq>` element would aggregate multiple, sequentially
arranged `<area>` elements, each of which pointed to one of the image
files that must be presented sequentially to manifest the entire diary
entry. If the diary entry started in the middle of a page, then the
first `<area>` element (representing the page on which the diary entry
starts) might be further qualified, via its SHAPE and COORDS attributes,
to specify the specific, pertinent area of the associated image file.

#### Sequence of files -- example 

The example below shows a case where a logical structuring of the
digital content provided by the `<structMap>` is supported by the
`<seq>` element. The structuring in this case is independent of the
physical layout of the material in the analog source. The `<structMap>`
here divides Book VIII of Martial's Epigrams into Latin and English
versions, each of which is manifested by the sequences of files
comprising the version.

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
 http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:fileSec>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi09r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/09.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi10r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/pjg/10/jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi11r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/11.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi12r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/12.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi13r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/13.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi14r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/14.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structSec>
    <mets:structMap TYPE="logical">
      <mets:div TYPE="volume" LABEL="Martial Epigrams II">
        <mets:div TYPE="section" LABEL="Book VIII">
          <mets:div TYPE="subsection" LABEL="Latin version">
            <mets:fptr>
              <mets:seq>
                <mets:area FILEID="epi09r"/>
                <mets:area FILEID="epi11r"/>
                <mets:area FILEID="epi13r"/>
                ...
              </mets:seq>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="subsection" LABEL="English version">
            <mets:fptr>
              <mets:seq>
                <mets:area FILEID="epi10r"/>
                <mets:area FILEID="epi12r"/>
                <mets:area FILEID="epi14r"/>
                ...
              </mets:seq>
            </mets:fptr>
          </mets:div>
        </mets:div>
      </mets:div>
    </mets:structMap>
  </mets:structSec>
</mets:mets>
```

Multiple `<seq>` elements would appear under a `<par>` element when
multiple sequences of files or parts of files must be played/displayed
simultaneously to manifest the content of the governing `<fptr>`
element. See the section on the `<par>` element below for a more
complete description of this case.

#### Parallel files

The `<par>` or parallel files element aggregates pointers to files,
parts of files, and/or sequences of files or parts of files that must be
played or displayed simultaneously to manifest a block of digital
content represented by an `<fptr>` element.

This might be the case, for example, with multi-media content, where a
still image might have an accompanying audio track that comments on the
still image. In this case, a `<par>` element would aggregate two
`<area>` elements, one of which pointed to the image file and one of
which pointed to the audio file that must be played in conjunction with
the image. The `<area>` element associated with the image could be
further qualified with SHAPE and COORDS attributes if only a portion of
the image file was pertinent and the `<area>` element associated with
the audio file could be further qualified with BETYPE, BEGIN, EXTTYPE,
and EXTENT attributes if only a portion of the associated audio file
should be played in conjunction with the image.

#### Parallel files -- example 1

In the example below the `<structMap>` encoding uses the `<par>` element
to recreate the experience and intent of the original analog source. In
the source, a page of Latin text appears side by side with a page
containing its English translation. The `<par>` elements here aggregate
the images that represent the pairs of pages that must be displayed
together to recreate this experience.

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
   http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:fileSec>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi09r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/09/jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi10r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/10.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi11r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/11.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi12r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/12.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi13r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/13.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi14r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/14.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structSec>
    <mets:structMap TYPE="logical">
      <mets:div TYPE="volume" LABEL="Martial Epigrams II">
        <mets:div TYPE="section" LABEL="Book VIII">
          <mets:div TYPE="paired pages" LABEL="page 1: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi09r"/>
                <mets:area FILEID="epi10r"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="paired pages" LABEL="page 2: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi11r"/>
                <mets:area FILEID="epi12r"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="paired pages" LABEL="page 3: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi13r"/>
                <mets:area FILEID="epi14r"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
          ...
        </mets:div>
      </mets:div>
    </mets:structMap>
  </mets:structSec>
</mets:mets>
```

A `<par>` element can also aggregate `<seq>` elements representing
sequences of files or parts of files that must be played or displayed
simultaneously to manifest the content represented by an `<fptr>` This
might be the case when a single bytestream which should be played in
parallel with other streams is too large to fit in a single file (e.g.,
very high quality multi-track audio, or video). In these cases, you
would use subsidiary `<seq>` elements, where each sequence identified
the files comprising a particular bytestream in the order they should be
played back.

The two potential subsidiary units --- `<area>` and `<seq>` --- may not
both be used directly under the same `<par>` element; a `<par>` must
contain either a set of `<area>` elements or a set of `<seq>` elements.
In the case where a `<par>` element aggregates `<seq>` elements,
however, the `<seq>` elements themselves will aggregate the `<area>`
elements that point to the pertinent files or parts of files.

The example below demonstrates a use of `<seq>` elements within a
`<par>` element. In this case, the `<structMap>` provides for the
parallel display of Latin and English versions of the material where the
Latin and English versions appear on separate pages in the analog
source, and in separate sets of image files in the digital version.
Furthermore, the `<structMap>` arranges the digital version of the
material into a logical structure in which the divisions are manifested
by just portions of the referenced integral image files. But, in the
case of two divisions, that for the "Introduction" and that for "Book
VIII, Epigram III," the relevant portions of the material spans two
image files. Therefore, the relevant areas of two image files must be
displayed in sequence to manifest these divisions; and two different
sequences must be displayed in parallel to manifest both Latin and
English versions simultaneously.

#### Parallel Files -- example 2

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
   http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:fileSec>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi09r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/09.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi10r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards.mets/docgroup/jpg/10.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi11r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/11.jpg"
          LOCTYPE="URL"/>
        </mets:file>
      <mets:file ID="epi12r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/12.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi13r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/13.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi14r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/14.jpg"
          LOCTYPE="URL"/>
      </mets:file>
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structSec>
    <mets:structMap TYPE="logical">
      <mets:div TYPE="volume" LABEL="Martial Epigrams II">
        <mets:div TYPE="section" LABEL="Book VIII">
          <mets:div TYPE="epigram" LABEL="Introduction: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:seq>
                  <mets:area FILEID="epi09r" SHAPE="RECT" COORDS="0,1150,2500,3150"/>
                  <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,600,2500,900"/>
                </mets:seq>
                <mets:seq>
                  <mets:area FILEID="epi10r" SHAPE="RECT" COORDS="0,1100,2500,3300"/>
                  <mets:area FILEID="epi12r" SHAPE="RECT" COORDS="0,650,2500,950"/>
                </mets:seq>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram I: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,1000,2500,1500"/>
                <mets:area FILEID="epi12r" SHAPE="RECT" COORDS="0,950,2500,1600"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram II: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,1500,2500,2350"/>
                <mets:area FILEID="epi12r" SHAPE="RECT" COORDS="0,1600,2500,2350"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram III: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:seq>
                  <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,2350,2500,3050"/>
                  <mets:area FILEID="epi13r" SHAPE="RECT" COORDS="0,500,2500,2100"/>
                </mets:seq>
                <mets:seq>
                  <mets:area FILEID="epi12r" SHAPE="RECT" COORDS="0,2350,2500,3050"/>
                  <mets:area FILEID="epi14r" SHAPE="RECT" COORDS="0,600,2500,2100"/>
                </mets:seq>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram IV: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi13r" SHAPE="RECT" COORDS="0,2100,2500,2700"/>
                <mets:area FILEID="epi14r" SHAPE="RECT" COORDS="0,2100,2500,2700"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
        </mets:div>
      </mets:div>
    </mets:structMap>
  </mets:stuctSec>
</mets:mets>
```

[^1]: MIX XML Schema: http://www.loc.gov/standards/mix/ NISO Technical
    Metadata for Still Images:
    http://www.niso.org/standards/resources/Z39_87_trial_use.pdf TextMD:
    http://dlib.nyu.edu/METS/textMD.xsd AudioMD:
    http://www.loc.gov/rr/mopic/avprot/audiomd_v8.xsd VideoMD:
    http://loc.gov.org/rr/mopic/avprot/videoMD_v8.xsd
    RightsDeclarationMD Schema:
    http://xml.coverpages.org/METS-Rights_LOC-csd:html
