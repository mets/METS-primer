---
title: METS root element
parent: Sections of a METS Document
nav_order: 1
---
# METS root element

The root element `<mets>` establishes the container for the information
being stored and/or transmitted by the standard.

```xml
<mets:mets OBJID="loc.natlib.ihas.200003790"
 PROFILE="http://www.loc.gov/mets/profiles/00000007.xml"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
   http://www.loc.gov/standards/mets/mets.xsd">
```

## Elements contained in the root element

The METS document structure consists of seven major sections, which in
turn may contain a variety of elements and attributes as specified in
the METS schema.

At the most general level a METS document may contain the following
sections: each of which is described in its own section of this chapter.

* [METS Header - metsHdr](metsHdr.md) -- The METS Header contains metadata describing the METS
document itself, including such information as creator, editor, etc.

* [Metadata Section - mdSec](mdSec.md) -- This section contains metadata that is external
to the METS document, internally embedded metadata, or both. Multiple
instances of both external and internal metadata may be included in the
metadata section. The Metadata Section can have for example descriptive
metadata, information about how the files were created and stored,
intellectual property rights, metadata regarding the original source
object from which the digital object was derived, information regarding
the provenance of the files that comprise the object (i.e.,
master/derivative file relationships, and migration/transformation
information).

* [File section - fileSec](fileSec.md) -- A list of all files that contain content which make
up the electronic versions of the digital object. File elements may be
grouped within File Group elements, to provide for subdividing the files
by object version or other criteria such as file type, size etc.

* [Structural map section - structSec](structSec.md) -- Structural Map Section outlines a
hierarchical structure for the digital object, and links the elements
of that structure to content files and metadata that pertain to each
element.

## METS root element example

This example uses: XML version 1.0 with UTF-8 encoding, an enumerated
list of the standards used in this record with the URLs, the OBJID for
this digital object represented by the METS document in the form of a
URN, and a human readable LABEL which describes the work being encoded
(in this case, the title of the work).

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
   http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz"
 LABEL="Martial Epigrams">
```
