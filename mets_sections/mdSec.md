---
title: Metadata Section
parent: Sections of a METS Document
nav_order: 3
---
# Metadata section

The **metadata section** `<mdSec>` records metadata about the METS object as a whole or one of its components. The METS document may have only one metadata section. Multiple metadata subelements `<md>` are allowed so that metadata can be recorded for each separate item or component within the METS document. Metadata elements `<md>` may also be grouped within metadata group elements `<mdGrp>`.

METS itself does not provide a vocabulary or syntax for encoding the included or referenced metadata. Content guidelines are provided by the specific standard used. METS does, however, provide a means for linking this metadata to the digital content of the entity and to other types of metadata associated with the object, such as structural metadata.

## More information
* [Describing the digital object with metadata](../howto/md.md)
* [Referring to external metadata](../howto/mdRef.md)
* [Embedding metadata in METS](../howto/mdWrap.md)

## Examples
* [Descriptive metadata: Embedding binary MARC records](../howto/binary_marc.md)
* [Including descriptive metadata with MODS](../howto/mods.md)
* [Technical metadata for images](../howto/technical_metadata.md)
* [Intellectual property rights metadata](../howto/mets_rights.md)
* [Describing characteristics of the source material](../howto/source_metadata.md)
* [Digital provenance metadata -- PREMIS](../howto/premis.md)
