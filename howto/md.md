---
title: Describing the digital object with metadata
parent: METS How-Tos
---
# Describing the digital object with metadata

A metadata element `<md>` can include the metadata directly in the METS using `<mdWrap>`, reference it in an external location using `<mdRef>`, or both. For example, a MODS record can be encoded in XML and embedded into the metadata section or a MARC record could be included in binary format. Alternately, the metadata section may simply identify the type of metadata it represents (for example MARC, EAD), and point to this metadata in its external location via a URI. Usage of the `<mdWrap>` and `<mdRef>` elements are discussed in more detail in the pages referenced below:

* [Referring to elements within METS](idrefs_within_mets.md)
* [Descriptive metadata - embedding binary MARC records](binary_marc.md)
* [Digital provenance metadata -- PREMIS](premis.md)
* [Intellectual property rights metadata](mets_rights.md)
* [Describing characteristics of the source material](source_metadata.md)
* [Technical metadata for images](technical_metadata.md)
* [Referring to external metadata](mdRef.md)
* [Embedding metadata in METS](mdWrap.md)
