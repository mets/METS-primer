---
title: File section
parent: Sections of a METS Document
nav_order: 4
---
# File section

The overall purpose of the content **file section** element `<fileSec>` is to provide an inventory of and the location for the content files that comprise the digital object being described in the METS document.  This element contains a `<fileGrp>` element which allows files to be grouped together for various purposes (e.g., by format or use). Within each `<fileGrp>` there is a `<file>` element for each file that comprises the encoded document; the `<fileGrp>` elements may also be used to bring together related files that are relevant to the composition or rendering of the digital object being described.

`<fileGrp>` may point to pertinent metadata groups `<mdGrp>` and metadata elements `<md>` in the Metadata Section `<mdSec>` of the METS document by means of an MDID attribute.

Similarly, `<file>`s within a `<fileGrp>` may point to metadata using MDID attribute; see "[Grouping related files](../howto/fileGrp.md)]".

## More information
* [Grouping related files](../howto/fileGrp.md)
* [Describing digital object content](../howto/file.md)
* [Embedding file content](../howto/FContent.md)
* [Representing parts of files](../howto/stream.md)
* [Referencing external files](../howto/FLocat.md)
* [Handling 'wrapper' file formats](../howto/transformFile.md)

## Examples
* [File section example - multiple image representations](../howto/fileSec_example_images.md)
* [File section example - audio and transcription](../howto/fileSec_example_audio.md)
