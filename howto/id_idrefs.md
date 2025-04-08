---
title: Referring to Parts of XML Documents
parent: METS How-Tos
---
# Referring to Parts of XML Documents

METS uses IDREF and IDREFS attributes on numerous elements to establish links between these elements and other elements within the METS document. In addition, METS uses IDREF mechanisms to establish links between an ``<area>`` element within the METS structural map and elements in a structured text content file.

## The XSD ID datatype

XML Schema provides a built-in ID datatype for the purpose of associating internally unique identifiers with elements in an XML instance document. Note that an attribute implementing the XML Schema ID datatype is ONLY intended to provide a means of assigning a unique identifier to the element with which it is associated. Attributes of this type are NOT intended to store any kind of external identifier. The following characteristics apply to attributes implementing the XSD ID datatype:

* An XML schema or DTD can declare only one attribute of type ID for each element declared by the schema.
* Values assigned to attributes of the ID type in an instance document must begin with a letter or underscore (not a digit) and can contain only letters, digits, periods, hyphens, and underscores.
* Values assigned to attributes of the ID type must be unique within the document and across elements from all the namespaces represented in the document.

## The XSD IDREF and IDREFS datatypes

XML Schema provides two built-in datatypes for creating cross-references from one element in an instance document to another element or elements in the same document. An attribute of type IDREF, associated with an element, can cite the ID value that identifies another element in the same instance document. In other words, an IDREF attribute creates a cross-reference from the source element with which it is associated to another element in the same instance document by citing the ID of the target element. An attribute of type IDREFS works in the same manner but can contain multiple space-delimited ID values, each of which identifies a different element in the same document. So, an IDREFS attribute creates cross-references from the source element to multiple target elements by citing their respective ID values. Concrete examples of how IDREF and IDREFS attributes are applied in METS appear in the section immediately below and should help clarify how the IDREF/ID cross-referencing mechanisms work.
