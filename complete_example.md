---
title: A Complete METS 2 Example
nav_order: 4
has_toc: false
---
# A Complete METS 2 Example

The METS standard provides a means for encoding digital content. Its most fundamental task in accomplishing this goal is to provide a mechanism for recording the various relationships that exist between pieces of content and between the content and metadata. This chapter will demonstrate a complete example in a practical approach by creating a METS file for a subsequent example. 

There are several ways to create a METS document for the same content. Due to the detailed nature of XML format of the METS standard, this example shows only one mechanism with some basic features of METS. Overall, METS documents are not intended to be created or read manually in production, but rather programmatically.

The example we will use here contains the documents produced by the METS Editorial Board for the METS Tutorial held at the iPRES 2023 conference. In this example we have five digital objects: The first three objects are the conference paper in MS Office Word format (DOCX), the presentation slides in MS Office PowerPoint format (PPTX), and a handout document in PDF format. In addition, the MS Office versions (paper and presentation) have been migrated to PDF format for archival purposes. 

Please follow the links to see a complete example of how to create different sections of METS:

- [METS root and header](./authoring/mets_root_header.md)
- [Metadata section](./authoring/metadata_section.md)
- [File section](./authoring/file_section.md)
- [Structural section](./authoring/structural_section.md)

See also the information about creating links between the sections:

- [Linking between metadata and files](./authoring/linking.md) 

By combining the `<metsHdr>`, `<mdSec>`, `<fileSec>` and `<structSec>` sections in a single METS document, we can create a document that contains the structure necessary for applications to present the content in a reasonably sophisticated manner as well as providing the information needed for both retrieval and management purposes. The sections discussed in this chapter are often all that is needed to represent even fairly complex works.
