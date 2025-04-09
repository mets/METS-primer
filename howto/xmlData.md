---
title: Embedding XML content in METS
parent: METS How-Tos
---
# Embedding XML content in METS

## Namespace concepts and `<xmlData>`

* Any XML schema can declare a target namespace, which takes the form of a URI intended to serve as a unique identifier for the specific context represented by the schema. For example, the target namespace declared by the METS2 schema is: `http://www.loc.gov/METS/v2`
* An element declared in a particular schema can be unambiguously referenced in any XML context by first identifying the target namespace from which the element is drawn and then specifying the element name. Typically, an instance document does this by associating a prefix with the URI of each target namespace and then using that prefix with the element name. For example, once a document associates the prefix “mods” with the namespace URI `http://www.loc.gov/mods/v3`, it can use `<mods:titleInfo>` to unambiguously reference the `<titleInfo>` element from MODS version 3.
* The target namespace URI is an identifier, not necessarily a resolvable address. It does not specify the location of a schema file. However, XML documents can associate each declared namespace with a specific schema and location via the schemaLocation attribute. This allows an XML parser/validator to check elements in the document against their declared schemas.
* Some schemas - such as METS - allow instance documents to use elements from any external namespace or no namespace in specific contexts. The METS `<xmlData>` elements provide such contexts.
## METS `<xmlData>` elements

METS `<xmlData>` elements serve as wrappers for XML content, where the child elements may be drawn from any namespace or none. These elements specify a “processContents” directive of `lax`, meaning that an XML validator will validate the content only if the METS instance document declares the relevant namespace and provides a valid schemaLocation for a schema that implements it. If the namespace is not declared, or if the schema cannot be found, the validator will check the XML content within the `<xmlData>` element for well-formedness, but not for validity.

`<xmlData>` elements appear in the following METS contexts:
### Context 1: The `<mdWrap>` element within `<md>` elements in the `<mdSec>` 

Typically, in this context, the `<xmlData>` element contains elements from an XML-based descriptive or administrative metadata format such as MODS, MARCXML, DC, VRA, MIX, PREMIS, etc.
### Context 2: `<FContent>` elements within `<file>` elements in the `<fileSec>`

If the digital content represented by a `<file>` element is in XML format, and a METS implementer wishes to embed it directly, the XML can appear inside a `<FContent>/<xmlData>` element.
## Elements of anyType: `<stream>` and `<transformFile>`
METS includes two elements declared with the `anyType` dataype: `<stream>` and `<transformFile>`. Both can appear within a `<file>` element and may include any attributes beyond those explicitly defined. They can contain any combination of character data and elements, as long as the content is well-formed XML.
