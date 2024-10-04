# METS from the schema perspective

These pages discuss and expand on upon the schema and present sections,
elements and attributes in the same order as they appear in the schema.  They
serve primarily as a reference tool for implementers who wish to dip in and out
of specific sections as needed.

These pages do not list nor define the attributes available in different
elements. Refer to the [schema
reference](https://mets.github.io/METS_v2_Docs/mets.html) for more detailed
information.

As discussed in [Authoring a METS Document](./Authoring a METS Document.md),
many of the examples will be drawn from Martial's *Epigrams*, for consistency
and for the ease of using a text to illustrate these concepts. Although text is
not the only genre or content type that may be encoded using METS, most of the
examples are drawn from images of pages of text. METS has also been used to
encode audio, video, audio/video, TEI, and other formats. In cases where other
content type structures can concisely illustrate usage they will be used as
well.

This documentation uses the term "METS document" to refer to the serialized XML
document conforming to the METS schema. By contrast, the term "METS object"
refers to the entire digital artifact represented by the METS document,
including any externally referenced content or metadata needed to constitute a
complete object. How an implementer chooses to use the identifiers associated
with the `mets` root element may vary depending upon the situation.

Each major section of METS is covered on its own page:

- [METS root element](METS%20root%20element.md)
- [METS Header](METS%20Header%20-%20metsHdr.md)
- [Metadata section](Metadata%20Section%20-%20mdSec.md)
- [File section - fileSec](File%20section%20-%20fileSec.md)
- [Structural map section](Structural%20map%20section%20-%20structSec.md)