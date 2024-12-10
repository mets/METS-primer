---
title: "Embedding binary data in METS"
parent: METS Cookbook
---
# Embedding binary data in METS: `<binData>`

The METS `<binData>` elements serve as wrappers for base64 encoded binary content. This element can be used to include non-xml metadata or digital content directly in the METS document. This is only recommended for relatively small files.

A `<binData>` element as described above can appear in each of the following contexts.
## Context 1: The `<mdWrap>` element of elements of the `mdType`

The `<binData>` element allows the METS `<md>` element to wrap non-XML content. For example, by means of the `<binData>` element, an `<md>` could include a full, standard ISO 2709 MARC format record describing the resource represented by the METS document. In this case, the METS implementer would encode the MARC record in base64 binary format and then wrap this encoding in a `mdSec/md/mdWrap/binData` element. (Note that an alternative to this approach would be to include an XML encoding that conforms to the MARC 21 XML Schema in an `mdSec/md/mdWrap/xmlData` element).
## Context 2:  The `<FContent>` element of a `<file>` element

If the digital content represented by a `<file>` element is not in XML format it can be encoded in a `<file>` element using the base64 binary format and then wrapping that encoding in a `file/FContent/binData` element. 

See also: 
* [Embedding file content](FContent.md)
* [Descriptive metadata - embedding binary MARC records](binary_marc.md)
