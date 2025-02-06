---
title: A Complete METS 2 Example
nav_order: 5
has_toc: false
---
# A Complete METS 2 Example

The METS standard provides a means of encoding digital content. Its most fundamental task in accomplishing this goal is to provide a mechanism for recording the various relationships that exist between pieces of content, and between the content and metadata. This chapter will demonstrate a complete example in a practical approach by creating a METS file for a following example. 

There are multiple ways to build a METS document for the same content. Because of the XML format detailed nature of the METS standard, this example shows only one mechanism with some basic features of METS. Overall, the METS documents are not meant to be produced or read manually in production, but instead programmatically.

The example that we will use here contains the documents produced for METS Tutorial held at iPRES 2023 conference by the METS Editorial Board. In this example we have five digital objects: The first three objects are the conference paper in MS Office Word format (DOCX), the presentation slides in MS Office PowerPoint format (PPTX), and a handout document in PDF format. Additionally, the MS Office versions (paper and presentation) have been migrated to PDF format for archival purpose. 

Please follow the links to see a complete example creation of diffrent sections of METS:

- [METS root and header](./authoring/METS%20root%20and%20header.md)
- [Metadata section](./authoring/Metadata%20section.md)
- [File section](./authoring/File%20section.md)
- [Structural section](./authoring/Structural%20section.md)

Additionally, see the information about creating links between the sections:

- [Linking between metadata and files](./authoring/Linking%20between%20metadata%20and%20files.md) 

By combining the `<metsHdr>`, `<mdSec>`, `<fileSec>` and `<structSec>` sections in a single METS document, we can create a document that contains the structure needed for applications to present the content in a reasonably sophisticated fashion as well as providing the information needed for both retrieval and management purposes. These sections discussed in this chapter are often all that is needed to represent even fairly complex works.
