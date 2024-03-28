Text currently only moved from Primer version 1

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
appear in the schema. For a quick reference to the various elements and
attributes discussed here as well as complexTypes used in METS, there
are tables in Appendix B. In this text each attribute is underlined,
followed in parentheses with the XML dataType and an */O* to indicate
that the attribute is Optional or a /*R* for one that is Required. Early
reviews requested that elements be expressed in their `<element>` form
in this chapter. The first time reader will encounter instances where an
`<element>` name is not fully spelled out prior to use, for example when
an element encountered earlier in the schema is referenced. This chapter
was envisioned primarily as a reference tool for implementers who wish
to dip in and out of specific sections as needed.

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

### Attributes of the METS root element

ID (*ID/O*): This attribute uniquely identifies the root element of the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

OBJID (*string/O*): Is the primary identifier assigned to the METS
object as a whole. Although this attribute is not required, it is
strongly recommended. This identifier is used to tag the entire METS
object to external systems, in contrast with the ID identifier.

LABEL (*string/O*): Is a simple a title string used to identify the
object/entity being described in the METS document for the user.

TYPE (*string/O*): Specifies the class or type of the object, e.g.:
book, journal, stereograph, dataset, video, etc.

PROFILE (*string/O*): Indicates to which of the registered profile(s)
the METS document conforms. For additional information about PROFILES
see Chapter 5.

```xml
<mets:mets OBJID="loc.natlib.ihas.200003790"
 PROFILE="http://www.loc.gov/mets/profiles/00000007.xml"
 xsi:schemaLocation="http://www.loc.gov/METS_Profile/
 http://www.loc.gov/standards/mets/profile_docs/mets.profile.v1-2.xsd
 http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd
 http://www.loc.gov/mods/v3
 http://www.loc.gov/standards/mods/v3/mods-3-0.xsd">
```

### Elements contained in the root element

The METS document structure consists of seven major sections, which in
turn may contain a variety of elements and attributes as specified in
the METS schema.

At the most general level a METS document may contain the following
sections: each of which is described in its own section of this chapter.

**METS Header** -- The METS Header contains metadata describing the METS
document itself, including such information as creator, editor, etc.

**Descriptive Metadata Section** -- This section contains descriptive
metadata that is external to the METS document (e.g., a MARC record in
an OPAC or a MODS record maintained on a WWW server), internally
embedded descriptive metadata, or both. Multiple instances of both
external and internal descriptive metadata may be included in the
descriptive metadata section.

**Administrative Metadata Section** -- Information about how the files
were created and stored, intellectual property rights, metadata
regarding the original source object from which the digital object was
derived, information regarding the provenance of the files that comprise
the object (i.e., master/derivative file relationships, and
migration/transformation information) is collected this section. As with
descriptive metadata, the administrative metadata can be either external
to the METS document, or encoded internally.

**File Section** -- A list of all files that contain content which make
up the electronic versions of the digital object. File elements may be
grouped within File Group elements, to provide for subdividing the files
by object version or other criteria such as file type, size etc.

**Structural Map** -- This is the heart of the METS document. It
outlines a hierarchical structure for the digital object, and links the
elements of that structure to content files and metadata that pertain to
each element. The structural map is the one mandatory section in a METS
document.

**Structural Links** -- Allows the creator of the METS document to
record the existence of hyperlinks between nodes in the hierarchy
outlined in the Structural Map. This is of particular value in using
METS to archive Websites or other hypermedia.

**Behavior Section** -- A behavior section can be used to associate
executable behaviors with the content of the object encoded using METS.
Each behavior within a behavior section has an interface definition
element that represents an abstract definition of behaviors represented
by a particular behavior section. Each behavior also has a mechanism
element that identifies a module of executable code that implements and
runs the behaviors defined by the interface definition.

### METS root element example

This example uses: XML version 1.0 with UTF-8 encoding, an enumerated
list of the standards used in this record with the URLs, the OBJID for
this digital object represented by the METS document in the form of a
URN, and a human readable LABEL which describes the work being encoded
(in this case, the title of the work).

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www.loc.gov/METS/"
 xmlns:mods="http://www/loc.gov.mods/v3"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd
                     http://www.loc.gov/mods/v3 http://www.loc.gov.mods/v3/mods-3-1.xsd"
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

### Attributes of the METS header {#attributes-of-the-mets-header .unnumbered}

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

ADMID (IDREFS/O): Contains the ID attribute values of the `<techMD>`,
`<sourceMD>`, `<rightsMD>` and/or `<digiprovMD>` elements within the
`<amdSec>` of the METS document that contain administrative metadata
pertaining to the METS document itself. For more information on using
METS IDREFS and IDREF type attributes for internal linking, see Chapter
4 of the METS Primer.

CREATEDATE (*dateTime/O*): Records the date/time the METS document was
created.

LASTMODDATE (*dateTime/O*): Is used to indicate the date/time the METS
document was last modified.

RECORDSTATUS (*string/O*): Specifies the status of the METS document. It
is used for internal processing purposes.

### Elements contained in the METS header

The `<metsHdr>` may include: document author or agent, any alternative
identifiers for a METS document, creation and update dates and times,
and the status of the METS document.

#### Agent

The **agent** element `<agent>` provides for various parties and their
roles with respect to the METS record to be documented.

#### Agent -- attributes

1.  ID (*ID/O*): This attribute uniquely identifies the element within
    the METS document, and allows the element to be referenced
    unambiguously from another element or document via an IDREF or an
    XPTR. For more information on using ID attributes for internal and
    external linking see Chapter 4.

ROLE (string/R): Specifies the function of the agent with respect to the
METS record. The allowed values are:

  - *CREATOR*: The person(s) or institution(s) responsible for the METS document.
  - *EDITOR*: The person(s) or institution(s) that prepares the metadata for encoding.
  - *ARCHIVIST*: The person(s) or institution(s) responsible for the document/collection.
  - *PRESERVATION*: The person(s) or institution(s) responsible for preservation functions.
  - *DISSEMINATOR*: The person(s) or institution(s) responsible for dissemination functions.
  - *CUSTODIAN*: The person(s) or institution(s) charged with the oversight of a document/collection.
  - *IPOWNER*: Intellectual Property Owner: The person(s) or institution
    holding copyright, trade or service marks or other intellectual
    property rights for the object.
  - *OTHER*: Use OTHER if none of the preceding values pertains and
    clarify the type and location specifier being used in the OTHERROLE
    attribute (see below).

OTHERROLE (*string/O*): Denotes a role not contained in the allowed
values set if OTHER is indicated in the ROLE attribute.

TYPE (*string/O*): is used to specify the type of AGENT. It must be one
of the following values:

  - *INDIVIDUAL*: Use if an individual has served as the agent.
  - *ORGANIZATION*: Use if an institution, corporate body, association,
    non-profit enterprise, government, religious body, etc. has served as the agent.
  - *OTHER*: Use OTHER if none of the preceding values pertain and clarify
  - the type of agent specifier being used in the OTHERTYPE attribute (see below).

OTHERTYPE (*string/O*): Specifies the type of agent when the value OTHER
is indicated in the TYPE attribute.

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

#### Alternative identifiers -- attributes

1.  ID (*ID/O*): This attribute uniquely identifies the element within
    the METS document, and allows the element to be referenced
    unambiguously from another element or document via an IDREF or an
    XPTR. For more information on using ID attributes for internal and
    external linking see Chapter 4.

TYPE (*string/O*): A description of the identifier type (e.g., OCLC
record number, LCCN, etc.)

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
<metsHdr CREATEDATE="2004-02-22T00:00:00">
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

## `<dmdSec>` Descriptive metadata

The **descriptive metadata section** `<dmdSec>` records descriptive
metadata pertaining to the METS object as a whole or one of its
components. Multiple descriptive metadata sections are allowed so that
descriptive metadata can be recorded for each separate item or component
within the METS document.

Descriptive metadata can be expressed according to many current content
standards (i.e., *MARC, MODS, Dublin Core, TEI Header, EAD, VRA, FGDC,
DDI*) or a locally produced XML schema.

METS does not itself provide a vocabulary or syntax for encoding this
descriptive metadata; *no descriptive metadata elements* are defined in
METS. Content guidelines are supplied by the specific descriptive
standard used. METS does, however, provide a means for linking this
metadata to the digital content of the entity and to other types of
metadata related to the object, such as structural and administrative
metadata.

### Attributes of the descriptive metadata section

ID (*ID/R*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. The ID
attribute on the `<dmdSec>` is required, and its value should be
referenced from one or more DMDID attributes that are associated with
other elements in the METS document. The following elements support
references to a `<dmdSec>` via a DMDID attribute: `<file>`, `<stream>`,
`<div>`. For more information on using ID attributes for internal and
external linking see Chapter 4.

GROUPID (*string/O*): This identifier is used to indicate that different
metadata sections may be considered as part of a group. Two metadata
sections with the same GROUPID value are to be considered part of the
same group. For example this facility might be used to group changed
versions of the same metadata if previous versions are maintained in a
file for tracking purposes.

ADMID (*IDREFS/O*): Contains the ID attribute values of the
`<digiprovMD>`, `<techMD>`, `<sourceMD>` and/or `<rightsMD>` elements
within the `<amdSec>` of the METS document that contain administrative
metadata pertaining to the current `<dmdSec>` element. Typically used in
this context to reference preservation metadata (digiprovMD) which
applies to the current metadata element. For more information on using
METS IDREFS and IDREF type attributes for internal linking, see Chapter
4.

CREATED (*dateTime/O*): Specifies the date and time of creation for the
metadata.

STATUS (*string/O*): Indicates the status of this metadata (e.g.,
superseded, current, etc.).

### Descriptive metadata elements

A descriptive metadata element can either wrap the metadata (mdWrap) or
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
metadata must be recorded in the xlink:href attribute, and can be
supplemented by the XPTR attribute as needed.

#### Metadata reference -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

MIMETYPE (*string/O*): The IANA MIME media type for the associated file.
Some values for this attribute can be found on the IANA website.

LABEL (*string/O*): Provides a label, for display to the viewer of the
METS document, which identifies the referenced metadata.

XPTR (*string/O*): Locates the point within a file to which the
`<mdRef>` element refers, if applicable, using any valid XPointer
scheme.

LOCTYPE (*string/R*): Specifies the locator type used in the xlink:href
attribute. Valid values for LOCTYPE are: *ARK, URN, URL, PURL, HANDLE,
DOI*, and *OTHER*.

OTHERLOCTYPE (*string/O*): Specifies the locator type when the value
*OTHER* is used in the LOCTYPE attribute. Although optional, it is
strongly recommended when OTHER is used.

MDTYPE (*string/R*): Is used to indicate the type of the associated
metadata. Valid values for the MDTYPE element include:

MARC: any form of MARC record
MODS: metadata in the Library of Congress MODS format
EAD: Encoded Archival Description finding aid
DC: Dublin Core
NISOIMG: NISO Technical Metadata for Digital Still Images
LC-AV: technical metadata specified in the Library of Congress A/V
prototyping project
VRA: Visual Resources Association Core
TEIHDR: Text Encoding Initiative Header
DDI: Data Documentation Initiative
FGDC: Federal Geographic Data Committee metadata
LOM: Learning Object Model
PREMIS: PREservation Metadata: Implementation Strategies
PREMIS:OBJECT: PREMIS Object entiry
PREMIS:AGENT: PREMIS Agent entity
PREMIS:RIGHTS: PREMIS Rights entity
PREMIS:EVENT: PREMIS Event entity
TEXTMD: textMD Technical metadata for text
METSRIGHTS: Rights Declaration Schema
OTHER: metadata in a format not specified above

MDTYPEVERSION(*string/O*): Provides a means for recording the version of
the type of metadata (as recorded in the MDTYPE or OTHERMDTYPE
attribute) that is being used. This may represent the version of the
underlying data dictionary or metadata model rather than a schema
version.

OTHERMDTYPE (*string/O*): Specifies the form of metadata in use when the
value OTHER is indicated in the MDTYPE attribute.

SIZE (*long/O*): Specifies the size in bytes of the associated file or
wrapped content.

CREATED (*dateTime/O*): Specifies the date and time of creation for the
associated file or wrapped content.

CHECKSUM (*string/O*): Provides a checksum value for the associated file
or wrapped content.

CHECKSUMTYPE (*enumerated string/O*): Specifies the checksum algorithm
used to produce the value contained in the CHECKSUM attribute.
CHECKSUMTYPE must contain one of the following values: *Adler-32, CRC32,
HAVAL, MD5, MNP, SHA-1, SHA-256, SHA-384, SHA-512, TIGER* and
*WHIRLPOOL.*

#### Metadata reference-- example

The following example demonstrates the use of the `<mdRef>` element.

```xml
<dmdSec ID="DMD1">
  <mdRef MIMETYPE="text/xml" LABEL="MODS record" LOCTYPE="URN"
    MDTYPE="MODS" xlink:href="urn:x-nyu:fales1735"/>
</dmdSec>
```

#### Metadata wrapper

A **metadata wrapper** element `<mdWrap>` provides a wrapper around
metadata embedded within a METS document. The element is repeatable.
Such metadata can be in one of two forms:

1.  XML-encoded metadata, with the XML-encoding identifying itself as
    belonging to a namespace other than the METS document namespace.

2.  Any arbitrary binary or textual form, PROVIDED that the metadata is
    Base64 encoded and wrapped in a `<binData>` element within the
    internal descriptive metadata element.

#### Internal descriptive metadata -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

MIMETYPE (*string/O*): Provides the MIME type for the metadata being
wrapped.

LABEL (*string/O*): Provides a label, for display to the viewer of the
METS document, that identifies the associated metadata.

MDTYPE (*string/R*): Allows for the recording of the type the metadata
being wrapped. Valid values for the MDTYPE element include:

  - MARC: any form of MARC record
  - MODS: metadata in the Library of Congress MODS format
  - EAD: Encoded Archival Description finding aid
  - DC: Dublin Core
  - NISOIMG: NISO Technical Metadata for Digital Still Images
  - LC-AV: technical metadata specified in the Library of Congress A/V
    prototyping project
  - VRA: Visual Resources Association Core
  - TEIHDR: Text Encoding Initiative Header
  - DDI: Data Documentation Initiative
  - FGDC: Federal Geographic Data Committee metadata
  - LOM: Learning Object Model
  - PREMIS: PREservation Metadata: Implementation Strategies
  - PREMIS:OBJECT: PREMIS Object entiry
  - PREMIS:AGENT: PREMIS Agent entity
  - PREMIS:RIGHTS: PREMIS Rights entity
  - PREMIS:EVENT: PREMIS Event entity
  - TEXTMD: textMD Technical metadata for text
  - METSRIGHTS: Rights Declaration Schema
  - OTHER: metadata in a format not specified above

MDTYPEVERSION(*string/O*): Provides a means for recording the version of
the type of metadata (as recorded in the MDTYPE or OTHERMDTYPE
attribute) that is being used. This may represent the version of the
underlying data dictionary or metadata model rather than a schema
version.

OTHERMDTYPE (*string/O*): Specifies the form of metadata in use when the
value *OTHER* is indicated in the MDTYPE attribute.

SIZE (*long/O*): Specifies the size in bytes of the associated file or
wrapped content.

CREATED (*dateTime/O*): Specifies the date and time of creation for the
associated file or wrapped content.

CHECKSUM (*string/O*): Provides a checksum value for the associated file
or wrapped content.

CHECKSUMTYPE (*enumerated string/O*): Specifies the checksum algorithm
used to produce the value contained in the CHECKSUM attribute.
CHECKSUMTYPE must contain one of the following values: *Adler-32, CRC32,
HAVAL, MD5, MNP, SHA-1, SHA-256, SHA-384, SHA-512, TIGER* and
*WHIRLPOOL.*

#### Internal descriptive metadata -- elements

2.  The `<mdWrap>` element has two elements:

    • `<binData>` - a wrapper element to contain Base64 encoded
    metadata.

    • `<xmlData>` - a wrapper element to contain XML encoded metadata.

The content of an `<xmlData>` element can be in any namespace or in no
namespace. As permitted by the XML Schema Standard, the processContents
attribute value for the metadata in an `<xmlData>` is set to "lax".
Therefore, if the source schema and its location are identified by means
of an XML schemaLocation attribute, then an XML processor will validate
the elements for which it can find declarations. If a source schema is
not identified, or cannot be found at the specified schemaLocation, then
an XML validator will check for well-formedness, but otherwise skip over
the elements appearing in the `<xmlData>` element.

#### Internal descriptive metadata -- example

The following examples demonstrate the use of the `<mdWrap>` element:

```xml
<mets:dmdSec ID="DMD1">
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
</mets:dmdSec>
```

OR

```xml
<dmdSec ID="dmd003">
  <mdWrap MIMETYPE="application/marc" MDTYPE="MARC" LABEL="OPAC Record">
    <binData>MDI0ODdjam0gIDIyMDA1ODkgYSA0NU0wMDAxMDA...
      [base 64 encoded data goes here]
    </binData>
  </mdWrap>
</dmdSec>
```

[Image]

## `<amdSec>` Administrative metadata

The **Administrative Metadata Section** `<amdSec>` contains the
administrative metadata pertaining to the digital object, its components
and any original source material from which the digital object is
derived. The `<amdSec>` is separated into four sub-sections that
accommodate technical metadata (techMD), intellectual property rights
(rightsMD), analog/digital source metadata (sourceMD), and digital
provenance metadata (digiprovMD). Each of these subsections can either
wrap the metadata (mdWrap) or reference it in an external location
(mdRef) or both. Multiple instances of the `<amdSec>` element can occur
within a METS document and multiple instances of its subsections can
occur in one `<amdSec>` element. This allows considerable flexibility in
the structuring of the administrative metadata.

METS does not define a vocabulary or syntax for encoding administrative
metadata. Administrative metadata can be expressed within the `<amdSec>`
sub-elements according to many current community defined standards, or
locally produced XML schemas. The METS Editorial Board has endorsed such
community based content standards as the: MIX XML Schema, NISO Technical
Metadata for Still Images, and TextMD: Schema for Technical Metadata for
Text.[^1] Other standards under review include: LC-AV (Audio /Video
Technical Metadata Schema), and METSRightsMD Schema. Visit the METS
website to ascertain what standards are currently endorsed.

The sub-sections of the `<amdSec>` follow the same content model as the
`<dmdSec>` in that they can either include metadata within the METS
document as an `<mdWrap>` element or reference it via an `<mdRef>`
element.

### Attributes of the administrative metadata section

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

### Elements contained in the administrative metadata section

The `<amdSec>` is partitioned into four major areas for the collocation
of technical, rights, source and provenance metadata. Technical
information `<techMD>` contains metadata about the component parts of
the digital object. Intellectual property `<rightsMD>` enumerates rights
notices and use restrictions. Information about the materials used to
generate the digital object is stored in `<sourceMD>` The history of
the digital object is recorded in the provenance element `<digiprovMD>`
All of these elements use the same attributes.

#### Attributes shared by the administrative metadata elements

ID (*ID/R*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. The ID
attribute on the `<techMD>`, `<sourceMD>`, `<rightsMD>` and
`<digiprovMD>` elements (which are all of mdSecType) is required, and
its value should be referenced from one or more ADMID attributes that
are associated with other elements in the METS document. The following
elements support references to `<techMD>`, `<sourceMD>`, `<rightsMD>`
and `<digiprovMD>` elements via an ADMID attribute: `<metsHdr>`,
`<dmdSec>`, `<techMD>`, `<sourceMD>`, `<rightsMD>`, `<digiprovMD>`,
`<fileGrp>`, `<file>`, `<stream>`, `<div>`, `<area>`, `<behavior>` For
more information on using ID attributes for internal and external
linking see Chapter 4.

GROUPID (*ID/O*): An identifier used to denote that different metadata
sections may be considered as part of a single group. Two metadata
sections with the same GROUPID value are to be considered part of the
same group. This facility might be used, for example, to group changed
versions of the same metadata if previous versions are maintained in a
file for tracking purposes.

ADMID (IDREFS/O): Contains the ID attribute values of the
`<digiprovMD>`, `<techMD>`, `<sourceMD>` and/or `<rightsMD>` elements
within the `<amdSec>` of the METS document that contain administrative
metadata pertaining to the current element. Typically used in this
context to reference preservation metadata (digiprovMD) which applies to
the current metadata element. For more information on using METS IDREFS
and IDREF type attributes for internal linking, see Chapter 4.

CREATED (*dateTime/O*): An attribute that specifies the date and time of
creation the metadata.

STATUS (*string/O*): Use to indicate the status of this metadata (e.g.,
superseded, current, etc.)

#### Technical metadata

A **technical metadata** element `<techMD>` records technical metadata
about a component of the METS object, such as a digital content file.
The `<techMD>` element conforms to same generic datatype as the
`<dmdSec>`, `<rightsMD>`, `<sourceMD>` and `<digiprovMD>` elements, and
supports the same sub-elements and attributes. A technical metadata
element can either wrap the metadata (mdWrap) or reference it in an
external location (mdRef) or both. (For documentation on the attributes
defined for the `<mdRef>` and `<mdWrap>` elements, see pages 26-29
above.) METS allows multiple `<techMD>` elements; and technical metadata
can be associated with any METS element that supports an ADMID attribute
Technical metadata can be expressed according to many current technical
description standards (such as MIX and textMD) or a locally produced XML
schema.

#### Technical metadata -- example

One might, for example, have a `<techMD>` element which includes
technical metadata regarding a file's preparation:

```xml
<mets:techMD ID="AMD001">
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
</mets:techMD>
```

Within a file section, a `<file>` element within a `<fileGrp>` might
then identify the administrative metadata pertaining to the file to
which it points by referencing an ADMID attribute for its `<techMD>`
element:

```xml
<mets:file ID="FILE001" ADMID="AMD001">
  <mets:FLocat LOCTYPE="URL"http://dlib.nyu.edu/press/testing.tif"/>
</mets:file>
```

#### Intellectual property rights metadata 

A **intellectual property rights** **metadata** element `<rightsMD>`
records information about copyright and licensing pertaining to a
component of the METS object. The `<rightsMD>` element conforms to same
generic datatype as the `<dmdSec>`, `<techMD>`, `<sourceMD>` and
`<digiprovMD>` elements, and supports the same sub-elements and
attributes. A rights metadata element can either wrap the metadata
(mdWrap) or reference it in an external location (mdRef) or both. (For
documentation on the attributes defined for the `<mdRef>` and `<mdWrap>`
elements, see pages 26-29 above.) METS allows multiple `<rightsMD>`
elements; and rights metadata can be associated with any METS element
that supports an ADMID attribute. Rights metadata can be expressed
according current rights description standards (such as CopyrightMD and
rightsDeclarationMD) or a locally produced XML schema.

#### Intellectual property rights metadata -- example

```xml
<mets:rightsMD ID="ADMRTS1">
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
</mets:rightsMD>
```

#### Source metadata

A source metadata element `<sourceMD>` records descriptive and
administrative metadata about the source format or media of a component
of the METS object such as a digital content file. It is often used for
discovery, data administration or preservation of the digital object.
The `<sourceMD>` element conforms to same generic datatype as the
`<dmdSec>`, `<techMD>`, `<rightsMD>`, and `<digiprovMD>` elements, and
supports the same sub-elements and attributes. A source metadata element
can either wrap the metadata (mdWrap) or reference it in an external
location (mdRef) or both. (For documentation on the attributes defined
for the `<mdRef>` and `<mdWrap>` elements, see pages 26-29 above.) METS
allows multiple `<sourceMD>` elements; and source metadata can be
associated with any METS element that supports an ADMID attribute.
Source metadata can be expressed according to current source description
standards (such as PREMIS) or a locally produced XML schema.

#### Source metadata -- example

For our *Epigrams* example digital object, we could have used
`<sourceMD>` to link to the MARC record describing the print version of
the book from which the images were derived. As another example, when a
digital audio object is created from an open reel tape, we can record
important technical metadata about the tape in `<sourceMD>` within an
`<mdWrap>` element as follows:

```xml
<sourceMD ID="SMD_MJF_Tape_0010_Side_A" STATUS="Draft, unformatted"
    CREATED="2006-08-28T15:36:53">
  <mdWrap MDTYPE="OTHER" OTHERMDTYPE="Draft AES-X098-SC-03-06-B, version 2006-05-19"
      MIMETYPE="audio/x-wave">
    <xmlData>
      <dataroot xmlns:od="urn:schemas-microsoft-com:officedata"
          generated="2006-08-28T15:36:53">
        <!--All values for source elements come from the
            source_metadata table.-->
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
    </xmlData>
  </mdWrap>
</sourceMD>
```

#### Digital provenance metadata 

The **digital provenance metadata** element `<digiprovMD>` can be used
to record any preservation-related actions taken on the various files
which comprise a digital object (e.g., those subsequent to the initial
digitization of the files such as transformation or migrations) or, in
the case of born digital materials, the files' creation. In short,
digital provenance should be used to record information that allows both
archival/library staff and scholars to understand what modifications
have been made to a digital object and/or its constituent parts during
its life cycle. This information can then be used to judge how those
processes might have altered or corrupted the object's ability to
accurately represent the original item. One might, for example, record
master derivative relationships and the process by which those
derivations have been created. Or the `<digiprovMD>` element could
contain information regarding the migration/transformation of a file
from its original digitization (e.g., OCR, TEI, etc.,)to its current
incarnation as a digital object (e.g., JPEG2000).

The `<digiprovMD>` element conforms to same generic datatype as the
`<dmdSec>`, `<techMD>`, `<rightsMD>`, and `<sourceMD>` elements, and
supports the same sub-elements and attributes. A digital provenance
metadata element can either wrap the metadata (mdWrap) or reference it
in an external location (mdRef) or both. (For documentation on the
attributes defined for the `<mdRef>` and `<mdWrap>` elements, see pages
26-29 above.) METS allows multiple `<digiprovMD>` elements; and digital
provenance metadata can be associated with any METS element that
supports an ADMID attribute. Digital provenance metadata can be
expressed according to current digital provenance description standards
(such as PREMIS) or a locally produced XML schema.
#### Digital provenance metadata -- example 1:

```xml
<mets:digiprovMD ID="FPRV24_551">
  <mets:xmlData>
    <mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="oclcprov">
      <mets:oclcprov:oclcprov>
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
      </mets:oclcprov:oclcprov>
    </mets:mdWrap>
  </mets:xmlData>
</mets:digiprovMD>
```

#### Digital provenance metadata -- example 2

```xml
<mets:digiprovMD ID="DP_0755ad93-5fd1-11da-b211-19e7a5cf4814"
    CREATED="2006-11-27T21:37:13">
  <mets:mdWrap MDTYPE="PREMIS"
    <mets:xmlData xmlns:premis=http://www.loc.gov/standards/premis/v1
        xsi:schemaLocation="http://www.loc.gov/standards/premis/v1
          http://www.loc.gov/standards/premis/v1/Event-v1-1.xsd">
        <premise:eventIdentifier>
          <premise:eventIdentifierType>Validation</premises:eventIdentifierType>
          <premise:eventIdentifierType>Ingest_Validation_01</premis:eventIdentifierValue>
        </premise:eventIdentifier>
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
</mets:digiprovMD>
```

Other examples for implementing PREMIS can be found on the PREMIS
Implemention Group (PIG) wiki.

### Complete administrative metadata -- example

For this example please see lines 66 -- 1786 of the full example in
Appendix A.

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

`<fileGrp>` may point to pertinent administrative metadata elements in
the Administrative Metadata Section `<amdSec>` of the METS document by
means of an ADMID attribute. Such administrative information might
include technical information about the `<fileGrp>`.

  - `<techMD>` -- technical information about the file group
  - `<rightsMD>` -- for details such as access restrictions or other rights information
  - `<sourceMD>` -- information about the original object
  - `<digiprovMD>` -- information about the preservation aspects of the
    file group such as provenance or the transformations to which the file
    group has been submitted.

Similarly, `<file>`s within a `<fileGrp>` may point to administrative
information using an ADMID attribute, and also descriptive information
using the DMDID attribute. See `<fileGrp>` discussion below.

### Attributes of the file section

[ID (*ID/O*):]{.underline} This attribute uniquely identifies the
element within the METS document, and allows the element to be
referenced unambiguously from another element or document via an IDREF
or an XPTR. For more information on using ID attributes for internal and
external linking see Chapter 4.Elements contained in the file section

### Elements Contained in the File Section

#### File group

A sequence of file group elements `<fileGrp>` can be used group the
digital files comprising the content of a METS object either into a
flat arrangement or, because each file group element can itself
contain one or more file group elements, into a nested
(hierarchical) arrangement. In the case where the content files are
images of different formats and resolutions, for example, one could
group the image content files by format and create a separate
`<fileGrp>` for each image format/resolution such as:

-   one `<fileGrp>` for the thumbnails of the images
-   one `<fileGrp>` for the higher resolution JPEGs of the image
-   one `<fileGrp>` for the master archival TIFFs of the images

For a text resource with a variety of content file types one might
group the content files at the highest level by type, and then use
the `<fileGrp>` element's nesting capabilities to subdivide a
`<fileGrp>` by format within the type, such as:

-   one `<fileGrp>` for all of the page images with nested `<fileGrp>`
    elements for each image format/resolution (tiff, jpeg, gif)
-   one `<fileGrp>` for a PDF version of all the pages of the document
-   one `<fileGrp>` for a TEI encoded XML version of the entire document
    or each of its pages.

A `<fileGrp>` may contain zero or more `<fileGrp>` elements and or
`<file>` elements.As described below, a `<file>` element may contain
`<FLocat>` pointers to one or more external content files via a URI
and/or may itself contain the file content as XML or binary data using
the `<FContent>` element.

#### File group -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

VERSDATE (*dateTime/O*): The version date for the file grouping.

ADMID (*IDREFS/O*): Contains the ID attribute values of the `<techMD>`,
`<sourceMD>`, `<rightsMD>` and/or `<digiprovMD>` elements within the
`<amdSec>` of the METS document applicable to all of the files in a
particular file group. For more information on using METS IDREFS and
IDREF type attributes for internal linking, see Chapter 4.

USE (*string/O*): A tagging attribute to indicate the intended use of
files within this file group (e.g., master, reference, thumbnails for
image files). A USE attribute can be expressed at the `<fileGrp>` level,
the `<file>` level, the `<FLocat>` level and/or the `<FContent>` level.
A USE attribute value at the `<fileGrp>` level should pertain to all of
the files in the `<fileGrp>` A USE attribute at the `<file>` level
should pertain to all copies of the file as represented by subsidiary
`<FLocat>` and/or `<FContent>` elements. A USE attribute at the
`<FLocat>` or `<FContent>` level pertains to the particular copy of the
file that is either referenced (`<FLocat>`) or wrapped (`<FContent>`).

#### File group -- example

The following METS fragment represents the page images of a book that
are in TIFF format. Other `<fileGrp>`s in this situation may be those
which pull together the JPEG or the GIF manifestations of the same page
images. The following METS fragment represents the TIFF page images of a
book:

```xml
<mets:mets xmlns:mets="http://www/loc.gov/METS/"
 xmlns:mods="http://www.loc.gov/mods/v3"
 xmlns:xlink="http://www.w3c.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation=" http://www.loc.gov/METS/
 http://www.loc.gov/standards/mets/mets.xsd http://www.loc.gov.mods.v3
 http://www.loc.gov/mods/v3/mods-3-1.xsd" OBJID="ark:/13010/kt9s2009hz"
 LABEL="Martial Epigrams">
    ...
  <mets:fileSec>
    <mets:fileGrp ID="TIFF_GRP01" USE="MASTER IMAGE">
      ...
  </mets:fileSec>
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

#### File (element) -- Attributes

ID (*ID/R*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. Typically, the
ID attribute value on a `<file>` element would be referenced from one or
more FILEID attributes (which are of type IDREF) on `<fptr>`nd/or
`<area>` elements within the `<structMap>` Such references establish
links between structural divisions (`<div>` elements) and the specific
content files or parts of content files that manifest them. For more
information on using ID attributes for internal and external linking see
Chapter 4.

MIMETYPE (*string/O*): The IANA MIME media type for the file. Some
values for this attribute can be found on the IANA website.

SEQ (*integer/O*): Indicates the sequence of this `<file>` relative to
the others in its `<fileGrp>`

SIZE (*integer/O*): The size of the file in bytes.

CREATED (*dateTime/O*): The date of creation for the file.

CHECKSUM (*string/O*): The checksum value for this file.

CHECKSUMTYPE (*string/O*): The type of checksum in the CHECKSUM
attribute. When used it must be one of the following: *HAVAL, MD5,
SHA-256, SHA-384, SHA-512, TIGER, WHIRLPOOL*

OWNERID (*string/O*): A unique identifier assigned to file by its owner.
This may be a URI which differs from the URI used to retrieve the file.

ADMID (*IDREFS/O*): Contains the ID attribute values of the `<techMD>`,
`<sourceMD>`, `<rightsMD>` and/or `<digiprovMD>` elements within the
`<amdSec>` of the METS document that contain administrative metadata
pertaining to the file. For more information on using METS IDREFS and
IDREF type attributes for internal linking, see Chapter 4.

DMDID (*IDREFS/O*): Contains the ID attribute values identifying the
`<dmdSec>`, elements in the METS document that contain or link to
descriptive metadata pertaining to the content file represented by the
current `<file>` element. For more information on using METS IDREFS and
IDREF type attributes for internal linking, see Chapter 4.

GROUPID (*string/O*): An identifier that establishes a correspondence
between this file and files in other file groups. Typically, this will
be used to associate a master file in one file group with derivative
files made from it in other file groups.

USE (*string/O*): A tagging attribute to indicate the intended use of
all copies of the file aggregated by the `<file>` element (e.g., master,
reference, thumbnails for image files). A USE attribute can be expressed
at the `<fileGrp>` level, the `<file>` level, the `<FLocat>` level and/or
the `<FContent>` level. A USE attribute value at the `<fileGrp>` level
should pertain to all of the files in the `<fileGrp>` A USE attribute
at the `<file>` level should pertain to all copies of the file as
represented by subsidiary `<FLocat>` and/or `<FContent>` elements. A USE
attribute at the `<FLocat>` or `<FContent>` level pertains to the
particular copy of the file that is either referenced (`<FLocat>`) or
wrapped (`<FContent>`).

#### File (element) -- example

The physical book example that we have been using represents each page
by `<div>`s, one for each of the three different image manifestations
(TIFF, JPEG, or GIF). The `<fileGrp>` of the TIFF images is represented
in the following example as a single file within that group.

```xml
<?xml version="1.0" encoding="UTF-8">
<mets:mets xmlns:mets="http://www.loc.gov/METS/"
 xmlns:mods="http://www/loc.gov/mods/v3"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www/w3/org/2001/XMLSchema-instance"
 xsi:schemalocation="http://www.loc.gov/METS
 http://www/loc/gov/standards/mets/mets.xsd
 http://www/loc/gov/mods/v3/mods-3-1.xsd" OBJID="ark:/13010/kt9s2009hz"
 LABEL="Martial Epigrams">
  ...
  <mets:fileSec>
    <mets:fileGrp ID="TIFF_GRP01" USE="MASTER IMAGE">
      <mets:file ID="epi01m" SIZE="65768" CREATED="2006-04-11T07:35:22
      "MIMETYPE="image/tiff" ADMID="MIX_v1.0_TIFF_epi01m">
      ...
      </mets:file>
    </mets:fileGrp>
  </mets:fileSec>
```

#### File location

The **file location** element `<FLocat>` provides a pointer to the
location of a content file. It uses the XLink reference syntax to
provide linking information indicating the actual location of the
content file, along with other attributes specifying additional linking
information.

NOTE: `<FLocat>` is an empty element. The location of the resource
pointed to MUST be stored in the xlink:href attribute.

#### File location -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

LOCTYPE (*string/R*): Specifies the locator type used in the xlink:href
attribute. Valid values for LOCTYPE are: *ARK, URN, URL, PURL, HANDLE,
DOI, OTHER*.

OTHERLOCTYPE (*string/O*): Specifies the locator type when the value
OTHER is used in the LOCTYPE attribute. Although optional, it is
strongly recommended when OTHER is used.

USE (*string/O*): A tagging attribute to indicate the intended use of
the specific copy of the file element represented by the `<FLocat>`
element (e.g., service master, archive master). A USE attribute can be
expressed at the `<fileGrp>` level, the `<file>` level, the `<FLocat>`
level and/or the `<FContent>` level. A USE attribute value at the
`<fileGrp>` level should pertain to all of the files in the `<fileGrp>`
A USE attribute at the `<file>` level should pertain to all copies of
the file as represented by subsidiary `<FLocat>` and/or `<FContent>`
elements. A USE attribute at the `<FLocat>` or `<FContent>` level
pertains to the particular copy of the file that is either referenced
(`<FLocat>`) or wrapped (`<FContent>`).

Additional information on the following XLink attributes can be found on
the W3C website.

xlink:href (*URI/O*): Technically optional, this attribute provides the
URI indicating where the content file represented by the parent file can
be located. The xlink:href should always be present in this context if
the `<FLocat>` is to have any meaning or use. This attribute is defined
as part of the xlink:simpleLink attribute group.

xlink:role (*URI/O*): This attribute serves a semantic purpose. If
present, it specifies the URI of a resource that describes the role or
function of the xlink:href link. This attribute is defined as part of
the xlink:simpleLink attribute group. It must be a URI reference as
defined in IETF RFC 2396, except that, if the URI scheme used allows for
absolute and relative forms, the URI portion must be absolute.

xlink:arcrole (*URI/O*): If present this attribute serves a semantic
purpose. It specifies the URI of a resource that describes the pertinent
arc or pointer to the remote resource. While more likely to be used in
arcLinks than simpleLinks, this attribute nonetheless is defined as part
of the xlink:simpleLink attribute group. This must be a URI reference as
defined in IETF RFC 2396 and, if the URI scheme used allows for an
absolute or a relative form, the URI portion must be absolute.

xlink:title (*string/O*): Used to describe the meaning of a link or
resource in a human-readable fashion, this attribute serves a semantic
purpose.

xlink:show (*string/O*): Within a simpleLink this attribute signals
behavior intended to traverse to the simpleLink's single remote ending
resource. It must contain one of the following values: *new, replace,
embed, other, none*.

xlink:actuate (*string/O*): Specifies behavior within a simpleLink,
signaling behavioral intentions for the traversal to simpleLink's single
remote ending resource. It must contain one of the following values:
*onLoad, onRequest, other, none*.

#### File Location -- example

In the following example, the `<fileGrp>` of the TIFF images is
represented as is a single `<file>` within that group and the file
location:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www/loc/gov/METS/"
 xmlns:mods="http://www/loc/gov/,ods/v3/"
 xmlns:xlink="http://www/w3/org/1999/xlink"
 xmlns:xsi="http://www/w3/org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www/loc/gov/METS/
 http://www/loc/gov/standards/mets/mets.xsd http://www/loc.gov/mods/v3
 http://www/loc/gov/mods/v3/mods-3-1.xsd"OBJID="ark:/13030/kt9s2009hz"
 LABEL="Martial Epigrams">
  ...
  <mets:fileSec>
    <mets:fileGrp ID="TIFF_GRP01" USE="MASTER IMAGE">
      <mets:file ID="epi01m" SIZE="65768" CREATED="2006-04-11T07:35:22"
          MIMETYPE="image/tiff" ADMID="MIX_v1.0_TIFF_epio1m">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/full/01.tiff"
          LOCTYPE="URL"/>
        </mets:FLocat>
      </mets:file>
    </mets:fileGrp>
  </mets:fileSec>
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

#### File content -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

USE (*ID:O*): A tagging attribute to indicate the intended use of the
specific copy of the file represented by the `<FContent>` element (e.g.,
service master, archive master). A USE attribute can be expressed at
the `<fileGrp>` level, the `<file>` level, the `<FLocat>` level and/or
the `<FContent>` level. A USE attribute value at the `<fileGrp>` level
should pertain to all of the files in the `<fileGrp>` A USE attribute
at the `<file>` level should pertain to all copies of the file as
represented by subsidiary `<FLocat>` and/or `<FContent>` elements. A USE
attribute at the `<FLocat>` or `<FContent>` level pertains that the
particular copy of the file that is either referenced (`<FLocat>`) or
wrapped (`<FContent>`).

#### File content -- example

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www/loc/gov/METS/"
 xmlns:mods="http://www.loc.gov/mods/v3"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/standards/mets/mets.xsd
 http://www/loc/gov/mods/v3/mods-3-1.xsd"
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
```

#### Component byte stream

A **component byte stream** element `<stream>` may be composed of one or
more subsidiary streams. An MPEG4 file, for example, might contain
separate audio and video streams, each of which is associated with
technical metadata. The repeatable `<stream>` element provides a
mechanism to record the existence of separate data streams within a
particular file, and the opportunity to associate `<dmdSec>` and
`<amdSec>` with those subsidiary data streams if desired.

#### Component byte stream -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

streamType (*string/O*): The IANA MIME media type for the bytestream.

OWNERID (*string/O*): Used to provide a unique identifier (which could
include a URI) assigned to the file. This identifier may differ from the
URI used to retrieve the file.

AMDMDID (*IDREFS/O*): Contains the ID attribute values of the
`<techMD>`, `<sourceMD>`, `<rightsMD>` and/or `<digiprovMD>` elements
within the `<amdSec>` of the METS document that contain administrative
metadata pertaining to the bytestream. For more information on using
METS IDREFS and IDREF type attributes for internal linking, see Chapter
4.

DMDID (*IDREFS/O*): Contains the ID attribute values identifying the
`<dmdSec>`, elements in the METS document that contain or link to
descriptive metadata pertaining to the content file stream represented
by the current `<stream>` element. For more information on using METS
IDREFS and IDREF type attributes for internal linking, see Chapter 4.

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
          xlink:href="http://dlib.nyu.edu/tamwag/beame.xml"
      </mets:FLocat>
    </mets:file>
  </mets:fileGrp>
  <mets:fileGrp ID="FORMAT2" USE="Master Audio">
    <mets:file ID="FILE002" MIMETYPE="audio/wav" SIZE="64232836"
        CREATED="2001-05-17" GROUPID="AUDIO1">
      <mets:FLocat LOCTYPE="URL"
        xlink:href="http://dlib/nyu.edu/tamwag/beame.wav"
      </mets:FLocat>
    </mets:file>
  </mets:fileGrp>
  <mets:fileGrp ID="MIXEDFORMAT" VERSDATE="2005-4-14"
      USE="Master Component Playback">
    <mets:file ID="FILE004_01" MIMETYPE="application/xml" SIZE="2566764"
        CREATED="2005-4-14">
      <mets:FLocat LOCTYPE="URL"
        xlink:href="http://dlib.nyu.edu/tamwag/beame_comp01.xml"/>
      <mets:stream ID="BEAME_COMP_01" streamType="AUDIO/X-WAV"
        OWNERID="HIST_DEPT05_BEAME_COMP_O1" DMDID="MODS_BEAME_COMP_01"/>
    </mets:file>
  </mets:fileGrp>
</mets:fileSec>
```

#### Transform file

The **transform file** `<transformFile>` element provides a means to
access any subsidiary files listed below a `<file>` element by
indicating the steps required to "unpack" or transform the subsidiary
files. This element is repeatable and might provide a link to a
`<behavior>` in the `<behaviorSec>` that performs the transformation.

#### Transform file -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

TRANSFORMTYPE (*string/R*): Is used to indicate the type of
transformation needed to render content of a file accessible. This may
include unpacking a file into subsidiary files/streams. The controlled
value constraints for this XML string include "decompression" and
"decryption". Decompression is defined as the action of reversing data
compression, i.e., the process of encoding information using fewer bits
than an unencoded representation would use by means of specific encoding
schemas. Decryption is defined as the process of restoring data that has
been obscured to make it unreadable without special knowledge (encrypted
data) to its original form.

TRANSFORM-ALGORITHM (*string/R*): Specifies the decompression or
decryption routine used to access the contents of the file. Algorithms
for compression can be either loss-less or lossy.

TRANSFORMKEY (*string/O*): A key to be used with the transform algorithm
for accessing the file's contents.

TRANSFORM-BEHAVIOR (*string/O*): An IDREF to a behavior element for this
transformation.

TRANSFORMORDER (*postive-integer/R*): The order in which the
instructions must be followed in order to unpack or transform the
container file.

#### Transform file -- example 

The following example describes a *.tar.gz file which has two embedded
files within it, one a TIFF file and the other a JPEG file of the same
image. To use the `<fileSec>` to describe these files, you could use the
`<transformFile>` element in the following way:

```xml
<mets:fileSec ID="TransformEX_01">
  <mets:fileGrp ID="TAR_GZ_container_01" USE="Container">
    <mets:file MIMETYPE="application/tar.gz" USE="Container">
      <mets:FLocat xlink:href="file:sample01.tar.gz" ID="sampleTar01.gz"
        LOCTYPE="URL" />
      <mets:transformFile TRANSFORMORDER="1" TRANSFORMTYPE="decompression"
        TRANSFORMALGORITHM="gunzip">
      <mets:transformFile TRANSFORMORDER="2" TRANSFORMTYPE="decompression"
        TRANSFORMALGORITHM="tar">
      </mets:transformFile>
      <mets:file SEQ="1" MIMETYPE="image/tiff"
          CHECKSUM="c1b82611e48066016ceb8daa93d46de7"CHECKSUMTYPE="MD5">
        <mets:FLocat xlink:href="file:sample01_image01.tiff" LOCTYPE="URL"
          USE="Archival Master"/>
      </mets:file>
      <mets:file SEQ="2" MIMETYPE="image/jpeg"
          CHECKSUM="c3cb82611e48066016ceb8daa93d46df5" CHECKSUMTYPE="MD5">
        <mets:FLocat xlink:href="file:sample01_image01jpeg"
          LOCTYPE="URL"USE="Display Derivative"/>
    </mets:file>
  </mets:fileGrp>
</mets:fileSec>
```

### Complete file section -- examples 

#### Complete file section -- example 1

Each physical page from the book has is represented by three associated
content files in the TIFF, JPEG and GIF formats.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www.loc.gov/METS/"
 xmlns:mods= "http://www.loc.gov/mods/v3"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd
    http://www.loc.gov/mods/v3 http://www.loc.gov/mods/v3/mods-3-1.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  ...
  <mets:fileSec>
    <mets:fileGrp USE="MASTER IMAGE">
      <mets:file ID="epi01m" MIMETYPE="image/tiff">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/full/01/tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02m" MIMETYPE="image/tiff">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/full/02.tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03m" MIMETYPE="image/tiff">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/full/03.tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04m" MIMETYPE="image/tiff">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/full/04.tif"
          LOCTYPE="URL"/>
      </mets:file> ...
    </mets:fileGrp>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi01r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/01.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/02.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/03.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/04.jpg"
          LOCTYPE="URL"/>
      </mets:file> ...
    </mets:fileGrp>
    <mets:fileGrp USE="THUMBNAIL IMAGE">
      <mets:file ID="epi01t" MIMETYPE="image/gif">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/gif/01.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02t" MIMETYPE="image/gif">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/gif/02.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03t" MIMETYPE="image/gif">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/gif/03.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04t" MIMETYPE="image/gif">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/gif/04.gif"
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
      <mets:FLocat LOCTYPE="URL" http://dlib.nyu.edu/tamwag/beame.xml
      </mets:FLocat>
    </mets:file>
  </mets:fileGrp>
  <mets:fileGrp ID="FORMAT2" USE="Master Audio">
    <file ID="FILE002" MIMETYPE="audio/wav" SIZE="64232836" CREATED="2001-05-17"
        GROUPID="AUDIO1">
      <mets:FLocat LOCTYPE="URL" http://dlib.nyu.edu/tamwag/beame.wav
      </mets:FLocat>
  </mets:fileGrp>
  <mets:fileGrp ID="FORMAT3" VERSDATE="2001-05-18" USE="Derivative Audio">
    <mets:file ID="FILE003" MIMETYPE="audio/mpeg" SIZE="8238866"
        CREATED="2001-05-18" GROUPID="AUDIO1">
      <mets:FLocat LOCTYPE="URL" http://dlib.nyu.edu/tamwag/beame.mp3
      </mets:FLocat>
    </mets:file>
  </mets:fileGrp>
</mets:fileSec>
```

[Image]

## `<structMap>` Structural map section

The **structural map section** `<structMap>` is the heart of a METS
document. It provides a means for organizing the digital content
represented by the `<file>` elements in the `<fileSec>` of the METS
document into a coherent hierarchical structure. (Note, if there is any
other structure that better suits your needs that is fine, but
hierarchical structures are most prevalently used here.) Such a
hierarchical structure can be presented to users to facilitate their
comprehension and navigation of the digital content. It can further be
applied to any purpose requiring an understanding of the structural
relationship of the content files or parts of the content files. The
organization may be specified to any level of granularity (intellectual
and or physical) that is desired. Since the `<structMap>` element is
repeatable, more than one organization can be applied to the digital
content represented by the METS document.

The organization provided by the `<structMap>` may be purely
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

### Attributes of the structural map section

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

TYPE (*string/O*): Identifies the type of structure represented by the
`<structMap>` For example, a `<structMap>` that represented a purely
logical or intellectual structure could be assigned a TYPE value of
"logical" whereas a `<structMap>` that represented a purely physical
structure could be assigned a TYPE value of "physical". However, the
METS schema neither defines nor requires a common vocabulary for this
attribute. A METS profile, however, may well constrain the values for
the `<structMap>` TYPE.

LABEL (*string/O*): Describes the `<structMap>` to viewers of the METS
document. This would be useful primarily where more than one
`<structMap>` is provided for a single object. A descriptive LABEL
value, in that case, could clarify to users the purpose of each of the
available `<structMap>`s.

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

A `<div>` element at any level can be associated with one or more
`<dmdSec>` elements by means of its DMDID attribute. It is assumed that
any descriptive metadata referenced by a `<div>` element pertains to the
division as a whole. See the description of the DMDID attribute below. A
`<div>` element at any level can also be associated with administrative
metadata contained in one or more rightsMD, techMD, sourceMD and/or
digiprovMD elements. Typically this capability would be used to link the
content represented by a division with the rights metadata that governs
its use. For example: the root `<div>` in a digital object encoded using
METS that represents a video might point to a `<rightsMD>` element that
expresses the copyright and access restriction information for the
entire video. See the description of the ADMID below.

#### Division -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

TYPE (*string/O*): An attribute that specifies the type of structural
division that the `<div>` element represents. Possible `<div>` TYPE
attribute values include: chapter, article, page, track, segment,
section etc. METS places no constraints on the possible TYPE values.
Suggestions for controlled vocabularies for TYPE may be found on the
METS website.

LABEL (*string/O*): An attribute used, for example, to identify a
`<div>` to an end user viewing the document. Thus a hierarchical
arrangement of the `<div>` LABEL values could provide a table of
contents to the digital content represented by a METS document and
facilitate the users' navigation of the digital object. Note that a
`<div>` LABEL should be specific to its level in the structural map. In
the case of a book with chapters, the book `<div>` LABEL should have the
book title and the chapter `<div>` LABELs should have the individual
chapter titles, rather than having the chapter `<div>` LABELs combine
both book title and chapter title. For clarification of the distinction
between LABEL and ORDERLABEL see the description of the ORDERLABEL
attribute.

DMDID (*IDREFS/O*): Contains the ID attribute values identifying the
`<dmdSec>`, elements in the METS document that contain or link to
descriptive metadata pertaining to the structural division represented
by the current `<div>` element. For more information on using METS
IDREFS and IDREF type attributes for internal linking, see Chapter 4.

ADMID (*IDREFS/O*): Contains the ID attribute values identifying the
`<rightsMD>`, `<sourceMD>`, `<techMD>` and/or `<digiprovMD>` elements
within the `<amdSec>` of the METS document that contain or link to
administrative metadata pertaining to the structural division
represented by the `<div>` element. Typically the `<div>` ADMID
attribute would be used to identify the `<rightsMD>` element or elements
that pertain to the `<div>`, but it could be used anytime there was a
need to link a `<div>` with pertinent administrative metadata. For more
information on using METS IDREFS and IDREF type attributes for internal
linking, see Chapter 4.

ORDER (*integer/O*): A representation of the `<div>`s order among its
siblings (e.g., its absolute, numeric sequence). For an example, and
clarification of the distinction between ORDER and ORDERLABEL, see the
description of the ORDERLABEL attribute below.

ORDERLABEL (*string/O*): A representation of the `<div>`s order among
its siblings (e.g., "xii"), or of any non-integer native numbering
system. It is presumed that this value will still be machine actionable
(e.g., it would support 'go to page ___' function), and it should not
be used as a replacement/substitute for the LABEL attribute. To
understand the differences between ORDER, ORDERLABEL and LABEL, imagine
a text with 10 roman numbered pages followed by 10 arabic numbered
pages. Page iii would have an ORDER of "3", an ORDERLABEL of "iii" and a
LABEL of "Page iii", while page 3 would have an ORDER of "13", an
ORDERLABEL of "3" and a LABEL of "Page 3".

CONTENTIDS (*URI/O*): Content IDs for this division (equivalent to DIDL
DII or Digital Item Identifier, a unique external ID).

xlink:label (*string/O*): An XLink label that can be referred to in the
xlink:to and/or xlink:from attributes associated with `<smlink>`
elements in the optional `<structLink>` section of a METS document.
Provides the basis for the association of non-hierarchical `<div>`
elements.

#### Division -- example

The simple encoding fragment below demonstrates the div features
described thus far, including the TYPE, LABEL, and DMDID attributes.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www.loc.gov/METS/"
 xmlns:mods="http://www.loc.gov/mods/v3"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/
 http://www.loc.gov/standards/mets/mets.xsd
 http://www.loc.gov/mods/v3 http://www.loc.gov/mods/v3/mods-3-1.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:dmdSec ID="DMD1">
    <mets:mdWrap MDTYPE="MODS">
      <mets:xmlData>
        <mods:mods>
          <mods:titleInfo>
            <mods:title>Martial Epigrams</mods:title>
          </mods:titleInfo>
        </mods:mods>
      </mets:xmlData>
    </mets:mdWrap>
  </mets:dmdSec>
  ...
  <mets:structMap TYPE="physical">
    <mets:div TYPE="book" LABEL="Martial Epigrams II" DMDID="DMD1">
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
</mets:mets>
```

Additional attributes associated with the `<div>` element include ORDER,
ORDERLABEL, CONTENTIDS, and xlink:label. Descriptions of all attributes
supported by the `<div>` element appear above.

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

#### File pointer -- attributes:

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

FILEID (*IDREF/O*): An optional attribute that provides the XML ID
identifying the `<file>` element that links to and/or contains the
digital content represented by the `<fptr>` A `<fptr>` element should
only have a FILEID attribute value if it does not have a child `<area>`,
`<par>` or `<seq>` element. If it has a child element, then the
responsibility for pointing to the relevant content falls to this child
element or its descendants.

CONTENTIDS (*URI/O*): Content IDs for the content represented by the
`<fptr>` (equivalent to DIDL DII or Digital Item Identifier, a unique
external ID).

#### File pointer -- example

The following METS encoding fragment represents a case where the
`<structMap>` as a whole represents a purely physical structure. The
root division represents the whole book, and each structural division
under this root represents a physical page. Each page division has three
associated content files, each of which represents a different image
manifestation (TIFF, JPEG, or GIF) of the same content:

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/"
 xmlns:mods="http://www.loc.gov/mods/v3"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/
 http://www.loc.gov/standards/mets/mets.xsd
 http://www.loc.gov/mods/v3 http://www.loc.gov/mods/v3/mods-3-1.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams II">
  <mets:fileSec>
    <mets:fileGrp USE="MASTER IMAGE">
      <mets:file ID="epi01m" MIMETYPE="image/tiff">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/full01.tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02m" MIMETYPE="image/tiff">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/full/02.tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03m" MIMETYPE="image/tiff">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/full/03.tif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04m" MIMETYPE="image/tiff">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/full/04.tif"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi01r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/01.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/02.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/03.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/04.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
    <mets:fileGrp USE="THUMBNAIL IMAGE">
      <mets:file ID="epi01t" MIMETYPE="image/gif">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/gif/01.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi02t" MIMETYPE="image/gif">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/gif/02.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi03t" MIMETYPE="image/gif">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/gif/03.gif"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi04t" MIMETYPE="image/gif">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/gif/04.gif"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structMap TYPE="physical">
    <mets:div TYPE="book" LABEL="Martial Epigrams II" DMDID="DMD1">
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
xlink:href attribute and associated XLink attributes as described in the
section on external linking. (See Chapter 4). This is the same mechanism
used for associating `<file>` elements with external content files in
the FLocat element.

#### METS pointer -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

LOCTYPE (*string/R*): Specifies the locator type used in the xlink:href
attribute. Valid values for LOCTYPE are: *ARK, URN, URL, PURL,*
*HANDLE*, *DOI*, or *OTHER*.

OTHERLOCTYPE (*string/O*): Specifies the type of locator used when the
value OTHER is indicated in the LOCTYPE attribute. Although optional its
use is strongly recommended.

CONTENTIDS (*URI/O*): The content ID for the content represented by the
`<mptr>` type.

xlink:href (*URI/O*): This attribute gives the URI of where the METS
document represented by the `<mptr>` is located. The xlink:href should
always be present in this context if the `<mptr>` is to have any meaning
or use.

xlink:role (*URI/O*): An attribute that serves a semantic purpose. If
present, it specifies the URI of a resource that describes the role or
function of the xlink:href link. This attribute is defined as part of
the xlink:simpleLink attribute group. It must be referenced as defined
in IETF RFC 2396, except that, if the URI scheme used is allowed to have
absolute and relative forms, the URI portion must be absolute.

xlink:arcrole (*URI/O*): An attribute that serves a semantic purpose. If
present it specifies the URI of a resource that describes the pertinent
arcrole. While more likely to be used in arcLinks than simpleLinks, this
attribute is nonetheless defined as part of the xlink:simpleLink
attribute group. This URI reference is defined in IETF-RFC-2396, except
if the URI scheme used is allowed to have absolute and relative forms,
the URI portion must be absolute.

xlink:title (*string/O*): An attribute that serves a semantic purpose.
It is used to describe the meaning of a link or resource in a human
readable fashion.

xlink:show (*string/O*): An attribute that specifies behavior within a
simpleLink. It signals behavior intentions for traversal to the
simpleLink's single remote ending resource. It must contain one of the
following values: *new, replace, embed, other, none*.

xlink:actuate (*string/O*): An attribute that specifies behavior. Within
a simpleLink it signals behavior intentions for traversal to the
simpleLink's single remote ending resource. It must contain one of the
following values: *onLoad, onRequest, other, or none*.

#### Mets pointer -- example

The example below illustrates the application of the `<mptr>` element to
the case of a book issued in two volumes, each of which is represented
by a discrete METS document. Using the `<mptr>` element, the METS
document below binds the two separate METS documents representing the
individual volumes together into a single METS document representing the
entire two-volume set.

```xml 
<mets:mets xmlns:mets="http://www.loc.gov/METS/"
 xmlns:mods="http://www.loc.gov/mods/v3"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd
   http://www.loc.gov/mods/v3 http://www.loc.gov/mods/v3/mods-3-1.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams I & II">
  <mets:dmdSec ID="DMD1">
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
  </mets:dmdSec>
  <mets:structMap TYPE="physical">
    <mets:div TYPE="multivolume book" LABEL="Martial Epigrams I & II" DMDID="DMD1">
      <mets:div TYPE="volume" LABEL="Volume I">
        <mets:mptr LOCTYPE="URL"
          xlink:href="http://www.loc.gov/standards/mets/documentation MatrialEpigrams.xml"/>
      </mets:div>
      <mets:div TYPE="volume" LABEL="Volume II">
        <mets:mptr LOCTYPE="URL"
          xlink:href="http://www.loc.gov/standards/mets/documentation/MatialEpigramsII.xml"/>
      </mets:div>
    </mets:div>
  </mets:structMap>
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
(in the case of text or audio /video content). These attributes are
discussed below.

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

#### Area -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

FILEID (*IDREF/R*): An attribute which provides the XML ID value that
identifies the `<file>` element in the `<fileSec>` that then points to
and/or contains the digital content represented by the `<area>` element.
It must contain an ID value represented in an ID attribute associated
with a `<file>` element in the `<fileSec>` element in the same METS
document.

SHAPE (*string/O*): An attribute that can be used as in HTML to define
the shape of the relevant area within the content file pointed to by the
`<area>` element. Typically this would be used with image content (still
image or video frame) when only a portion of an integral image map
pertains. If SHAPE is specified then COORDS must also be present (see
below). SHAPE should be used in conjunction with COORDS in the manner
defined for the shape and coords attributes on an HTML4 `<area>`
element. SHAPE must contain one of the following values: *RECT, CIRCLE,
POLY*.

COORDS (*string/O*): Specifies the coordinates in an image map for the
shape of the pertinent area as specified in the SHAPE attribute. While
technically optional, SHAPE and COORDS must both appear together to
define the relevant area of image content. COORDS should be used in
conjunction with SHAPE in the manner defined for the COORDs and SHAPE
attributes on an HTML4 `<area>` element. COORDS must be a comma
delimited string of integer value pairs representing coordinates (plus
radius in the case of CIRCLE) within an image map. Number of coordinates
pairs depends on shape: RECT: x1, y1, x2, y2; CIRC: x1, y1; POLY: x1,
y1, x2, y2, x3, y3 . . .

BEGIN (*string/O*): An attribute that specifies the point in the content
file where the relevant section of content begins. It can be used in
conjunction with either the END attribute or the EXTENT attribute as a
means of defining the relevant portion of the referenced file precisely.
It can only be interpreted meaningfully in conjunction with the BETYPE
or EXTTYPE, which specify the kind of beginning/ending point values or
beginning/extent values that are being used. The BEGIN attribute can be
used with or without a companion END or EXTENT element. In this case,
the end of the content file is assumed to be the end point.

END (*string/O*): An attribute that specifies the point in the content
file where the relevant section of content ends. It can only be
interpreted meaningfully in conjunction with the BETYPE, which specifies
the kind of ending point values being used. Typically the END attribute
would only appear in conjunction with a BEGIN element.

BETYPE (*string/O*): An attribute that specifies the kind of BEGIN
and/or END values that are being used. For example, if BYTE is
specified, then the BEGIN and END point values represent the byte
offsets into a file. If IDREF is specified, then the BEGIN element
specifies the ID value that identifies the element in a structured text
file where the relevant section of the file begins; and the END value
(if present) would specify the ID value that identifies the element with
which the relevant section of the file ends. Must be one of the
following values*: BYTE, IDREF, SMIL, MIDI, SMPTE-25, SMPTE-24,
SMPTE-DF30, SMPTE-NDF30, SMPTE-DF29.97, SMPTE-NDF29.97, TIME, TCF.*

EXTENT (*string/O*): An attribute that specifies the extent of the
relevant section of the content file. Can only be interpreted
meaningfully in conjunction with the EXTTYPE which specifies the kind of
value that is being used. Typically the EXTENT attribute would only
appear in conjunction with a BEGIN element and would not be used if the
BEGIN point represents an IDREF.

EXTTYPE (*string/O*): An attribute that specifies the kind of EXTENT
values that are being used. For example if BYTE is specified then EXTENT
would represent a byte count. If TIME is specified the EXTENT would
represent a duration of time. EXTTYPE must be one of the following
values: *BYTE, SMIL, MIDI, SMPTE-25, SMPTE-24, SMPTE-DF30, SMPTE-NDF30,
SMPTE-DF29.97, SMPTE-NDF29.97, TIME, TCF*.

ADMID (*IDREFS/O*): Contains the ID attribute values identifying the
`<rightsMD>`, `<sourceMD>`, `<techMD>` and/or `<digiprovMD>` elements
within the `<amdSec>` of the METS document that contain or link to
administrative metadata pertaining to the content represented by the
`<area>` element. Typically the `<area>` ADMID attribute would be used
to identify the `<rightsMD>` element or elements that pertain to the
`<area>` but it could be used anytime there is a need to link an
`<area>` element with pertinent administrative metadata. For more
information on using METS IDREFS and IDREF type attributes for internal
linking, see Chapter 4.

CONTENTIDS (*URI/O*): Content IDs for the content represented by the
`<mptr>` (equivalent to DIDL DII or Digital Item Identifier, a unique
external ID).

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
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/
 http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:fileSec>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi09r" MIMETYPE="image/jpeg">
        <mets:FLocat
          xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/09.jpg"
            LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi11r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/11.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi13r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpeg/13.jpg"
          LOCTYPE="URL"/>
      </mets:file>
    </mets:fileGrp>
  </mets:fileSec>
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

#### Sequence of files -- attribute

[ID (*ID/O*):]{.underline} This attribute uniquely identifies the
element within the METS document, and allows the element to be
referenced unambiguously from another element or document via an IDREF
or an XPTR. For more information on using ID attributes for internal and
external linking see Chapter 4.

#### Sequence of files -- example 

The example below shows a case where a logical structuring of the
digital content provided by the `<structMap>` is supported by the
`<seq>` element. The structuring in this case is independent of the
physical layout of the material in the analog source. The `<structMap>`
here divides Book VIII of Martial's Epigrams into Latin and English
versions, each of which is manifested by the sequences of files
comprising the version.

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/"
 xmlns:mods="http://www.loc.gov/mods/v3"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/
 http://www.loc.gov/standards/mets/mets.xsd
 http://www.loc.gov/mods/v3 http://www.loc.gov/mods/v3/mods-3-1.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:fileSec>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi09r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/09.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi10r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/pjg/10/jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi11r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/11.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi12r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/12.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi13r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href='http://www.loc.gov/standards/mets/docgroup/jpg/13.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi14r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/14.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
  </mets:fileSec>
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

#### Parallel files -- attributes

[ID (*ID/O*):]{.underline} This attribute uniquely identifies the
element within the METS document, and allows the element to be
referenced unambiguously from another element or document via an IDREF
or an XPTR. For more information on using ID attributes for internal and
external linking see Chapter 4.

#### Parallel files -- example 1

In the example below the `<structMap>` encoding uses the `<par>` element
to recreate the experience and intent of the original analog source. In
the source, a page of Latin text appears side by side with a page
containing its English translation. The `<par>` elements here aggregate
the images that represent the pairs of pages that must be displayed
together to recreate this experience.

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/"
 xmlns:mods="http://www.loc.gov/mods/v3"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd
   http://www.loc.gov/mods/v3 http://www.loc.gov/mods/v3/mods-3-1.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:fileSec>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi09r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/09/jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi10r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/10.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi11r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href=http://www.loc.gov/standards/mets/docgroup/jpg/11.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi12r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/12.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi13r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/13.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi14r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/14.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structMap TYPE="logical">
    <mets:div TYPE="volume" LABEL="Martial Epigrams II">
      <mets:div TYPE="section" LABEL="Book VIII">
        <mets:div TYPE="paired pages" LABEL="page 1: Latin & English">
          <mets:fptr>
            <mets:par>
              <mets:area FILEID="epi09r"/>
              <mets:area FILEID="epi10r"/>
            </mets:par>
          </mets:fptr>
        </mets:div>
        <mets:div TYPE="paired pages" LABEL="page 2: Latin & English">
          <mets:fptr>
            <mets:par>
              <mets:area FILEID="epi11r"/>
              <mets:area FILEID="epi12r"/>
            </mets:par>
          </mets:fptr>
        </mets:div>
        <mets:div TYPE="paired pages" LABEL="page 3: Latin & English">
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
<mets:mets xmlns:mets="http://www.loc.gov/METS/"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:fileSec>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi09r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/09.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi10r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards.mets/docgroup/jpg/10.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi11r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/11.jpg"
          LOCTYPE="URL"/>
        </mets:file>
      <mets:file ID="epi12r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/12.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi13r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/13.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi14r" MIMETYPE="image/jpeg">
        <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/14.jpg"
          LOCTYPE="URL"/>
      </mets:file>
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structMap TYPE="logical">
  <mets:div TYPE="volume" LABEL="Martial Epigrams II">
    <mets:div TYPE="section" LABEL="Book VIII">
      <mets:div TYPE="epigram" LABEL="Introduction: Latin & English">
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
      <mets:div TYPE="epigram" LABEL="Epigram I: Latin & English">
        <mets:fptr>
          <mets:par>
            <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,1000,2500,1500"/>
            <mets:area FILEID="epi12r" SHAPE="RECT" COORDS="0,950,2500,1600"/>
          </mets:par>
        </mets:fptr>
      </mets:div>
      <mets:div TYPE="epigram" LABEL="Epigram II: Latin & English">
        <mets:fptr>
          <mets:par>
            <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,1500,2500,2350"/>
            <mets:area FILEID="epi12r" SHAPE="RECT" COORDS="0,1600,2500,2350"/>
          </mets:par>
        </mets:fptr>
      </mets:div>
      <mets:div TYPE="epigram" LABEL="Epigram III: Latin & English">
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
      <mets:div TYPE="epigram" LABEL="Epigram IV: Latin & English">
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
</mets:mets>
```

[Image]

## `<structLink>` Structural link Section

The **Structural Link Section** element `<structLink>` allows for the
specification of hyperlinks between the different components of a METS
structure that are delineated in a structural map. This element is a
container for a single, repeatable element, `<smLink>` which indicates a
hyperlink between two nodes in the structural map. The `<structLink>`
section in the METS document is identified using its XML ID attributes.

### Structural link - attribute

[ID (*ID/O*):]{.underline} This attribute uniquely identifies the
element within the METS document, and allows the element to be
referenced unambiguously from another element or document via an IDREF
or an XPTR. For more information on using ID attributes for internal and
external linking see Chapter 4.

### Elements contained in the structural link section

#### Structural map link

The **Structural Map Link** element `<smLink>` identifies a hyperlink
between two nodes in the structural map. You would use `<smLink>`, for
instance, to note the existence of hypertext links between web pages, if
you wished to record those links within METS. The `<smLink>` element
uses nine attributes.

NOTE: `<smLink>` is an empty element. The location of the `<smLink>`
element to which the `<smLink>` element is pointing MUST be stored in
the xlink:href attribute.

#### Structural map link -- attributes

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

xlink:arcrole (*URI/O*): This attribute serves a semantic purpose. If
present it specifies the URI of a resource that describes the pertinent
arcrole. While it is more likely to be used in arcLinks than
simpleLinks, this attribute is nonetheless defined as part of the
xlink:simpleLink attribute group. It must be a URI reference as defined
in IETF RFC 2396, except that, if the URI scheme used allows absolute
and relative forms, the URI portion must be absolute.

xlink:title (*string/O*): This attribute serves a semantic purpose. It
is used to describe the meaning of a link or resource in a
human-readable fashion. This attribute is defined as part of the
xlink:simpleLink attribute group.

xlink:show (*string/O*): Must contain one of the following values: *new,
replace, embed, other, none*. This attribute specifies behavior. Within
a simpleLink it signals behavior intentions for traversal to the
simpleLink's single remote ending resource. xlink:show generally refers
to whether a browser should show the resource in a new window or replace
the current one, etc.

xlink:actuate (*string/O*): Must contain one of the following values:
*onLoad, onRequest, other, none*. This optional XLink attribute
specifies behavior. Within a simpleLink it signals behavior intentions
for traversal to the simpleLink's single remote ending resource.

xlink:to (*string/O*): A required attribute that identifies the `<div>`
element that represents the target node of the link defined by the
`<smLink>` element by referencing the `<div>` element's xlink:label
attribute value.

xlink:from (*string/O*): An attribute that identifies the `<div>`
element that represents the source node of the link defined by the
`<smLink>` element by referencing the `<div>` element's xlink:label
attribute value.

### Structural links section -- examples

#### Structral links section -- example 1 

In the following example, a METS document for a web page contains an
image which is hyperlinked to another page. The `<structMap>` element
might contain `<div>` notation as follows for the two pages:

```xml
<mets:div ID="P1" TYPE="page" LABEL="Page 1">
  <mets:fptr FILEID="HTMLF1"/>
  <mets:div xlink:labelxlink:label="IMG1" TYPE="image"
      LABEL="Image Hyperlink to Page 2">
    <mets:fptr FILEID="JPGF1"/>
  </div>
</mets:div>
<mets:div xlink:labelxlink:label="P2" TYPE="page" LABEL="Page 2">
  <mets:fptr FILEID="HTMLF2"/>
</mets:div>
```

If you wished to indicate that the image file in the `<div>` contained
with the first page `<div>` is hyperlinked to the HTML file in the
second page `<div>`, you would have a `<smLink>` element within the
`<structLink>` section of the METS document as follows:

```xml
<mets:structLink>
  <mets:smLink xlink:from="IMG1" xlink:to="P2"
    xlink:title="Hyperlink from JPEG Image on Page 1 to Page 2"
    xlink:show="new" xlink:actuate="onRequest"/>
</structLink>
```

#### Structural links section -- example 2

In a more complex example, a complete METS document describes a web site
with particular pages selected for description within it using the
`<structLink>` element to point to specific parts of the web site's
structural map. In the following excerpt, a single page of the web site
is illustrated including the `<fileSec>`, relevant portions of the
`<structMap>`, and the `<smLink>` elements associated with that page.

Specifically, the "Projects" page (PAGE 1145) links to the following
pages in the `<structMap>` of the web site:

  - Officers (Link 36) to Page 113
  - Calendar (Link 37) to Page 120

As the "Projects" page for the website, PAGE 1145 also has links to it
from other pages in the web site, for example:

  - Link 7
  - Link 13

In another view,

+----------------------+----------------------+-----------------------+
| From reference to    | Page 1145.           | Officers, Link 36, p. |
| Projects in Link 7,  |                      | 113                   |
| p. 113 to ->         | Contains references  |                       |
|                      | to ->                |                       |
+----------------------+----------------------+-----------------------+
| From reference to    | Page 1145.           | Calendar, Link 37, p. |
| Projects in Link 13, |                      | 120                   |
| p. 120 to ->         | Contains references  |                       |
|                      | to ->                |                       |
+----------------------+----------------------+-----------------------+

The following XML fragment illustrates how the linking might be done:

```xml
<mets:fileSec>
  <mets:fileGrp>
    <mets:file ID="FID1145" MIMETYPE="text/html">
      <mets:FLocat LOCTYPE="URL"
        xlink:href="dlibdev.nyu.edu/webarchive/metstest/www.apgawomen.org/projects.htm">
      </mets:FLocat>
    <mets:file>
    ...
<mets:structMap TYPE="logical">
  ...
  <!--Within the <div> for page 113, LINK7 is described by the following <div> -->
    <mets:div DMDID="DM8" TYPE="web page" xlink:label="page113" LABEL="Officers page">
      <mets:fptr>
        <mets:par>
          <mets:area FILEID="FID113"></mets:area>
        </mets:par>
      </mets:fptr>
      <mets:div TYPE="hyperlink" xlink:label ="LINK7" LABEL="projects">
        <mets:fptr>
          <mets:area BEGIN="000" BETYPE="BYTE" END="111" FILEID="FID1145"></mets:area>
        </mets:fptr>
      </mets:div>
    </mets:div>
    ...
    <!--Within the <di> for page 120, LINK13 is described by the following <div> -->
    <mets:div DMDID="DM8" TYPE="web page" xlink:label ="page120" LABEL="Calendar page">
      <mets:fptr>
        <mets:par>
          <mets:area FILEID="FID120"></mets:area>
        </mets:par>
      </mets:fptr>
      <mets:div TYPE="hyperlink" xlink:label="LINK13" LABEL="projects">
        <mets:fptr>
          <mets:area BEGIN="000" BETYPE="BYTE" END="111" FILEID="FID1145">
          </mets:area>
        </mets:fptr>
      </mets:div>
    </mets:div>
    <!--The following <div> represents Page 1145, the Projects page, and the
        pertinent <div>s for LINK36 and LINK37. -->
    <mets:div DMDID="DM8" TYPE="web page" xlink:label ="page1145"
        LABEL="http://dlibdev.nyu.edu/webarchive/metstest/www.apgawomen.org/projects.htm">
      <mets:fptr>
        <mets:par>
          <mets:area FILEID="FID1145"></mets:area>
        </mets:par>
      </mets:fptr>
      <mets:div TYPE="hyperlink" xlink:label ="LINK36" LABEL="officers">
        <mets:fptr>
          <mets:area BEGIN="000" BETYPE="BYTE" END="111" FILEID="FID1145"></mets:area>
        </mets:fptr>
      </mets:div>
      <mets:div TYPE="hyperlink" xlink:label ="LINK37" LABEL="calender">
        <mets:fptr>
          <mets:area BEGIN="000" BETYPE="BYTE" END="111" FILEID="FID1145"></mets:area>
        </mets:fptr>
      </mets:div>
    </mets:div>
</mets:structMap>
<--The following <structLink> shows the pertinent references to and from page 1145. >
<mets:structLink>
  <mets:smLink xlink:from="LINK7" xlink:to="page1145" xlink:title="projects">
  </mets:smLink>
  <mets:smLink xlink:from="LINK13" xlink:to="page1145" xlink:title="projects">
  </mets:smLink>
  <mets:smLink xlink:from="LINK36" xlink:to="page113" xlink:title="officers">
  </METS:smLink>
  <mets:smLink xlink:from="LINK37" xlink:to="page120" xlink:title="calender">
  </METS:smLink>
</mets:structLink>
```

[Image]

## `<behaviorSec>` Behavior section

METS provides a means to link digital content with applications or
computer programming code that can be used in conjunction with the other
information in the METS document to render or display the digital
object, or to transform one or more of its component content files.
Called "behaviors", such executable code may can be applied to any
`<div>` in the METS structMap (as specified by the STRUCTID attribute of
a `<behavior>` element) or to any `<transformFile>` element in a
`<file>` element in the `<fileSec>`

A **behavior section** `<behaviorSec>` associates executable behaviors
with content in the METS document by means of a repeatable behavior
`<behavior>` element. This element has an interface definition
`<interfaceDef>` element that represents an abstract definition of the
set of behaviors represented by a particular behavior section. A
`<behavior>` element also has a `<mechanism>` element which is used to
point to a module of executable code that implements and runs the
behavior defined by the interface definition.

The `<behaviorSec>` element, which is repeatable as well as nestable,
can be used to group individual behaviors within the structure of the
METS document. Such grouping can be useful for organizing families of
behaviors together or to indicate other relationships between particular
behaviors.

### Attributes of the behavior section

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

CREATED (*dateTime/O*): Specifies the date and time of creation for the
`<behaviorSec>`.

LABEL (*string/O*): A text description of the behavior section.

### Elements contained in the behavior section

#### Behavior (element)

A **behavior** `<behavior>` element can be used to associate executable
behaviors with content in the METS document. This element has an
interface definition `<interfaceDef>` element that represents an
abstract definition of a set of behaviors represented by a particular
behavior. A `<behavior>` element also has a behavior mechanism
`<mechanism>` element, a module of executable code that implements and
runs the behavior defined abstractly by the interface definition.

#### Behavior (element) -- attributes 

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. In the case of
a `<behavior>` element that applies to a `<transformFile>` element, the
ID value must be present and would be referenced from the
transformFile/@TRANSFORMBEHAVIOR attribute. For more information on
using ID attributes for internal and external linking see Chapter 4.

STRUCTID (*IDREFS/O*): An XML IDREFS attribute used to link a
`<behavior>` to one or more `<div>` elements within a `<structMap>` in
the METS document. The content to which the STRUCTID points is
considered input to the executable behavior mechanism defined for the
behavior. If the `<behavior>` applies to one or more `<div>` elements,
then the STRUCTID attribute must be present.

BTYPE (*string/O*):. The behavior type provides a means of categorizing
the related behavior.

CREATED (*dateTime/O*): The dateTime of creation for the behavior.

LABEL (*string/O*): A text description of the behavior.

GROUPID (*string/O*): An identifier that establishes a correspondence
between the given behavior and other behaviors, typically used to
facilitate versions of behaviors.

ADMID (*IDREFS/O*): Lists the XML ID values of administrative metadata
sections within the METS document that pertain to the given behavior.

#### Behavior (element) -- example 

```xml
<mets:behaviorSec>
  <mets:behavior ID="disp1" STRUCTID="top" BTYPE="display" LABEL="Display Behavior">
```

#### Interface definition 

The **interface definition** `<interfaceDef>` element contains a pointer
to an abstract definition of a single behavior or a set of related
behaviors that are associated with the content of a METS object. The
interface definition object to which the `<interfaceDef>` element points
using xlink:href could be another digital object, or some other entity,
such as a text file which describes the interface or a [Web Services
Description Language]{.underline} (WSDL) file. Ideally, an interface
definition object contains metadata that describes a set of behaviors or
methods. It may also contain files that describe the intended usage of
the behaviors, and possibly files that represent different expressions
of the interface definition. The `<interfaceDef>` element is optional to
allow for cases where an interface definition can be obtained directly
from a behavior mechanism object. (see EXECUTABLE MECHANISM later in
this section).

#### Interface definition -- attributes 

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

LABEL (*string/O*): A text description of the interface definition
section.

LOCTYPE (*string/R*): Specifies the locator type used in the xlink:href
attribute. Valid values for LOCTYPE are: *ARK, URN, URL, PURL, HANDLE,
DOI, OTHER.*

OTHERLOCTYPE (*string/O*): An attribute use to indicate an alternative
LOCTYPE if the LOCTYPE attribute itself has a value of "OTHER".

xlink:href (*URI/O*): An attribute, technically optional, that gives the
URI where the interface definition object represented by the
`<interfaceDef>` can be located. While technically optional, the
xlink:href should always be present in this context if the
`<interfaceDef>` is to have any meaning or use. This attribute is
defined as of the xlink:simpleLink attribute group.

xlink:role (*URI/O*): An optional XLink attribute that serves a semantic
purpose. Must be a URI reference as defined in IETF RFC 2396, except
that, if the URI scheme used is allowed to have absolute and relative
forms, the URI portion must be absolute. If present, it specifies the
URI of a resource that describes the role or function of the xlink:href
link. This attribute is defined as part of the xlink:simpleLink
attribute group.

xlink:arcrole (*URI/O*): Must be a URI reference as defined in IETF RFC
2396, except that, if the URI scheme used is allowed to have absolute
and relative forms, the URI portion must be absolute. This is an
optional XLink attribute that serves a semantic purpose. If present, it
specifies the URI of a resource that describes the pertinent arcrole.
While more likely to be used in arcLinks than simpleLinks, this
attribute is nonetheless defined as part of the xlink:simpleLink
attribute group.

xlink:title (*string/O*): This attribute serves a semantic purpose. It
is used to describe the meaning of a link or resource in a
human-readable fashion. This attribute is defined as part of the
xlink:simpleLink attribute group.

xlink:show (*string/O*): Must contain one of the following values: *new,
replace, embed, other, none.* This optional XLink attribute specifies a
behavior. Within a simpleLink, it signals behavior intentions for
traversal to the simpleLink's single remote ending resource.

xlink:actuate (*string/O*): Must contain one of the following values:
*onLoad, onRequest, other, none*. This optional XLink attribute
specifies behavior. Within a simpleLink, it signals behavior intentions
for traversal to the simpleLink's single remote ending resource.

#### Interface definition -- example 

```xml
<mets:behaviorSec>
  <mets:behavior ID="disp1" STRUCTID="top" BTYPE="display"
    LABEL="Display Behavior">
    <mets:interfaceDef LABEL="EAD Display Definition" LOCTYPE="URL"
      xlink:href="http://texts.cdlib.org/dynaxml/profiles/display/oacDisplayDef.txt"/>
```

#### Executable mechanism 

A **mechanism** element `<mechanism>` contains a pointer to an
executable code module that implements a set of behaviors defined by an
interface definition. The `<mechanism>` element will be a pointer to
another object (a mechanism object). A mechanism object could be another
METS object, or some other entity (e.g., a WSDL file). A mechanism
object should contain executable code, pointers to executable code, or
specifications for binding to network services (e.g., web services).

#### Executable mechanism -- attributes 

ID (*ID/O*): This attribute uniquely identifies the element within the
METS document, and allows the element to be referenced unambiguously
from another element or document via an IDREF or an XPTR. For more
information on using ID attributes for internal and external linking see
Chapter 4.

LABEL (*sting/O*): A text description of the mechanism section.

LOCTYPE (*string/R*): The type of locator contained in the `<mechanism>`
element. Must be one of the following: *ARK, URN, URL, PURL, HANDLE,
DOI, OTHER.*

OTHERLOCTYPE (*string/O*): An attribute used to indicate an alternative
LOCTYPE if the LOCTYPE attribute itself has a value of "OTHER".

xlink:href (*URI/O*): An attribute that gives the URI where the
mechanism object represented by the `<mechanism>` element can be
located. While technically optional, the xlink:href should always be
present in this context if the `<mechanism>` is to have any meaning or
use.

xlink:role (URI/O): An optional XLink attribute that serves a semantic
purpose. Must be a URI reference as defined in IETF RFC 2396 except
that, if the URI scheme used is allowed to have absolute and relative
forms, the URI portion must be absolute. This optional XLink attribute
serves a semantic purpose. If present, it specifies the URI of a
resource that describes the role or function of the xlink:href link.
This attribute is defined as part of the xlink:simpleLink attribute
group.

xlink:arcrole (*URI/O*): Must be a URI reference as defined in IETF RFC
2396, except that, if the URI scheme used is allowed to have absolute
and relative forms, the URI portion must be absolute. This optional
XLink attribute serves a semantic purpose. If present, it specifies the
URI of a resource that describes the pertinent arcrole. While more
likely to be used in arcLinks than simpleLinks, this attribute is
nonetheless defined as part of the xlink:simpleLink attribute group.

xlink:title (*string/O*): An attribute that serves a semantic purpose.
It is used to describe the meaning of a link or resource in a
human-readable fashion. This attribute is defined as part of the
xlink:simpleLink attribute group.

xlink:show (*string/O*): Must contain one of the following values: *new,
replace, embed, other, none*. This optional XLink attribute specifies a
behavior. Within a simpleLink, it signals behavior intentions for
traversal to the simpleLink's single remote ending resource.

xlink:actuate (*string/O*): Must contain one of the following values:
*on Load, onRequest, other, none*. This attribute specifies behavior.
Within a simpleLink, it signals behavior intentions for traversal to the
simpleLink's single remote ending resource.

NOTE: `<mechanism>` is an empty element. The location of the mechanism
object to which the `<mechanism>` element is pointing MUST be stored in
the xlink:href attribute.

#### Executable mechanism -- example 

```xml
<mets:behaviorSec>
  <mets:behavior ID="disp1" STRUCTID="top" BTYPE="display"
      LABEL="Display Behavior">
    <mets:interfaceDef LABEL="EAD Display Definition" LOCTYPE="URL"
      xlink:href="http://texts.cdlib.org/dynaxml/profiles/display/oacDisplayDef.txt"/>
    <mets:mechanism LABEL="EAD Display Mechanism" LOCTYPE="URL"
      xlink:href="http://texts.cdlib.org/dynaxml/profiles/display/oacDisplayMech.xml
  </mets:behavior>
</mets:behaviorSec>
```

### Behavior section -- example 

The following example illustrates how a METS object will call executable
code to 1) display an Encoded Archival Description (EAD) finding aid,
and 2) authenticate public access to the finding aid. Pertinent sections
of the `<structMap>` are included in the example.

```xml
<mets:mets schemaLocation="http://www.loc.gov/METS/
 http://www.loc.gov/standards/mets/mets.xsd http://www.loc.gov/mods/v3
 http://www.loc.gov/standards/mods/v3/mods-3-0.xsd
 http://www.loc.gov/mix/ http://www.loc.gov/standards/mix/mix.xsd
 http://sunsite.berkeley.edu/MOA2/ http://sunsite.berkeley.edu/METS/moa2md.xsd"
 OBJID="ark:/13030/hb1d5n9804" TYPE="text"
 PROFILE="http://sunsite.berkeley.edu/mets/profiles/UCBTextProfile.xml"
 LABEL="George E. Link, History of the Kaiser Permanente Medical Care Program">
  ...
  <mets:structMap>
    <mets:div ID="top" TYPE="TEI.2" LABEL="George E. Link History of the Kaiser
        Permanente Medical Care Program: Kaiser Permanente Medical Care Program Oral
        History Project">
      <mets:fptr FILEID="KAISER1"/>
  </mets:structMap>
  ...
  <mets:behaviorSec>
  <mets:behavior ID="disp1" STRUCTID="top" BTYPE="display"
      LABEL="Display Behavior">
    <mets:interfaceDef LABEL="EAD Display Definition" LOCTYPE="URL"
      xlink:href="http://texts.cdlib.org/dynaxml/profiles/display/oacDispalyDef.txt"/
    <mets:mechanism LABEL="EAD Display Mechanism" LOCTYPE="URL"
      xlink:href="http://texts.cdlib.org/dymaxml/profiles/display/oacDisplaymech.xml"/>
  </mets:behavior>
  ...
  <mets:behavior ID="auth1" STRUCTID="top" BTYPE="authentication"
      LABEL="AuthenticationBehavior">
    <mets:interfaceDef LABEL="General Public Authentication Definition" LOCTYPE="URL"
      xlink:href=:http://texts.cdlib.org/dynaxml/profiles/display/publicAuthdef.txt"/>
    <mets:mechanism LABEL="General Public Authentication Mechanism" LOCTYPE="URL"
      xlink:href="http://texts.cdlib.org/dynaxml/profiles/authentication/publicAuthMech.xml"/>
    </mets:behavior>
  </mets:behaviorSec>
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
