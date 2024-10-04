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
* [[Referring to elements within METS]]
* [[Descriptive metadata - embedding binary MARC records]]
* [[Digital provenance metadata -- PREMIS]]
* [[Intellectual property rights metadata]]
* [[Describing characteristics of the source material]]
* [[Technical metadata for images]]
* [[Referring to external metadata]]
* [[Embedding metadata in METS]]