---
title: Embedding binary data in METS
parent: METS How-Tos
---
# Embedding binary data in METS

The METS `<binData>` elements serve as wrappers for Base64-encoded binary content. This element can be used to include non-XML metadata or digital content directly in the METS document. However, this is only recommended for relatively small files.

A `<binData>` element, as described above, can appear in each of the following contexts:
## Context 1: In the `<mdWrap>` element of `<md>` elements

The `<binData>` element allows the METS `<md>` element to wrap non-XML content. For example, by means of the `<binData>` element, an `<md>` element could include a full, standard ISO 2709 MARC format record describing the resource represented by the METS document. In this case, the METS implementer would encode the MARC record in Base64 binary format and then wrap this encoding in a `mdSec/md/mdWrap/binData` element. (Note that an alternative to this approach would be to include an XML encoding that conforms to the MARC 21 XML Schema in a `mdSec/md/mdWrap/xmlData` element).
## Context 2: In the `<FContent>` element of a `<file>` element

If the digital content represented by a `<file>` element is not in XML format, it can be encoded using the Base64 binary format and wrapped in a `file/FContent/binData` element. 

See also: 
* [Embedding file content](FContent.md)
* [Descriptive metadata - embedding binary MARC records](binary_marc.md)
