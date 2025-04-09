---
title: Describing the digital object with metadata
parent: METS How-Tos
---
# Describing the digital object with metadata

A metadata element `<md>` can either wrap the metadata (`<mdWrap>`), reference it in an external location (`<mdRef>`), or both. For example, a MODS record can be encoded in XML and embedded in the metadata section, or a MARC record could be included in binary format. Alternatively, the metadata section may simply identify the type of metadata it represents (e.g., MARC, EAD) and point to that metadata at its external location via a URI. This is accomplished using the metadata wrap (`<mdWrap>`) and metadata reference (`<mdRef>`) elements, which are discussed in more detail in the pages referenced below:

* [Referring to elements within METS](idrefs_within_mets.md)
* [Descriptive metadata: Embedding binary MARC records](binary_marc.md)
* [Digital provenance metadata -- PREMIS](premis.md)
* [Intellectual property rights metadata](mets_rights.md)
* [Describing characteristics of the source material](source_metadata.md)
* [Technical metadata for images](technical_metadata.md)
* [Referring to external metadata](mdRef.md)
* [Embedding metadata in METS](mdWrap.md)
