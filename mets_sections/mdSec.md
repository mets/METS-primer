---
title: Metadata Section
parent: Sections of a METS Document
nav_order: 3
---
[Image]

# `<mdSec>` Metadata Section

The **metadata section** `<mdSec>` records metadata pertaining to the
METS object as a whole or one of its components. The METS document can
have only one metadata section. Multiple metadata subelements `<md>` are
allowed so that metadata can be recorded for each separate item or
component within the METS document. Metadata elements `<md>` can also be
grouped inside Metadata group elements `<mdGrp>`.

METS does not itself provide a vocabulary or syntax for encoding the
included or referred metadata. Content guidelines are supplied by the
specific standard used. METS does, however, provide a means for linking
this metadata to the digital content of the entity and to other types of
metadata related to the object, such as structural metadata.

Elements included in the metadata section:
* [Describing the digital object with metadata](../cookbook/md.html)
* [Referring to external metadata](../cookbook/mdRef.html)
* [Embedding metadata in METS](../cookbook/mdWrap.html)

Examples of metadata sections:
* [Descriptive metadata - embedding binary MARC records](../cookbook/binary_marc.html)
* [Including descriptive metadata with MODS](../cookbook/mods.html)
* [Technical metadata for images](../cookbook/technical_metadata.html)
* [Intellectual property rights metadata](../cookbook/mets_rights.html)
* [Describing characteristics of the source material](../cookbook/source_metadata.html)
* [Digital provenance metadata -- PREMIS](../cookbook/premis.html)
