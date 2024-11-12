[Image]

# `<fileSec>` File section

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

## Elements Contained in the File Section

[[Grouping related files]]
[[Describing digital object content]]
[[Embedding file content]]
[[Representing parts of files]]
[[Referencing external files]]
[[Handling 'wrapper' file formats]]
## Examples

[[File section example - multiple image representations]]
[[File section example - audio and transcription]]
