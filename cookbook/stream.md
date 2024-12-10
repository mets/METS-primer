---
title: "Representing parts of files"
parent: METS Cookbook
---
# Representing parts of files: `<stream>`

A **component byte stream** element `<stream>` may be composed of one or
more subsidiary streams. An MPEG4 file, for example, might contain
separate audio and video streams, each of which is associated with
technical metadata. The repeatable `<stream>` element provides a
mechanism to record the existence of separate data streams within a
particular file, and the opportunity to associate metadata element `<md>`
with those subsidiary data streams if desired.

When a file contains other files, such as with archive file formats like `.zip`,  using child `<file>` elements is preferred (see also [Handling 'wrapper' file formats](transformFile.md)). Use `<stream>` when the subsidiary streams are logically separate entities but not individual files in their own right. 
## Example

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
