---
title: Embedding metadata in METS
parent: METS How-Tos
---
# Embedding metadata in METS

A **metadata wrapper** element `<mdWrap>` provides a wrapper around metadata embedded within a METS document. The element is repeatable. Such metadata can be in one of two forms:

1.  XML-encoded metadata, where the XML identifies itself as belonging to a namespace other than the METS document namespace.

2.  Any arbitrary binary or textual form, PROVIDED that the metadata is Base64-encoded and wrapped in a `<binData>` element within the internal metadata element.

The `<mdWrap>` element may contain one of two child elements:

1. `<binData>` - a wrapper element used to contain Base64-encoded metadata.

2. `<xmlData>` - a wrapper element used to contain XML-encoded metadata.

The content of an `<xmlData>` element can be in any namespace, or in no namespace at all. As permitted by the XML Schema standard, the processContents attribute value for metadata in an `<xmlData>` element is set to "lax".  Therefore, if the source schema and its location are identified by means of an XML schemaLocation attribute, then an XML processor will validate the elements for which it can find declarations. If a source schema is not identified, or cannot be found at the specified schemaLocation, then an XML validator will check only for well-formedness and otherwise skip over the elements appearing in the `<xmlData>` element.

See also:
* [Embedding XML content in METS](xmlData.md)
* [Embedding binary data in METS](binData.md)

And examples:
* [Descriptive metadata - embedding binary MARC records](binary_marc.md)
* [Digital provenance metadata -- PREMIS](premis.md)
* [Intellectual property rights metadata](mets_rights.md)
* [Describing characteristics of the source material](source_metadata.md)
* [Technical metadata for images](technical_metadata.md)
