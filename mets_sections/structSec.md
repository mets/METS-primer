---
title: Structural map section
parent: Sections of a METS Document
nav_order: 5
---
# Structural map section

The **structural map section** `<structMap>` provides a means for organizing the digital content represented by the `<file>` elements in the `<fileSec>` of the METS document into a coherent hierarchical structure. (Note, if there is any other structure that better suits your needs that is fine, but hierarchical structures are most prevalently used here.) Such a hierarchical structure can be presented to users to facilitate their comprehension and navigation of the digital content. It can further be applied to any purpose requiring an understanding of the structural relationship of the content files or parts of the content files. The organization may be specified to any level of granularity (intellectual and or physical) that is desired.  The section may contain one or more structural maps, with using repeatable `<structMap>` element, which allows more than one structure to apply to the digital content represented by the METS document.

The structure provided by the `<structMap>` may be purely intellectual or logical (such as a book divided into chapters), purely physical (a book divided into sequences of pages), or a mixture of logical and physical (a book sub-divided into chapters and subsequently divided into a sequence of pages). The content organized by the `<structMap>` may include many mixtures of digital content files: structured or unstructured text, image, audio, video and/or application (such as pdf).

In addition to the content represented by the files in the `<fileSec>` of the same METS documents, the `<structMap>` may also encompass and organize content represented by integral, external METS documents. Thus, the `<structMap>` of a METS document representing a digital version of a journal series might organize the multiple external METS documents representing the individual issues of the journal in the order of publication. The `<structMap>`s of the METS documents representing the individual issues might then organize their content.

In addition to providing a means for organizing content, the `<structMap>` provides a mechanism for linking content at any hierarchical level with relevant metadata. For more on this type of linking see "[Representing parts of a digital object](../howto/div.md)".

The hierarchical structure specified by a `<structMap>` is encoded as a tree of nested `<div>` elements. A `<div>` element may directly point to content via child file pointer `<fptr>` elements (if the content is represented in the `<fileSec>` or child METS pointer `<mptr>` elements (if the content is represented by an external METS document). The `<fptr>` element may point to a single whole `<file>` element that manifests its parent `<div>`, or to part of a `<file>` that manifests its `<div>` It can also point to multiple files or parts of files that must be played/displayed either in sequence or in parallel to reveal its structural division. The `<div>`, `<mptr>`, `<fptr>`, and other `<structMap>` elements that make this sophisticated structuring possible are described in detail on their own pages (see [Structuring and Linking](../mets_howtos.md#structuring-and-linking))

The example encodings in this `<structMap>` section show a variety of possible ways of structuring a digital version of the Martial *Epigrams*, some more plausible than others. The main intent throughout is not to present definitive encodings, but rather just to demonstrate the variety and flexibility of the structural mechanisms offered by METS. The best structural choices for a particular work depends on a variety of factors: the nature of the work being digitized, the anticipated users of the digital version, the kind or kinds of presentation desired, the capabilities of the available presentation programs, etc.

## More Information

* [Representing parts of a digital object](../howto/div.md)
* [Connecting structure and content with file pointers](../howto/fptr.md)
* [Composing digital objects from multiple METS documents with METS pointers](../howto/mptr.md)
* [Including parts of files in the structure](../howto/area.md)
* [Presenting content sequentially](../howto/seq.md)
* [Presenting content simultaneously (in parallel)](../howto/par.md)
