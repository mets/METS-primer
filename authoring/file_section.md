---
title: File section
parent: A Complete METS 2 Example
nav_order: 3
---

# File section

The file section `<mets:fileSec>` is one of the main elements of a METS document. There can only be one file section. The file section allows us to list all files in the content and to link metadata to files.

The file section may contain one or more file group elements `<fileGrp>`, which can be used to organize the individual file elements into sets. The file groups are not intended to describe the structure of the content, but simply to provide a manifest of files, with optional single-level file grouping.

In our example below, we have two file groups, `original` and `archival`. These are defined in the `USE` attribute of the `<mets:fileGrp>` element. There are three files in the `original` group and two files in the `archival` group. The file element `<mets:file>` describes the actual files. Attribute `ID` is a file identifier in METS, referenced from the [structural map](Structural section.md). The `MDID` attribute contains references to metadata sections of METS and links the files and their associated administrative metadata. The referenced metadata sections are described on the following pages:

- [Technical metadata](technical_metadata.md)
- [Provenance metadata](provenance_metadata.md)

The `<mets:FLocat>` element describes the location of the file. The `LOCTYPE` and `LOCREF` attributes contain the type and reference of the file respectively.

```xml
<mets:fileSec>

    <mets:fileGrp USE="original">
      <!-- Paper DOCX -->
      <mets:file ID="file-001" MDID="tech-001 event-001">
        <mets:FLocat LOCTYPE="URL" LOCREF="https://raw.githubusercontent.com/mets/METS-board/master/iPres2023Tutorial/originalfiles/iPRES2023_METS_Tutorial.docx" />
      </mets:file>

      <!-- Presentation PPTX -->
      <mets:file ID="file-002" MDID="tech-002 event-002">
        <mets:FLocat LOCTYPE="URL" LOCREF="https://raw.githubusercontent.com/mets/METS-board/master/iPres2023Tutorial/originalfiles/1702_1A_Bredenberg.pptx" />
      </mets:file>

      <!-- Handout PDF -->
      <mets:file ID="file-003" MDID="tech-003 event-003">
        <mets:FLocat LOCTYPE="URL" LOCREF="https://raw.githubusercontent.com/mets/METS-board/master/iPres2023Tutorial/METS%20Exercise%20iPRES%202023.pdf" />
      </mets:file>
    </mets:fileGrp>

    <mets:fileGrp USE="archival">
      <!-- Paper PDF -->
      <mets:file ID="file-004" MDID="tech-004 event-004">
        <mets:FLocat LOCTYPE="URL" LOCREF="https://www.ideals.illinois.edu/items/128260/bitstreams/428885/object" />
      </mets:file>

      <!-- Presentation PDF -->
      <mets:file ID="file-005" MDID="tech-005 event-005">
        <mets:FLocat LOCTYPE="URL" LOCREF="https://raw.githubusercontent.com/mets/METS-board/master/iPres2023Tutorial/METS%20Tutorial%20iPRES%202023.pdf" />
      </mets:file>

    </mets:fileGrp>

</mets:fileSec>
```
