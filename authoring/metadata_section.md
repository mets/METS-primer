---
title: Metadata section
parent: A Complete METS 2 Example
nav_order: 2
has_toc: false
---
# Metadata section

The metadata section `<mets:mdSec>` is one of the main sections of a METS document and it contains subsections for all metadata. There can be only one metadata section in a METS document.

Each metadata is contained in its own metadata block using element `<mets:md>` describing e.g. the type of metadata contained. Different metadata blocks can be grouped using `<mets:mdGrp>` elements.

In our example, we will create the following structure in the metadata section. It follows the structure of the previous METS version 1.x. Click on the following to see the frame of the metadata section in our example.

<details markdown="block">

<summary>Click for a metadata section frame</summary>

```xml
<mets:mdSec>
  <mets:mdGrp USE="DESCRIPTIVE">
    <mets:md ID="[id]">
      [...]
    </mets:md>
  </mets:mdGrp>
  <mets:mdGrp USE="ADMINISTRATIVE">        
    <mets:md ID="[id]" USE="TECHNICAL">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="TECHNICAL">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="TECHNICAL">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="TECHNICAL">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="TECHNICAL">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="TECHNICAL">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="RIGHTS">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="PROVENANCE">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="PROVENANCE">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="PROVENANCE">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="PROVENANCE">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="PROVENANCE">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="PROVENANCE">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="PROVENANCE">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="PROVENANCE">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="PROVENANCE">
      [...]
    </mets:md>
    <mets:md ID="[id]" USE="PROVENANCE">
      [...]
    </mets:md>
  </mets:mdGrp>
</mets:mdSec>
```

</details>

Our example contains two groups for descriptive and administrative metadata. We have only one descriptive metadata block in its own group. The administrative metadata group contains the following metadata:

- 5 technical metadata blocks for each of the 5 files
- A technical metadata block for the intellectual entity of the whole tutorial
- A rights metadata block
- 10 metadata blocks for the creation or migration of the 5 files. A pair of provenance metadata blocks containing event and agent (performer of the event) to describe the creation or migration of each file.

In total we have 18 metadata blocks. See below for a detailed example of each one:

- [Descriptive metadata](descriptive_metadata.md)
- [Technical metadata](technical_metadata.md)
- [Rights metadata](rights_metadata.md)
- [Provenance metadata](provenance_metadata.md)
