---
title: "Describing the digital object with metadata"
parent: METS Cookbook
---
# Describing the digital object with metadata: `<md>`

A metadata element `<md>` can either wrap the metadata (mdWrap) or
reference it in an external location (mdRef) or both. For example, a
MODS record can be encoded in XML and embedded into the metadata section
or a MARC record could be included in binary format. Alternately, the
metadata section may simply identify the type of metadata it represents
(for example MARC, EAD), and point to this metadata in its external
location via a URI. This is done by the metadata Wrap `<mdWrap>` and
metadata Reference `<mdRef>` elements, which are discussed in more detail
below.

See also: 
* [Referring to elements within METS](idrefs_within_mets.md)
* [Descriptive metadata - embedding binary MARC records](binary_marc.md)
* [Digital provenance metadata -- PREMIS](premis.md)
* [Intellectual property rights metadata](mets_rights.md)
* [Describing characteristics of the source material](source_metadata.md)
* [Technical metadata for images](technical_metadata.md)
* [Referring to external metadata](mdRef.md)
* [Embedding metadata in METS](mdWrap.md)
