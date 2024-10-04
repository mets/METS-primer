(TODO needs to be entirely rewritten with the new example; see [[Complete Example]])

---
# Authoring a METS Document

The METS standard provides a means of encoding digital library materials.  Its most fundamental task in accomplishing this goal is to provide a mechanism for recording the various relationships that exist between pieces of content, and between the content and metadata that compose a digital library object.  As the exact meaning and use of the various elements and attributes outlined in Chapter 3 can be difficult to understand in the abstract, this chapter will demonstrate their use in a practical application by creating a METS file for a digital version of Martial's _Epigrams_ (see also the full METS Document in [Appendix A](#bookmark=id.qbtyoq)).  These guidelines will be of use for building METS documents by hand as a method to learn the schema, for creating a template to be applied to multiple objects, and for building METS documents programmatically.  Due to the extremely complex and detailed nature of METS documents, implementers will not create METS documents for use in a production environment by this method. 

The digital version of the _Epigrams_ that we will be creating will consist solely of scanned page images from the Harvard University Press edition originally published in 1927.  For the purpose of this example, three different image files have been produced for each page: a high-resolution archival master TIFF image, a reference image for web display in JPEG format, and a low resolution GIF thumbnail image.  For the digital version, we will want to enable basic "page turner" applications, so that a user can display the individual page images in their reading order.  We'll also want to indicate the association between the thumbnail, the reference copy, and the archival master image.  We will also want to record descriptive metadata regarding the work, as well as technical metadata regarding the individual page images.

* [[structMap-fileSec|Structural map and file section]]
* [[dmdSec|Descriptive metadata]]
* [[amdSec|Administrative metadata]]
* [[techMD|Technical metadata]]
## **Conclusion**
In the complete example included in [Appendix A](#bookmark=id.qbtyoq), you will find that there is a complete MIX record for each of the image files.  One possible downside to the approach taken in this example is that quite a bit of room is consumed in the METS document recording replicated information.  All of the master images have the same MIME type, byte order, color space, etc.  A more efficient means of encoding this information would be to take the technical metadata that is shared by all of the images and placing it in a single MIX record which could be linked via the `<file>` elements' ADMID attributes to all of the appropriate image files.  Information specific to particular image files, such as strip offsets, creation date and time and image width and length, can be placed in separate MIX records.  Then individual `<file>` elements can use the ADMID attribute to link to both the MIX record containing the shared technical metadata and the MIX record containing the technical metadata specific to that particular image file.

As a final addition to the basic METS document, we might wish to include some minimal metadata about the creation of the METS document itself, such as its creation date and author.  This type of information is stored within the METS Header element (`<metsHdr>`), which is the first major section of a METS document after the opening `<mets>` element itself:


```xml
<mets:mets>
  <mets:metsHdr CREATEDATE="2006-05-09T10:30:00">
    <mets:agent ROLE="CREATOR">
      <mets:name>Rick Beaubien</mets:name> 
    </mets:agent>
  </mets:metsHdr>
  ...
</mets:mets>
```

By combining the `<metsHdr>`, `<dmdSec>`, `<amdSec>`, `<fileSec>` and `<structMap>` sections in a single METS document, we can create a document that contains the structure needed for applications to display the image data for this work in a reasonably sophisticated fashion as well as providing the information needed for both retrieval and management purposes.  More robust applications are possible as well, as METS provides other more sophisticated capabilities for structural information.  `<area>` elements can be used within the structural map to link a `<div>` element with only a portion of a content file; `<seq>` and `<par>` elements may be used to link `<div>` elements with more than one content file simultaneously (useful, for example, to link a `<div>` with separate audio and video streams representing the content at that `<div>`).  There is also the behavior metadata section (`<behaviorSec>`) which allows the METS document to record information about software behaviors that may be useful for accessing all, or part, of the METS object.  But the five sections discussed in this chapter are often all that is needed to represent even fairly complex works.
