Text only moved from Primer version 1

***

# Chapter 2: Authoring a METS Document

The METS standard provides a means of encoding digital library materials.  Its most fundamental task in accomplishing this goal is to provide a mechanism for recording the various relationships that exist between pieces of content, and between the content and metadata that compose a digital library object.  As the exact meaning and use of the various elements and attributes outlined in Chapter 3 can be difficult to understand in the abstract, this chapter will demonstrate their use in a practical application by creating a METS file for a digital version of Martial's _Epigrams_ (see also the full METS Document in [Appendix A](#bookmark=id.qbtyoq)).  These guidelines will be of use for building METS documents by hand as a method to learn the schema, for creating a template to be applied to multiple objects, and for building METS documents programmatically.  Due to the extremely complex and detailed nature of METS documents, implementers will not create METS documents for use in a production environment by this method. 

The digital version of the _Epigrams_ that we will be creating will consist solely of scanned page images from the Harvard University Press edition originally published in 1927.  For the purpose of this example, three different image files have been produced for each page: a high-resolution archival master TIFF image, a reference image for web display in JPEG format, and a low resolution GIF thumbnail image.  For the digital version, we will want to enable basic "page turner" applications, so that a user can display the individual page images in their reading order.  We'll also want to indicate the association between the thumbnail, the reference copy, and the archival master image.  We will also want to record descriptive metadata regarding the work, as well as technical metadata regarding the individual page images.



## **Structural Map and File Section**
The only required portion of a METS document is the structural map, and most schema-aware editing tools, when asked to create a METS document, will create the outermost [<mets>](#bookmark=id.3abhhcj) element and a subsidiary [<structMap>](#bookmark=id.1pgrrkc) element.  However, when authoring a METS document from scratch, it is often easier to create the file section ([<fileSec>](#bookmark=id.49gfa85)) first to record all of the digital content files, and then create both the basic structure for the object within the structural map as well as the links from the structural map to the content files.  So in this instance, we will populate the file section of the METS document first.

The <fileSec> portion of the METS document can contain one or more file group (<fileGrp>) elements which can be used to organize the individual file elements into sets.  In this case, since we have three different types of files (archival master, reference copy, and thumbnail), we will create three <fileGrp> elements within the <fileSec> to organize the individual files.  The basic structure of the file section thus looks like this:


        <mets:fileSec>


        	<mets:fileGrp USE="archive image"></mets:fileGrp>


        	<mets:fileGrp USE="reference image"></mets:fileGrp>


        	<mets:fileGrp USE="thumbnail image"></mets:fileGrp>


        </mets:fileSec>

We use the "USE" attribute of the <fileGrp> element to indicate the types of files which can be found within each file group.  All that is left at this point is to populate each <fileGrp> with <file> elements for each of the individual content files.  METS provides the ability for content either to be stored within the METS file itself or stored externally in another file and referenced.  For this example, we will store all of the content externally and reference it using the <FLocat> sub-element of the <file> element as follows:


        <mets:file ID="epi01m" MIMETYPE="image/tiff">


        	<mets:FLocat xlink:href="http://www.loc.gov/standards/mets/


        	docgroup/full/01.tif" LOCTYPE="URL"/>


       </mets:file>

Most of the important information within the <file> element and its sub-elements are actually conveyed via XML attributes.  So in this case, the <file> element itself provides two pieces of information: an XML ID value, which bears a unique identifier for this element that allows other portions of this METS document to reference it, and the MIME type for the data file being referenced.  The <FLocat> element supplies the location of the content file, using the xlink:href attribute, and also an indication of the type of referencing mechanism being used within the xlink:href attribute, in this case a URL (other possibilities might be a URN, HANDLE or PURL).  We can place this <file> element, and similar file elements for the equivalent reference and thumbnail images in the <fileSec> as follows:


        <mets:fileSec>


        	<mets:fileGrp USE="archive image">


        		<mets:file ID="epi01m" MIMETYPE="image/tiff">


        			<mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/


        			 full/01.tif" LOCTYPE="URL"/>


        		</mets:file>


        	</mets:fileGrp>


        	<mets:fileGrp USE="reference image">


        		<mets:file ID="epi01r" MIMETYPE="image/jpeg">


        			<mets:FLocat


        			 xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/01.jpg"


        			 LOCTYPE="URL"/>


        		</mets:file>


        	</mets:fileGrp>


        	<mets:fileGrp USE="thumbnail image">


        		<mets:file ID="epi01t" MIMETYPE="image/gif">


        			<mets:FLocat


        			 xlink:href="http://www.loc.gov/standards/mets/docgroup/gif/01.gif"


        			 LOCTYPE="URL"/>


        		</mets:file>


        	</mets:fileGrp>


        </mets:fileSec>

We could continue adding the &lt;file> elements to each of the <fileGrp> elements for each data file for all of the scanned pages, until we have <fileSec> that records the location for every page image file and provides a unique XML ID attribute value for each.

Once the <fileSec> is completed, it is then relatively simple to construct a physical structural map for the work, listing all pages in sequence, and associate the components of the structural map with the various data files contained in the <fileSec> by referencing their XML ID values.  A simple structural map for the _Epigrams_ might look like the following:


        <mets:structMap TYPE="physical">


        	<mets:div TYPE="book" LABEL="Martial Epigrams II">


        		<mets:div TYPE="page" LABEL="Blank page">


        		</mets:div>


        		<mets:div TYPE="page" LABEL="Page i: Half title page">


        		</mets:div>


        		<mets:div TYPE="page" LABEL="Page ii: Blank page">


        		</mets:div>


        		<mets:div TYPE="page" LABEL="Page iii: Title page">


        		</mets:div>


        		<mets:div TYPE="page" LABEL="Page iv: Publication info">


        		</mets:div>	


        		<mets:div TYPE="page" LABEL="Page v: Table of contents">


        		</mets:div>


        		<mets:div TYPE="page" LABEL="Page vi: Blank page">


        		</mets:div>


        		<mets:div TYPE="page" LABEL="Page 1: Half title page">


        		</mets:div>


        		<mets:div TYPE="page" LABEL="Page 2 (Latin)">


        		</mets:div>


        		<mets:div TYPE="page" LABEL="Page 3 (English)">


        		</mets:div>


        		<mets:div TYPE="page" LABEL="Page 4 (Latin)">


        		</mets:div>


        		<mets:div TYPE="page" LABEL="Page 5 (English)">


        		</mets:div>


        	</mets:div>


       </mets:structMap>

In this structural map, we indicate (using the <structMap> TYPE attribute) that we will be providing a physical structure of the work in question (as opposed, for instance, to a logical one), and in this case, that structure consists of saying that the work in question is a book (asserted using the TYPE attribute of the root <div> element in the structMap), and that the book is composed of a subsidiary set of pages.  We use the LABEL attribute on each of the &lt;div> elements to state what part of the work this particular &lt;div> element represents.  To link the various parts of this structure to the data files in the <fileSec>, we use the <fptr> element.  Each 'page' <div> can contain one or more <fptr> elements linking to the different individual images representing that particular page.  So, for the very first page in the book (with the label of "blank page"), we could modify the <div> element to include three <fptr> elements as follows:


        <mets:div TYPE="page" LABEL=" Blank page">


        	<mets:fptr FILEID="epi01m"/>


        	<mets:fptr FILEID="epi01r"/>


        	<mets:fptr FILEID="epi01t"/>


        </mets:div>

Each <fptr> element has a single FILEID attribute, which provides the value of the ID attribute of the appropriate <file> element within the <fileSec>.  So, in this case we have linked the <div> element for the first page of the book to three different files, the master TIFF image version, the reference copy, and the thumbnail version.  By inserting <fptr> elements in the other <div> elements within the <structMap>, we can link each to the matching image files for that particular page.

It is worth noting at this point that there are a variety of ways that we could have organized the structural map other than the one used here.  We could have chosen to do a logical structural map instead of a physical one, and had &lt;div> elements for the individual books and epigrams, instead of for pages.  Given that epigrams may only consume a portion of a page, or run across multiple pages, this would have called for a more complicated mapping to the image files using the <area> sub-element of <fptr> to map a <div> element for a particular epigram to a portion of an image file, and/or the use of the <seq> element to indicate multiple <area> elements pointing to different page image files that must be viewed in sequence to see the entirety of an epigram.  We might also have chosen to have two structural maps, one for the Latin version of the work, and one for the English translation, with the "page" level &lt;div> elements mapped to the appropriate page image files in each case.  None of these mappings is in any sense better or more correct; which one you might choose to implement depends upon the needs of your users and the resources you have available to create the necessary structures in METS.



## **Descriptive Metadata Section**
With a complete <fileSec> and <structMap>, we have sufficient information in our METS document to enable a page-turning application to display the digital library object.  But metadata needed for both discovery and management of the work is not yet included.  The descriptive metadata needed for discovery is easily added by creating a [<mdSec>](#bookmark=id.2olpkfy) element to contain it.  We can then insert the descriptive metadata record of our choice (in the example below, a MODS record) within that section.


        <mets:mets>


        	<mets:dmdSec ID="DMD1">


        		<mets:mdWrap MIMETYPE="text/xml" MDTYPE="MODS">


        			<mets:xmlData>


        				<mods:mods version="3.1">


        				  <mods:titleInfo>


        					<mods:title>Epigrams</mods:title>


        				  </mods:titleInfo>


        				  <mods:name type="personal">


        				   <mods:namePart>Martial</mods:namePart>


        					</mods:name>


        				   <mods:name type="personal">


        				     <mods:namePart>Ker, Walter C. A. (Walter Charles Alan),1853-1929


        				     </mods:namePart>


        				   </mods:name>


        				   <mods:typeOfResource>text</mods:typeOfResource>


        				</mods:mods>


        			</mets:xmlData>


        		</mets:mdWrap>


        	</mets:dmdSec>


        	<mets:fileSec>


        	</mets:fileSec>


        	<mets:structMap>


        	</mets:structMap>


        </mets:mets>

There are several things to note about this example.  The first is that we have chosen to embed the MODS record itself within the METS document; as an alternative, we could have stored the MODS record in a separate file, and then used the <mdRef> element instead of the <mdWrap> element within <dmdSec> to reference the location of the MODS record.


       <mets:mets>


        	<mets:dmdSec ID="DMD1">


        		<mets:mdRef MIMETYPE="application/MODS" MDTYPE="MODS"/>


        			<mets:binData>[base 64 encoded data goes here]</mets:binData>


        	</mets:dmdSec>


        </mets:mets>

The second is that the <mdWrap> element contains another subsidiary element, the <xmlData> element.  Since we are including a MODS record, this is the appropriate choice, but we could just as easily have placed a MARC record within the <dmdSec>, in which case we should have used the binary data wrapper element <binData> instead of <xmlData>.  Finally, note that we have assigned a unique XML ID attribute value to the <dmdSec> element itself.  This allows other portions of the METS document to reference to this descriptive metadata record.  For example, if we wish to link the root <div> element within the structural map to this MODS record to indicate that it pertains to the whole book (and not an individual page within the book), we could alter the <div> element to include a DMDID attribute referencing the MODS records ID attribute value as follows:


        		<mets:div TYPE="book" LABEL="Martial Epigrams II" DMDID="DMD1">

In this case, linking to the descriptive metadata record might not be crucial, but in cases where you may have separate descriptive metadata records for a book and individual chapters within the book (say for an edited volume compiling works from different authors) the ability to link a particular portion of the structure of the work to its own descriptive metadata record is valuable.



## **Administrative Metadata Section**
In addition to descriptive metadata, management of digital objects can require substantial amounts of administrative metadata.  For a newly created object such as this, there are at least two forms of administrative metadata that might be added immediately.  The first is some form of intellectual property rights statement regarding the content of the digital object and the source from which it was derived.  The second is technical metadata regarding the content files themselves.  METS provides a section for recording all of these forms of administrative metadata, the [<amdSec>](#bookmark=id.13qzunr) element.  Within the <amdSec> element, there are four major sub-elements: <techMD>, <rightsMD>, <sourceMD>, and <digiprovMD>.  The <techMD> element records technical metadata about content files, <rightsMD> records intellectual property rights information, <sourceMD> records descriptive, technical or rights information about an analog source document used to generate the digital library object, and <digiprovMD> records digital preservation information, such as information about the digital library object's life-cycle and history.

Our digital object, in this case, was digitized from a public domain edition of Martial's _Epigrams_, so a relatively short statement to that effect created using the METSRights schema will suffice for this object:


       <mets:amdSec>


        	<mets:rightsMD ID="ADMRTS1">


        		<mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="METSRights">


        			<mets:xmlData>


        				<rts:RightsDeclarationMD RIGHTSCATEGORY="PUBLIC DOMAIN">


        					<rts:Context CONTEXTCLASS="GENERAL PUBLIC">


        						<rts:Constraints CONSTRAINTTYPE="RE-USE">


        							<rts:ConstraintDescription>This volume was published in Great


        							Britain in 1927 by William Heineman (London) with a reference 


        							to G.P. Putnam's Sons in New York. (The verso of the title page 


        							says "Printed in Great Britain” and notes that it was 


        							originally published in 1920 and reprinted in 1927). Because 


        							this work was published abroad before 1978 without compliance 


        							with US Copyright formalities and because it entered the public 


        							domain in its home country as of 1 January 1996, it is now also


        							considered in the public domain in the United States without 


        							any constraints on use.


        							</rts:ConstraintDescription>


        						</rts:Constraints>


        					</rts:Context>


        				</rts:RightsDeclarationMD>


        			</mets:xmlData>


        		</mets:mdWrap>


        	</mets:rightsMD>


        </mets:amdSec>

As with the descriptive metadata record, it is useful to clarify that this record applies to the entirety of the work by associating it with the root <div> element in the structural map.  Editing the <div> element to add an ADMID attribute linking the <div> to this rights statement via the ID attribute on the <rightsMD> element accomplishes this:


       <mets:div TYPE="book" LABEL="Martial Epigrams II" DMDID="DMD1" ADMID="ADMRTS1">



## **Technical Metadata**
In addition to intellectual property rights information, long-term management and preservation of digital resources requires information regarding the technical characteristics of the digital content.  Such technical metadata about text, image, audio, and video data is best produced when the digital content is originally created.  The following record, encoded using the MIX format conforming to the NISO Z39.87 specification, provides technical metadata for the first master TIFF image in our book:


        <mets:techMD ID="TECHTIFF01">


       <mets:mdWrap MDTYPE="NISOIMG">


        <mets:xmlData>


        <mix:mix>


        	<mix:BasicImageParameters>


        		<mix:Format>


        			<mix:MIMEType>image/tiff</mix:MIMEType>


        			<mix:ByteOrder>little-endian</mix:ByteOrder>


        			<mix:Compression>


        				<mix:CompressionScheme>1</mix:CompressionScheme>


        			</mix:Compression>


        			<mix:PhotometricInterpretation>


        				<;mix:ColorSpace>1</mix:ColorSpace>


        			</mix:PhotometricInterpretation>


        			<mix:Segments>


        				<mix:StripOffsets>17810</mix:StripOffsets>


        				<mix:RowsPerStrip>3948</mix:RowsPerStrip>


        				<mix:StripByteCounts>10256904</mix:StripByteCounts>


        			</mix:Segments>


        			<mix:PlanarConfiguration>1</mix:PlanarConfiguration>


        		</mix:Format>


        		<mix:File>


        			<mix:Orientation>1</mix:Orientation>


        		</mix:File>


        	</mix:BasicImageParameters>


        	<mix:ImageCreation>


        		<mix:ScanningSystemCapture>


        			<mix:ScanningSystemSoftware>


        				<mix:ScanningSoftware>Adobe Photoshop CS Macintosh</mix:ScanningSoftware>


        			</mix:ScanningSystemSoftware>


        		&lt;/mix:ScanningSystemCapture>


        		&lt;mix:DateTimeCreated>2006-03-13T12:05:05&lt;/mix:DateTimeCreated>


        	&lt;/mix:ImageCreation>


        	&lt;mix:ImagingPerformanceAssessment>


        		<mix:SpatialMetrics>


        			<mix:SamplingFrequencyUnit>2</mix:SamplingFrequencyUnit>


        			<mix:XSamplingFrequency>600</mix:XSamplingFrequency>


        			<mix:YSamplingFrequency>600</mix:YSamplingFrequency>


        			<mix:ImageWidth>2598</mix:ImageWidth>


        			<mix:ImageLength>3948</mix:ImageLength>


        		</mix:SpatialMetrics>


        		<mix:Energetics>


        			<mix:BitsPerSample>8&lt;/mix:BitsPerSample>


        			<mix:SamplesPerPixel>1&lt;/mix:SamplesPerPixel>


        		</mix:Energetics>


        	</mix:ImagingPerformanceAssessment>


       </mix:mix>


        </mets:xmlData>


        </mets:mdWrap>


        </mets:techMD>

As with our other examples, this metadata record is in XML format, and so it is wrapped within &lt;mdWrap> and &lt;xmlData> tags.  Note that this record is wrapped in a &lt;techMD> element (which would itself be inserted in the &lt;amdSec> portion of a METS document), and that the &lt;techMD> tag has an ID attribute with a value of "TECHTIFF01" allowing us to reference this record from elsewhere in the METS document.

Unlike our previous examples, however, where we wished to associate the metadata records in question with the entirety of the digital object, in this case we want to associate this technical metadata record with a specific image file.  So in this case, we alter the &lt;file> tag for the appropriate image file within the &lt;fileSec> to include an ADMID attribute linking the image file to the appropriate technical metadata as follows:


        <mets:fileSec>


        	<mets:fileGrp USE="archive image">


        		<mets:file ID="epi01m" MIMETYPE="image/tiff" ADMID="TECHTIFF01">


        			<mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/


        			 full/01.tif" LOCTYPE="URL"/>


        		</mets:file>


        		. . . 


        	</mets:fileGrp>


        </mets:fileSec>



## **Conclusion**
In the complete example included in [Appendix A](#bookmark=id.qbtyoq), you will find that there is a complete MIX record for each of the image files.  One possible downside to the approach taken in this example is that quite a bit of room is consumed in the METS document recording replicated information.  All of the master images have the same MIME type, byte order, color space, etc.  A more efficient means of encoding this information would be to take the technical metadata that is shared by all of the images and placing it in a single MIX record which could be linked via the <file> elements' ADMID attributes to all of the appropriate image files.  Information specific to particular image files, such as strip offsets, creation date and time and image width and length, can be placed in separate MIX records.  Then individual &lt;file> elements can use the ADMID attribute to link to both the MIX record containing the shared technical metadata and the MIX record containing the technical metadata specific to that particular image file.

As a final addition to the basic METS document, we might wish to include some minimal metadata about the creation of the METS document itself, such as its creation date and author.  This type of information is stored within the METS Header element (<metsHdr>), which is the first major section of a METS document after the opening <mets> element itself:


        <mets:mets>


        	<mets:metsHdr CREATEDATE="2006-05-09T10:30:00">


        		<mets:agent ROLE="CREATOR">


        			<mets:name>Rick Beaubien&lt;/mets:name> 


        		</mets:agent>


        	</mets:metsHdr>


        	...


        </mets:mets>

By combining the &lt;metsHdr>, &lt;dmdSec>, &lt;amdSec>, &lt;fileSec> and &lt;structMap> sections in a single METS document, we can create a document that contains the structure needed for applications to display the image data for this work in a reasonably sophisticated fashion as well as providing the information needed for both retrieval and management purposes.  More robust applications are possible as well, as METS provides other more sophisticated capabilities for structural information.  &lt;area> elements can be used within the structural map to link a &lt;div> element with only a portion of a content file; &lt;seq> and &lt;par> elements may be used to link &lt;div> elements with more than one content file simultaneously (useful, for example, to link a &lt;div> with separate audio and video streams representing the content at that &lt;div>).  There is also the behavior metadata section (&lt;behaviorSec>) which allows the METS document to record information about software behaviors that may be useful for accessing all, or part, of the METS object.  But the five sections discussed in this chapter are often all that is needed to represent even fairly complex works.
