---
title: Structural map section
parent: Sections of a METS Document
nav_order: 5
---
[Image]

# Structural map section

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
repeatable `<structMap>` element, which allows more than one structure
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
hierarchical level with relevant metadata. For more on this type of
linking see the section on the `<div>` element below.

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

#### Representing parts of a digital object: `<div>`

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

##### Example

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

#### Connecting structure and content with file pointers: `<fptr>`

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

##### Example

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

#### Composing digital objects from multiple METS documents with METS pointers: `<mptr>`

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

##### Example

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

#### Including parts of files in the structure: `<area>`

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

##### Example

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

#### Presenting content sequentially: `<seq>`

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

##### Example 

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

#### Presenting content simultaneously (in parallel): `<par>`

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

##### Example 1

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

##### Example 2

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
  </mets:structSec>
</mets:mets>
```
