---
title: File section
parent: Sections of a METS Document
nav_order: 4
---
# File section

The overall purpose of the content **file section** element `<fileSec>` is to provide an inventory of and the location of the content files that make up the digital object described in the METS document. This element contains a `<fileGrp>` element that allows files to be grouped together for various purposes (e.g., by format or use). Within each `<fileGrp>` there is a `<file>` element for each file that makes up the encoded document; the `<fileGrp>` elements may also be used to group together related files that are relevant to the composition or rendering of the digital object being described.

`<fileGrp>` may point to relevant metadata groups `<mdGrp>` and metadata elements `<md>` in the Metadata Section `<mdSec>` of the METS document by means of an MDID attribute.

Similarly, `<file>` elements within a `<fileGrp>` can point to metadata using an MDID attribute; see "[Grouping related files](../howto/fileGrp.md)]".

## More information
* [Grouping related files](../howto/fileGrp.md)
* [Describing digital object content](../howto/file.md)
* [Embedding file content](../howto/FContent.md)
* [Representing parts of files](../howto/stream.md)
* [Referencing external files](../howto/FLocat.md)
* [Handling 'wrapper' file formats](../howto/transformFile.md)

## Examples
* [File section example: Multiple image representations](../howto/fileSec_example_images.md)
* [File section example: Audio and transcription](../howto/fileSec_example_audio.md)
