---
title: "Embedding metadata in METS"
parent: METS Cookbook
parent: METS Cookbook
---
# Embedding metadata in METS: `<mdWrap>`

A **metadata wrapper** element `<mdWrap>` provides a wrapper around
metadata embedded within a METS document. The element is repeatable.
Such metadata can be in one of two forms:

1.  XML-encoded metadata, with the XML-encoding identifying itself as
    belonging to a namespace other than the METS document namespace.

2.  Any arbitrary binary or textual form, PROVIDED that the metadata is
    Base64 encoded and wrapped in a `<binData>` element within the
    internal metadata element.

The `<mdWrap>` element has two elements:

1. `<binData>` - a wrapper element to contain Base64 encoded
    metadata.

2. `<xmlData>` - a wrapper element to contain XML encoded metadata.

The content of an `<xmlData>` element can be in any namespace or in no
namespace. As permitted by the XML Schema Standard, the processContents
attribute value for the metadata in an `<xmlData>` is set to "lax".
Therefore, if the source schema and its location are identified by means
of an XML schemaLocation attribute, then an XML processor will validate
the elements for which it can find declarations. If a source schema is
not identified, or cannot be found at the specified schemaLocation, then
an XML validator will check for well-formedness, but otherwise skip over
the elements appearing in the `<xmlData>` element.

See also:
* [Embedding XML content in METS](xmlData.html)
* [Embedding binary data in METS](binData.html)

And examples:
* [Descriptive metadata - embedding binary MARC records](binary_marc.html)
* [Digital provenance metadata -- PREMIS](premis.html)
* [Intellectual property rights metadata](mets_rights.html)
* [Describing characteristics of the source material](source_metadata.html)
* [Technical metadata for images](technical_metadata.html)
