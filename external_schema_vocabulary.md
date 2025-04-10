---
title: External schema and Controlled Vocabulary
nav_order: 6
---

# External schema and Controlled Vocabulary

One of the main differences between METS and other content and metadata packaging specifications is its capability to organize the metadata associated with a digital object into different metadata categories. The two most common types are descriptive metadata and administrative metadata. 

* Descriptive metadata, often called “bibliographic” metadata, is probably most familiar to those using search engines to find digital objects by their author, title, subject, or other descriptive information.
* Administrative metadata is, in many ways, a less clearly defined category than what is traditionally considered descriptive metadata. It includes metadata such as technical metadata or preservation metadata.

Two mechanisms can be used to associate these different categories of metadata with the digital object and/or its components: Including the metadata directly within the METS document using an `<mdWrap>` element, or pointing to an external location for the metadata using an `<mdRef>` element.

METS is agnostic regarding the external descriptive or administrative metadata schemas that implementers choose to use for their digital objects. There is no prescribed list of metadata standards. Instead, there is a suggested list of [acronyms for standards to use](https://github.com/mets/METS-schema/wiki/METS2-Suggested-Attribute-Values) based upon the metadata standards found in METS 1.

Make sure to document which metadata standards are being used in your implementation. This can be done, for example, by creating a METS profile for your use of METS 2. Note that the declaration of the metadata schema used in the METS XML document is required by the METS schema in order to allow validation if you choose to include the metadata.
