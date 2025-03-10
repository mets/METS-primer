---
title: Structural section
parent: A Complete METS 2 Example
nav_order: 4
---
# Structural section

Structural metadata describes the structure of the content. It describes how the files and metadata are related to each other and how different metadata are related to files or larger entities. The structural map can be physical (for example, describing the directory structure) or logical (for example, the semantic structure of the content).

The structural section is one of the main sections in a METS document. There can be only one structural section. However, it is allowed to have several structural maps. It is worth noting that there are a variety of ways we could have organized the structural map other than the one used in our example.

In our example, we have a structural map using the `<mets:structMap>` element. The `<mets:div>` element indicates a division element. There can be only one root division, but within it there can be several sequential and nested divisions. In this way, we can create a hierarchy tree to describe the structure. A division can refer to metadata with the `MDID` attribute. At the leaf level, there are `<mets:fptr>` pointers to the files described by the file section. The actual pointers are in the `FILEID` attributes. 

In our example, the root div contains the header of our tutorial content in the `LABEL` attribute. The `MDID` attribute refers to the descriptive, technical, and rights metadata blocks that contain metadata about the entire content. These blocks are described in detail on the following pages:

- [Descriptive metadata](descriptive_metadata.md)
- [Technical metadata](technical_metadata.md)
- [Rights metadata](rights_metadata.md)

In our example, there are three divisions defined by the `TYPE` and `LABEL` attributes, which describe the type and description of the division, respectively. The divisions are created for the division types `Paper`, `Presentation` and `Handout`. The leaf level has file pointers to the file section, referenced by the `FILEID` attribute. The identifiers in the `FILEID` references are the `ID` values used in the file section. [See the file section.](file_section.md)

```xml
<mets:structSec>
  <mets:structMap>
    <mets:div LABEL="Understanding and implementing METS, A tutorial focused on METS 2" MDID="dmd-001 tech-006 rights-001">        
      <mets:div TYPE="Paper" LABEL="UNDERSTANDING AND IMPLEMENTING METS: A tutorial focused on METS 2">
        <mets:fptr FILEID="file-001"/>
        <mets:fptr FILEID="file-004"/>
      </mets:div>        
      <mets:div TYPE="Presentation" LABEL="Understanding and Implementing METS">
        <mets:fptr FILEID="file-002"/>
        <mets:fptr FILEID="file-005"/>          
      </mets:div>        
      <mets:div TYPE="Handout" LABEL="Exercise METS 2">
        <mets:fptr FILEID="file-003"/>
      </mets:div>        
    </mets:div>
  </mets:structMap>
</mets:structSec>
```
