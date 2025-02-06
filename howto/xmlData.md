---
title: Embedding XML content in METS
parent: METS How-Tos
---
# Embedding XML content in METS

## Namespace concepts and `<xmlData>`

* Any XML schema can declare a target namespace. This takes the form of a URI intended to serve as a unique identifier for the specific context represented by the schema. For example, the target namespace declared by the METS2 schema is `http://www.loc.gov/METS/v2`
* An element declared in a particular schema can be unambiguously referenced in any xml context by first identifying the target namespace from which the element is being drawn and then specifying the name of the element. Often an instance document accomplishes this by associating a different prefix with the URI for each target namespace it declares, and then using the appropriate prefix in combination with each element name appearing in the document to identify the namespace from which the element is drawn. For example, once an instance document has associated the prefix “mods” with the namespace identified by the URI `http://www.loc.gov/mods/v3` it can use `<mods:titleInfo>` unambiguously to reference the `<titleInfo>` element as it is declared in version 3 of the MODS schema.
* The target namespace URI is an identifier, and is not necessarily resolvable. It does not specify the location of a schema that implements the namespace context that it identifies. XML documents, however, can associate each namespace context they declare with a specific schema and location by means of a schemaLocation attribute. Doing this allows an XML parser/validator to check all of the elements in an XML document against the specific schemas in which they are declared.
* Some schema, such as METS, allow instance documents conforming to the schema to use elements declared in any external namespaces or in no namespace in certain contexts. The METS `<xmlData>` elements provide such contexts.
## METS `<xmlData>` elements

METS `<xmlData>` elements serve as wrappers for xml content whose constituent elements may be drawn from any namespace or from no namespace. The `<xmlData>` elements specify a “processContents” directive of `lax`,  which means that an xml validator will check the xml elements appearing within the `<xmlData>` element for validity if and only if the METS instance document declares the namespace that governs the elements and specifies a valid schemaLocation for a schema that implements the namespace. If a namespace is not declared for the elements, or if the governing schema cannot be found, then an XML validator will check the xml within the `<xmlData>` element for well-formedness, but not for validity.

`<xmlData>` elements as described above appear in the following contexts in METS:
### Context 1: The `<mdWrap>` elements of the `mdType`

Typically in this context, the `<xmlData>` element would contain elements from an xml-based descriptive or administrative metadata format such as MODS, MARCXML, DC, VRA, MIX or PREMIS etc.
### Context 2: `<FContent>` elements associated with `<file>` elements in the `<fileSec>`

If the digital content represented by a `<file>` element is in XML format, and a METS implementer wishes to incorporate that content directly in the `<file>` element, then the XML comprising the content can appear directly in a `FContent/xmlData` element.
## Elements of anyType: `<stream>` and `<transformFile>`
METS has two elements declared as `anyType`, both of which can appear in the context of a `<file>` element. These elements can include any attributes in addition to those explicitly defined for the elements. They can also contain any combination of character data and elements so long as this content is well-formed XML.
