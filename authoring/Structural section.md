---
title: Structural section
parent: A Complete METS 2 Example
nav_order: 4
---
# Structural section

Structural metadata describes the structure of the content. It describes how the files and metadata are connected together and how different metadata is linked to files or larger entities. The structual map can be physical (for eaxample describing the directory structure) or logical (for example semantic structure of the content).

Structural section is one of the main sections in a METS document. There can be only one structural section. However, it is allowed to have multiple structural maps. It is worth noting that there are a variety of ways that we could have organized the structural map other than the one used in our example.

In our example we have a structure map with using element `<mets:structMap>`. The element `<mets:div>` denotes to a division element. There can be only one root division, but inside it there can be multiple sequential and nested divisions. In this way, we can create a hierachy tree to describe the structure. A division can refer to a metadata with the attribute `MDID`. In the leaf level, there are pointers `<mets:fptr>` to the files described the file section. The actual pointer is in attribute `FILEID`. 

In our example, the root div contains the header of our tutorial content in attribute `LABEL`. Attribute `MDID` refers to the descriptive, technical and rights metadata blocks containing metadata related to the whole content. The referred blocks are described in detail in the following pages:

- [Descriptive metadata](./Descriptive%20metadata.html)
- [Technical metadata](./Technical%20metadata.html)
- [Rights metadata](./Rights%20metadata.html)

There are three divisions in our example, defined with attributes `TYPE` and `LABEL`, describing the type and description of the division, respectively. The divisions are made for the division types `Paper`, `Presentation` and `Handout`. The leaf level has file pointers to the file section, referred from the attribute `FILEID`. The identifiers in `FILEID` references are the `ID` values used in the file section. [Please have a look at the file section.](./File%20section.html)

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
