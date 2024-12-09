---
title: A Complete METS 2 Example
nav_order: 5
---

TODO: merge with https://github.com/mets/METS-primer/tree/authoring-to-mets2

# A Complete METS 2 Example

The example: https://github.com/mets/METS-schema/blob/mets2/v2/examples/mets2-example-borndigital.xml

This example shows one way of structuring a METS file for born-digital material, in this case material for the METS workshop and tutorial at iPRES 2023. This includes the original Word, Powerpoint, and PDF files submitted for the tutorial as well as archival PDF versions. It gives an example of how to structure information about these files and the digital object they comprise using METS and PREMIS.

It includes:

* A header describing the creation of the METS file itself
* A manifest of the files comprising the digital object
* The structure of hte digital object; that is, how the different files comprising it relate to each other.
* Descriptive metadata for the object as a whole, using [Dublin Core](https://www.dublincore.org/)
* Technical metadata for each file using PREMIS Objects
* Digital provenance metadata describing the creation of each original file and the conversion from original files to preservation formats, using PREMIS Events and Agents
* Rights metadata describing the license applicable to the obejct, using PREMIS Rights


