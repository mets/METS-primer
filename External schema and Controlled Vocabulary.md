(Text only moved from Primer version 1, chapter 6)

***

# External schema and Controlled Vocabulary

One of the main differences between METS and other content and metadata packaging specifications is its capability for organizing the metadata associated with a digital object into different categories.  By means of the **&lt;dmdSec>** and the **&lt;amdSec>**, the metadata for a digital object can be separated into descriptive and administrative metadata sections within the METS document.  The administrative metadata section can be subdivided further into other types of metadata including _technical_ metadata for different data formats, _digital provenance_ for preservation metadata, _source_ for metadata relating to an analog or digital item from which the digital object being described in the METS document derives, and _rights_ metadata.  Two mechanisms can be used to associate these different categories of metadata with the digital object and/or its components – either by including the metadata within the METS document using an &lt;mdWrap> element, or pointing to an external location for the metadata using an &lt;mdRef> element.  More complete explanations about how to use these elements can be found within Chapter 3.

METS is, in general, agnostic regarding the external descriptive or administrative metadata schemes that its implementers choose to use for their digital objects.  There are, however, well-known, community-based standards that are recognized by the METS Board as being commonly used.  For purposes of convenience, this group of metadata standards is included as an attribute group within the schema that is referenced by the MDTYPE attribute associated with both &lt;mdWrap> and &lt;mdRef>.  For other descriptive or administrative metadata schema not included in the attribute group, the scheme being used can be declared by choosing the OTHER value for the MDTYPE attribute and naming it in an additional attribute called OTHERMDTYPE.  Note that declaration of which scheme being used is required by the METS schema and best practice does suggest that, if OTHER is used, OTHERMDTYPE should also be used, especially when using METS as a transmission protocol.


## **Descriptive Metadata Schemes**
Descriptive metadata, often called “bibliographic” metadata, is probably most familiar to those using search engines which find digital objects by their author, title, subject, or other information that describes the digital object.  The descriptive metadata schemes endorsed by the METS Board to date include:

* Data Documentation Initiative ([DDI](http://www.icpsr.umich.edu/DDI/)) used for describing social science data sets.
* Dublin Core, simple ([DC](http://dublincore.org/)) developed by the Dublin Core Metadata Initiative as a core set of metadata terms useful for all kinds of digital objects
* Encoded Archival Description ([EAD](http://www.loc.gov/ead/)) used by archives and libraries to encode archival and manuscript collections.
* Federal Geographic Data Committee metadata standard ([FGDC](http://www.fgdc.gov/)) describes geospatial materials.  FGDC also includes some technical and preservation metadata for geospatial items.
* Learning Resource Metadata ([LOM](http://www.imsproject.org/metadata/)), a metadata scheme developed by the IMS Global Learning Consortium, Inc. to describe digital resources created and used by the education and learning communities.  
* MAchine Readable Cataloging ([MARC](http://www.loc.gov/marc/)), used for a number of years by libraries around the world to describe all kinds of analog and digital materials. 
* Metadata Object Description Schema ([MODS](http://www.loc.gov/standards/mods/)) more recently developed in a community effort spearheaded by the Library of Congress to describe all kinds of digital objects.  MODS was designed to work with METS, so is advantageous from that point of view.
* [Text Encoding Initiative](http://www.tei-c.org/) Header (TEIHDR), the section of the Text Encoding Initiative encoding schema which contains descriptive metadata associated with the TEI encoded texts.
* Visual Resources Association ([VRA](http://www.vraweb.org/))), a metadata scheme for describing visual images.

More information can be found about how to use each of these schemes at the links provided.  Examples of how many of these metadata schemes are used within a METS document can be found by reviewing the METS profiles as each of those profiles declare the external schema required to build a METS document based on the given profile.



## **Administrative Metadata Schemes**
Administrative metadata is, in many ways, a much less clear-cut category of metadata than what is traditionally considered descriptive metadata.  While METS does distinguish different types of administrative metadata, it is also possible to include all metadata not considered descriptive into the &lt;amdSec> without distinguishing the types of administrative metadata further.  It still will be necessary to declare the MDTYPE of the metadata as discussed above and as part of the &lt;amdSec> discussions found within Chapter 3, so the METS author/ implementer will need to find a way to declare to those using the METS documents what administrative metadata type(s) are being included.  To date, the administrative metadata schemes endorsed by the METS Board include:

* Technical metadata for audiovisual formats as specified by the Library of Congress A/V prototyping project ([LC-AV](http://www.loc.gov/rr/mopic/avprot/digiprov_expl.html)).
* NISO Technical Metadata for Digital Still Images (NISOIMG), a metadata scheme described by a data dictionary that can be used to describe a number of formats of still images.
*  Preservation metadata developed by the OCLC-RLG PREservation Metadata:  Implementation Strategies Working Group (<span style="text-decoration:underline;">PREMIS</span>).

As with descriptive metadata above, more information can be found about how to use each of these administrative schemes at the links provided.  Examples of how many of these metadata schemes are used within a METS document can be found by reviewing the METS profiles as each of those profiles declare the external schemes required to build a METS document based on the given profile.



## **Endorsed External Schemata**
Not all of the metadata schemes listed above that are included in the attribute group have XML schemata that are endorsed by the METS Editorial Board.  Usually, the METS Editorial Board endorses a particular XML schema only when it has been officially sanctioned by the organization supporting its development.  The list of <span style="text-decoration:underline;">schemata endorsed</span> by the METS Editorial Board can be found on the METS website.
