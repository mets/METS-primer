---
title: Metadata section
parent: A Complete METS 2 Example
nav_order: 2
has_toc: false
---
# Metadata section

Metadata section `<mets:mdSec>` is one of the main sections of a METS document, and it contains subsections for all the metadata. There can be only one metadata section in a METS document.

Each metadata is contained in their own metadata block with using element `<mets:md>`, which describes e.g. the type of the contained metadata. Different metadata blocks can be grouped with `<mets:mdGrp>` elements.

In our example, we will create the following structure in the metadata section. It follows the structure of the previous METS version 1.x. Click the following to see the frame of the metadata section in our example.

<details>

<summary>Click for a frame for metadata section</summary>

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
</mets:mdSec
```

</details>

Our example contains two groups for descriptive and administrative metadata. We have only one descriptive metadata in its own group. The administrative metadata group contains the following metadata:

- 5 technical metadata blocks for each of the 5 files
- A technical metadata block for the intellectual entity of the whole tutorial
- A rights metadata block
- 10 metadata blocks for creation or migration of the 5 files. A pair of provenance metadata blocks containing event and agent (performer of the event) describe the creation or migration of each file.

Altogether we have 18 metadata blocks. Please see the following for a detailed example for each of them:

- [Descriptive metadata](./Descriptive%20metadata.html)
- [Technical metadata](./Technical%20metadata.html)
- [Rights metadata](./Rights%20metadata.html)
- [Provenance metadata](./Provenance%20metadata.html)
