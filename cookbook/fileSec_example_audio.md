---
title: "File section example: audio and transcription"
parent: METS Cookbook
---
# File section example: audio and transcription

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
