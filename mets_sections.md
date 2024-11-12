# METS from the schema perspective

These pages discuss and expand on upon the schema and present sections,
elements and attributes in the same order as they appear in the schema.  They
serve primarily as a reference tool for implementers who wish to dip in and out
of specific sections as needed.

These pages do not list nor define the attributes available in different
elements. Refer to the [schema
reference](https://mets.github.io/METS_v2_Docs/mets.html) for more detailed
information.

This documentation uses the term "METS document" to refer to the serialized XML
document conforming to the METS schema. By contrast, the term "METS object"
refers to the entire digital artifact represented by the METS document,
including any externally referenced content or metadata needed to constitute a
complete object. How an implementer chooses to use the identifiers associated
with the `mets` root element may vary depending upon the situation.

Each major section of METS is covered on its own page:

* [METS root element](mets_sections/root_element.md)
* [METS Header](mets_sections/metsHdr.md)
* [Metadata section](mets_sections/mdSec.md)
* [File section - fileSec](mets_sections/fileSec.md)
* [Structural map section](mets_sections/structSec.md)
