---
title: File section
parent: A Complete METS 2 Example
nav_order: 3
---

# File section

File section `<mets:fileSec>` is one of the main elements of a METS document. There can be only one file section. File section allows us to list all of the files in the content and link metadata to files.

File section can contain one or more file groups elements `<fileGrp>` which can be used to organize the individual file elements into sets. The file groups are not meant to be describing the structure of the content, but merely to provide a manifest of files, with an optional single-level file grouping.

In our example below, we have two file groups `original` and `archival`. These are defined in the attribute `USE` of element `<mets:fileGrp>`. There are three files in the `original` group and two files in the `archival` group. File element `<mets:file>` describes the actual files. Attribute `ID` is a file identifier in METS, referred from the [structural map](Structural section.md). Attribute `MDID` contains references to metadata sections of METS and it connects the files and corresponding administrative metadata together. The referred metadata sections are described in the following pages:

- [Technical metadata](./Technical%20metadata.md)
- [Provenance metadata](./Provenance%20metadata.md)

Element `<mets:FLocat>` describes the location of the file. Attributes `LOCTYPE` and `LOCREF` contain the type and reference of the file, respectively.

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
