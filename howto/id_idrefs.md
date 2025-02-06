---
title: Referring to Parts of XML Documents
parent: METS How-Tos
---
# Referring to Parts of XML Documents

METS uses IDREF and IDREFS attributes on numerous elements to establish links between these elements and other elements within the METS document. In addition, METS uses IDREF mechanisms to establish links between an ``<area>`` element within the METS structMap and elements in a structured text content file.

## The XSD ID datatype

XML schema provides a built-in ID datatype for the purpose of associating internally unique identifiers with elements in an XML instance document. Note that an attribute implementing the XML schema ID datatype is ONLY intended to provide a means of assigning a unique identifier to the element with which it is associated. Attributes of this type are NOT intended to store any kind of external identifier. The following characteristics apply to attributes implementing the XSD ID datatype.

* An XML schema or DTD can declare one and only one attribute of type ID in conjunction with each element declared by the schema.
* Values assigned to attributes of the ID type in an instance document must begin with a letter or underscore (not a digit), and can only contain letters, digits, periods, hyphens and underscores.
* Values assigned to attributes of the ID type in an instance document must be unique within the document and across elements from all the namespaces represented in the document.

## The XSD IDREF and IDREFS datatypes

XML schema provides two built in datatypes for creating cross references from one element in an instance document to another element or elements in the same document. An attribute of type IDREF associated with an element can cite the ID value that identifies another element in the same instance document. In other words, an attribute of type IDREF creates a cross reference from the source element with which it's associated to another element in the same instance document by citing the ID value that identifies the target element. An attribute of type IDREFS works in the same manner, but can contain multiple space delimited ID values, each of which identifies a different element in the same instance document. So an attribute of type IDREFS creates cross references from the source element with which it is associated to multiple other elements in the same instance document by citing the ID values that identify the target elements. The concrete examples of the application of IDREF and IDREFS attributes in METS that appear in the section immediately below should help clarify the IDREF/ID cross referencing mechanisms.
