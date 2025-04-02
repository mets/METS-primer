---
title: Metadata Section
parent: Sections of a METS Document
nav_order: 3
---
# Metadata Section

The **metadata section** `<mdSec>` records metadata pertaining to the METS object as a whole or one of its components. The METS document can have only one metadata section. Multiple metadata subelements `<md>` are allowed so that metadata can be recorded for each separate item or component within the METS document. Metadata elements `<md>` can also be grouped inside Metadata group elements `<mdGrp>`.

METS does not itself provide a vocabulary or syntax for encoding the included or referred metadata. Content guidelines are supplied by the specific standard used. METS does, however, provide a means for linking this metadata to the digital content of the entity and to other types of metadata related to the object, such as structural metadata.

## More information
* [Describing the digital object with metadata](../howto/md.md)
* [Referring to external metadata](../howto/mdRef.md)
* [Embedding metadata in METS](../howto/mdWrap.md)

## Examples
* [Descriptive metadata - embedding binary MARC records](../howto/binary_marc.md)
* [Including descriptive metadata with MODS](../howto/mods.md)
* [Technical metadata for images](../howto/technical_metadata.md)
* [Intellectual property rights metadata](../howto/mets_rights.md)
* [Describing characteristics of the source material](../howto/source_metadata.md)
* [Digital provenance metadata -- PREMIS](../howto/premis.md)
