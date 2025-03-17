---
title: External schema and Controlled Vocabulary
nav_order: 6
---

# External schema and Controlled Vocabulary

One of the main differences between METS and other content and metadata packaging specifications is its capability for organizing the metadata associated with a digital object into different metadata categories. The two most common types is descriptive metadata and administrativ metadata. 

* Descriptive metadata, often called “bibliographic” metadata, is probably most familiar to those using search engines which find digital objects by their author, title, subject, or other information that describes the digital object.
* Administrative metadata is, in many ways, a much less clear-cut category of metadata than what is traditionally considered descriptive metadata. In this type you find metadata for example describing the tecjnical metadata or the preservation metadata.

Two mechanisms can be used to associate these different categories of metadata with the digital object and/or its components – either by including the metadata within the METS document using an &lt;mdWrap> element, or pointing to an external location for the metadata using an &lt;mdRef> element.

METS is agnostic regarding the external descriptive or administrative metadata schemes that its implementers choose to use for their digital objects. There is no prescribed list of metadata standards that can be used instead there is a suggested list of [acronyms for standards to use](https://github.com/mets/METS-schema/wiki/METS2-Suggested-Attribute-Values) based upon the metadata standards found in METS 1.

Make sure to document which metadata standards that are being used in your implementation, this can for example be done by creating a METS profile for your use of METS 2. Note that declaration of which scheme being used in the METS XML document is required by the METS schema to allow for validation when you choosw to included the metadata.
