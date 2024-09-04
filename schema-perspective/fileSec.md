[Image]

## `<fileSec>` File section

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
