[Image]

# Chapter 3: From the schema perspective

This chapter will discuss and expand on upon the schema and as such will
present sections, elements and attributes in the same order as they
appear in the schema. Early reviews requested that elements be expressed
in their `<element>` form in this chapter. The first time reader will
encounter instances where an `<element>` name is not fully spelled out
prior to use, for example when an element encountered earlier in the
schema is referenced. This chapter was envisioned primarily as a
reference tool for implementers who wish to dip in and out of specific
sections as needed.

As discussed in Chapter 2 many of the examples will be drawn from
Martial's *Epigrams*, for consistency and for the ease of using a text
to illustrate these concepts. Although text is not the only genre or
content type that may be encoded using METS, most of the examples are
drawn from images of pages of text. METS has also been used to encode
audio, video, audio/video, TEI, and other formats. In cases where other
content type structures can concisely illustrate usage they will be used
as well.

This documentation uses the term "METS document" to refer to the
serialized XML document conforming to the METS schema. By contrast, the
term "METS object" refers to the entire digital artifact represented by
the METS document, including any externally referenced content or
metadata needed to constitute a complete object. How an implementer
chooses to use the identifiers associated with the mets root element may
vary depending upon the situation.
