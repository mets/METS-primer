# Chapter 4:  Common constructs and standards

## XML Technologies and Specifications used throughout METS



### XSD ID, IDREF, and IDREFS
METS uses IDREF and IDREFS attributes on numerous elements to establish links between these elements and other elements within the METS document.  In addition, METS uses IDREF mechanisms to establish links between an <area> element within the METS structMap and elements in a structured text content file.
### Internal cross referencing in METS via ID, IDREF and IDREFS.
### Overview of ID, IDREF and IDREFS datatypes for XML attributes.
### The XSD ID datatype
XML schema provides a built in ID datatype for the purpose of associating internally unique identifiers with elements in an XML instance document.  Note that an attribute implementing the XML schema ID datatype is ONLY intended to provide a means of assigning a unique identifier to the element with which it is associated.  Attributes of this type are NOT intended to store any kind of external identifier. The following characteristics apply to attributes implementing the XSD ID datatype.
* An XML schema or DTD can declare one and only one attribute of type ID in conjunction with each element declared by the schema.
* Values assigned to attributes of the ID type in an instance document must begin with a letter or underscore (not a digit), and can only contain letters, digits, periods, hyphens and underscores. 
* Values assigned to attributes of the ID type in an instance document must be unique within the document and across elements from all the namespaces represented in the document.


### The XSD IDREF and IDREFS datatypes
XML schema provides two built in datatypes for creating cross references from one element in an instance document to another element or elements in the same document. An attribute of type IDREF associated with an element can cite the ID value that identifies another element in the same instance document.  In other words, an attribute of type IDREF creates a cross reference from the source element with which it's associated to another element in the same instance document by citing the ID value that identifies the target element. An attribute of type IDREFS works in the same manner, but can contain multiple space delimited ID values, each of which identifies a different element in the same instance document.  So an attribute of type IDREFS creates cross references from the source element with which it is associated to multiple other elements in the same instance document by citing the ID values that identify the target elements.  The concrete examples of the application of IDREF and IDREFS attributes in METS that appear in the section immediately below should help clarify the IDREF/ID cross referencing mechanisms.


### Cross-referencing in METS

METS makes extensive provisions for using attributes of the ID, IDREF and IDREFS datatypes to create cross references between related elements.  Ultimately these provisions allow units of information appearing in dispersed locations across a METS instance to be linked to all of their appropriate contexts without redundancy.  METS elements of the mdSecType and fileType datatypes have required ID attributes which allow the descriptive metadata, administrative metadata, and content file elements that implement these datatypes to be referenced from the other parts of the METS instance document to which they pertain.  In addition to this, <div> elements in the &lt;structMap> map can include ID attribute values that allow them to be referenced by <behavior> elements in the &lt;behaviorSec>.  METS’ specific cross referencing provisions for different contexts follow.

### Context 1: &lt;dmdSec>: descriptive metadata
* A unique ID attribute value must identify each &lt;dmdSec> element in a METS instance document.
* Each of the following elements can reference one or more specific &lt;dmdSec> elements by citing their ID values in its DMDID attribute.  (The DMDID attribute is of IDREFS type):
  * mets/fileSec/fileGrp/file
  * mets/fileSec/file/stream
  * mets/structMap/div

#### Example
In the example below the ID attribute value of “DMD1” identifies the single &lt;dmdSec> element.  The root <div> in the &lt;structMap> references this &lt;dmdSec> by means of its DMDID attribute. Thus the encoding indicates that the descriptive metadata in the &lt;dmdSec> identified by the ID value “DMD1” applies to the entire content as represented by the root <div> in the &lt;structMap>.

    <mets:mets xmlns:mets="http://www.loc.gov/METS/" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd http://www.loc.gov/mods/v3 http://www.loc.gov/mods/v3/mods-3-1.xsd"


    OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">


    	<mets:dmdSec ID="DMD1">


    		<mets:mdWrap MDTYPE="MODS">


    			<mets:xmlData>


    				<mods:mods>


    					<mods:titleInfo>


    						<mods:title>Martial Epigrams</mods:title>


    					</mods:titleInfo>


    				</mods:mods>


    			</mets:xmlData>


    		</mets:mdWrap>


    	</mets:dmdSec>


    	<mets:structMap TYPE="physical">


    		<mets:div TYPE="book" LABEL="Martial Epigrams II" DMDID="DMD1">


    		</mets:div>   


    	</mets:structMap>


    </mets:mets>




### Context 2: &lt;techMD>, &lt;rightsMD>, &lt;sourceMD>, &lt;digiprovMD>: 


#### Administrative metadata
* A unique ID attribute value must identify each administrative metadata element in a METS instance document—specifically, each techMD, sourceMD, rightsMD or digiprovMD element.
*  Each of the following elements can reference one or more specific &lt;techMD>, &lt;sourceMD>, &lt;rightsMD> and/or &lt;digiprovMD> elements containing pertinent administrative metadata by citing their ID values in its ADMID attribute. (The ADMID attribute, like the DMDID attribute is of type IDREFS).
   * mets/dmdSec 
   * mets/amdSec/techMD  
   * mets/amdSec/sourceMD 
   * mets/amdSec/rightsMD 
   * mets/amdSec/digiprovMD 
   * mets/fileSec/fileGrp 
   * mets/fileSec/fileGrp/file 
   * mets/fileSec/fileGrp/file/stream 
   * mets/behaviorSec/behavior 

#### Example. 
In the example below the ID attribute value of “App4ADM1” identifies the single &lt;techMD> element and the ID value “App4ADM2” identifies the single &lt;rightsMD> element.  The ADMID attribute on the single <file> element in the &lt;fileSec> references both of these ID values (“App4ADM1 App4ADM2”). Thus the encoding indicates that both the technical metadata in the &lt;techMD> element identified by the ID value “App4ADM1” and the rights metadata in the &lt;rightsMD> element identified by the ID value “App4ADM2” apply to the content file represented by the <file> element.

        <mets:mets xmlns:mets="http://www.loc.gov/METS/"


        xmlns:mods="http://www.loc.gov/mods/v3"


        xmlns:rts="http://cosimo.stanford.edu/sdr/metsrights/"


        xmlns:mix="http://www.loc.gov/mix/"


        xmlns:xlink="http://www.w3.org/1999/xlink"


        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"


        xsi:schemaLocation="http://www.loc.gov/METS/


        http://www.loc.gov/standards/mets/mets.xsd


        http://cosimo.stanford.edu/sdr/metsrights/


        http://cosimo.stanford.edu/sdr/metsrights.xsd


        http://www.loc.gov/mods/v3


        http://www.loc.gov/standards/mods/v3/mods-3-1.xsd


        http://www.loc.gov/mix/


        http://www.loc.gov/standards/mix/mix.xsd"


        OBJID="ark:/13030/hb3c6005tv"


        TYPE="still image"


        LABEL="S. P. [Simmon Peña] Storms, Interpreter [&amp;c], Indian agency - near Grass Valley, California, 1851"


        PROFILE="http://www.loc.gov/standards/mets/profiles/0000000X.xml">


        	<mets:amdSec>


        		<mets:techMD ID="App4ADM1">


        			<mets:mdWrap MDTYPE="NISOIMG">


        				<mets:xmlData>


        					<mix:mix>


        						<mix:BasicImageParameters>


        							<mix:Format>


        								<mix:MIMEType>image/tiff</mix:MIMEType>


        								<mix:Compression>


        								<mix:CompressionScheme>1</mix:CompressionScheme>


        								</mix:Compression>


        								<mix:PhotometricInterpretation>


        									<mix:ColorSpace>2</mix:ColorSpace>


        									<mix:ICCProfile>


        									<mix:ProfileName>DilE836G18_01</mix:ProfileName>


        									</mix:ICCProfile>


        								</mix:PhotometricInterpretation>


        							</mix:Format>


        						</mix:BasicImageParameters>


        						<mix:ImageCreation>


        							<mix:ImageProducer>DIL/U.C. Berkeley Library


        							</mix:ImageProducer>


        							<mix:DeviceSource>reflection print scanner


        							</mix:DeviceSource>


        							<mix:ScanningSystemCapture>


        								<mix:ScanningSystemHardware>


        									<mix:ScannerManufacturer>Epson


        									</mix:ScannerManufacturer>


        									<mix:ScannerModel>


        										<mix:ScannerModelName>836xl


        										</mix:ScannerModelName>


        										<mix:ScannerModelSerialNo>B05401003MG9601009


        										</mix:ScannerModelSerialNo>


        									</mix:ScannerModel>


        								</mix:ScanningSystemHardware>


        							</mix:ScanningSystemCapture>


        						</mix:ImageCreation>


        						<mix:ImagingPerformanceAssessment>


        							<mix:SpatialMetrics>


        								<mix:SamplingFrequencyUnit>2</mix:SamplingFrequencyUnit>


        								<mix:XSamplingFrequency>600</mix:XSamplingFrequency>


        								<mix:YSamplingFrequency>600</mix:YSamplingFrequency>


        							</mix:SpatialMetrics>


        							<mix:Energetics>


        								<mix:BitsPerSample>8,8,8</mix:BitsPerSample>


        								<mix:SamplesPerPixel>3</mix:SamplesPerPixel>


        							</mix:Energetics>


        						</mix:ImagingPerformanceAssessment>


        					</mix:mix>


        				</mets:xmlData>


        			</mets:mdWrap>


        		</mets:techMD>


        		<mets:rightsMD ID="App4ADM2">


        			<mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="METSRights">


        				<mets:xmlData>


        					<rts:RightsDeclarationMD RIGHTSCATEGORY="OTHER" 


        					 OTHERCATEGORYTYPE="UNKNOWN">


        						<rts:RightsHolder>


        							<rts:RightsHolderComments>All requests to reproduce, 


        							 publish, quote from, or otherwise use collection materials 							 must be submitted in writing to the Head of Access 


        							 Services, The Bancroft Library, University of California, 


        							 Berkeley 94720-6000. Consent is given on behalf of The 


        							 Bancroft Library as the owner of the physical items and 


        							 does not constitute permission from the copyright owner. 


        							 Such permission must be obtained from the copyright owner. 


        							 See: http:// bancroft.berkeley.edu/reference/


        							 permissions.html


        							</rts:RightsHolderComments>


        						</rts:RightsHolder>


        					<rts:Context CONTEXTCLASS="GENERAL PUBLIC">


        						<rts:Constraints>


        							<rts:ConstraintDescription>Copyright status unknown. Some


        							 materials in these collections may be protected by the 


        							 U.S. Copyright Law (Title 17, U.X.C.). In addition, the


        							 reproduction of some materials may be restricted by terms


        							 of University of California gift or purchase agreements, 


        							 donor restrictions, privacy and publicity rights, 


        							 licensing and trademarks. Transmission or reproduction of 


        							 materials protected by copyright beyond that allowed by 


        							 fair use requires the written permission of copyright 


        							 owners.  Works not in the public domain cannot be 


        							 commercially exploited without permission of the copyright


        							 owner. Responsibility for any use rests exclusively with 


        							 the user.


        						</rts:ConstraintDescription>


        						</rts:Constraints>


        					</rts:Context>


        				</rts:RightsDeclarationMD>


        				</mets:xmlData>


        			</mets:mdWrap>


        		</mets:rightsMD>


        	</mets:amdSec>


        	<mets:fileSec>


        		<mets:fileGrp VERSDATE="2003-01-22T00:00:00.0" USE="archive image">


        			<mets:file ID="App4FID1" MIMETYPE="image/tiff" SEQ="1" 


        			 CREATED="2003-01-22T00:00:00.0" ADMID="App4ADM1 App4ADM2"


        			 GROUPID="GID1">


        				<mets:FLocat xlink:href="http://offlineimage/calcultures/ucb/


        				 cubanc_1_2_00004722a.tif" LOCTYPE="URL"/>


        			</mets:file>


        		</mets:fileGrp>


        	</mets:fileSec>


        	<mets:structMap TYPE="physical">


        		<mets:div ORDER="1" TYPE="still image" LABEL="S. P. [Simmon Peña] 


        		 Storms, Interpreter [&#x26;c], Indian agency - near Grass Valley, 


        		 California, 1851">


        			<mets:fptr FILEID="App4FID1"/>


        		</mets:div>


        	</mets:structMap>


        </mets:mets>



### Context 3: &lt;file>: content files
* A unique ID attribute value must identify each &lt;file> element in the &lt;fileSec> of  a METS document.
* Each of the following elements can reference the specific &lt;file> pertinent to it by citing the &lt;file> element’s ID value in its FILEID attribute. (The FILEID attribute is of type IDREF).
  * mets/structMap/div/fptr
  * mets/structMap/div/fptr/area
  * mets/structMap/div/fptr/seq/area
  * mets/structMap/div/fptr/par/area
  * mets/structMap/div/fptr/par/seq/area

#### Example.
The example under “CONTEXT2” immediately above also demonstrates the current context.  In this example, the ID attribute value of “App4FID1” identifies the single &lt;file> element.  The single &lt;fptr> element under the root <div> of the &lt;structMap> references this ID value.  Thus the encoding indicates that the content file represented by the <file> element with an ID value of “App4FID1” manifests the root <div> element.

### Context 4: &lt;div>: nodes of the &lt;structMap>
* A unique ID attribute value must identify each &lt;div> in the &lt;structMap> for which there is an associated <behavior> in the &lt;behaviorSec>.  (However, note that the ID attribute is not generally required for &lt;div> elements)
* Each &lt;behavior> in the &lt;behaviorSec> must include a STRUCTID attribute which cites the ID values of the <div> elements to which the defined behavior applies. (The STRUCTID attribute is of type IDREFS).
* In the full example of the Behavior Section found in Chapter 3 above, the STRUCTID attributes on the two &lt;behavior> elements appearing in the &lt;behaviorSec> identify the content to which the behaviors represented should be applied – the content represented by the &lt;div> with the ID attribute value of “top.”  The &lt;behaviorSec> in the example indicated that both the “disp1” and “auth1” behavior mechanisms should operate when the &lt;div> element identified by the ID value “top” is activated, for example, in a METS reader/navigator.

### External referencing using IDREF/ID links

### Provisions for referencing specific elements in external, structured text content and metadata files from METS by means of ID attribute values declared in these external files
Several structured text languages—such as XML, SGML, and HTML—allow identifiers to be associated with individual elements by means of attributes that implement the XML ID datatype.  This has already been described above with respect to XML in general and METS in particular.  METS makes two provisions for referencing specific elements in external, structured text document.  

### Use of BEGIN, END, and BETYPE to reference IDs in structured text content files.
Through its descendant &lt;fptr>, &lt;area>, &lt;par> and &lt;seq> elements, a &lt;div> in the &lt;structMap> can point to the &lt;file> element or elements in the &lt;fileSec> representing the content that manifests the &lt;div>. Sometimes, however, only a portion of the integral content represented by the referenced &lt;file> element is pertinent.  If the content represented by the &lt;file> element is encoded in XML, SGML, or HTML and the key elements of the content file have associated ID attribute values,  a METS &lt;area> element can use these ID values to isolate the relevant portion of the content file.  In this case, the <area> BEGIN attribute would cite the ID attribute value of the first pertinent element in the indicated content file; the &lt;area> END attribute would cite the ID value of the last pertinent element in the indicated content file; and the BETYPE attribute value would be “IDREF” to indicate that ID values were being used to identify the bounding elements defining the the relevant section of the content file.

### EXAMPLE
In the example below, which is an excerpt from a longer encoding, the second &lt;div> element in the &lt;structMap> uses the <area> element’s BEGIN, END and BETYPE attributes to isolate just the relevant portion of a TEI content file that manifests the &lt;div>.  The <div> represents a single, dated entry in the diary; and the <area> element associates this <div> with just the portion of the integral TEI encoding that begins with the TEI element identified by the ID attribute value “entry1” and ends with the TEI element identified by the ID attribute value “entry1end.”


        <mets:mets xmlns:mets="http://www.loc.gov/METS/" xmlns:mods="http://www.loc.gov/mods/" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd" OBJID="ark:/13030/kt9s2010hz" TYPE="text" LABEL="[Patrick Breen Diary November 20, 1846 - March 1, 1847]" PROFILE="http://www.loc.gov/mets/profiles/00000005.xml">


        	<mets:dmdSec ID="DMD1">


        		<mets:mdRef  LABEL="Patrick Breen Papers" xlink:href="http:/sunsite2.berkeley.edu/


        		 cgi-bin/oac/calher/breenpapers" LOCTYPE="URL" MDTYPE="EAD" XPTR="xpointer


        		 (id('xyzj0098'))"/>


        	</mets:dmdSec>


        	<mets:fileSec>


        		<mets:fileGrp VERSDATE="1998-12-04T00:00:00" USE="text/tei">


        			<mets:file ID="FID1" MIMETYPE="text/sgml" SEQ="1" 


        			 CREATED="1998-12-04T00:00:00" GROUPID="GID1">


        				<mets:FLocat xlink:href="http://sunsite.berkeley.edu/~jmcdonou/BREEN/sgml/


        				 breen2.sgm" LOCTYPE="URL"/>


        			</mets:file>


        		</mets:fileGrp>


        	</mets:fileSec>


        	<mets:structMap TYPE="logical">


        		<mets:div LABEL="Patrick Breen Diary: Donner passage" DMDID="DMD1">


        			<mets:div TYPE="entry" LABEL="Friday Nov. 20th 1846">


        				<mets:fptr>


        					<mets:area FILEID="FID1" BETYPE="IDREF" BEGIN="entry1" 


        					 END="entry1end"/>


        				</mets:fptr>


        			</mets:div>


        		</mets:div>	


        	</mets:structMap>


        </mets:mets>


### ID values in the <mdRef> “XPTR” attribute.

The <mdRef> element, which can appear within <dmdSec>, <techMD>, <rightsMD>, <sourceMD> and <digiprovMD> elements, points to descriptive or administrative metadata in external files.  In the cases where this metadata is in XML or SGML format, and only a portion of the entire metadata file is relevant, the <dmdSec> element’s XPTR attribute can be used in conjunction with the ID attribute value that identifies the pertinent element in the external metadata file to isolate the relevant section of that file.  For example, if the relevant element in the referenced metadata file had an ID value of  “xyzj0098”, the <mdRef> element in the METS instance document could reference this specific element with the following XPTR value: XPTR="xpointer(id('xyzj0098'))"


### EXAMPLE.
The example immediately above demonstrates the use of an XPTR attribute in an &lt;mdRef> element.  Here, the &lt;mdRef> points to the finding aid for a collection (“Patrick Breen Papers”) that includes the source document represented by the METS encoding (“Patrick Breen Diary”).  The XPTR attribute on the <mdRef> indicates that the portion of the finding aid describing the diary is contained in the finding aid element identified by the ID attribute value “xyzj0098”.


### Referencing METS elements from external documents
Each element defined in the METS schema for use in a METS instance document has an associated ID attribute.  In general, except for the few cases noted above, this ID attribute is optional. However, an ID attribute value can be assigned to identify any METS element in an instance document any time it might be necessary to provide a handle to which this element can be referred to unambiguously from outside the METS document.  The implementers of the METS schema did not attempt to anticipate the specific applications in which such handles might be necessary or useful, but simply attempted to ensure that the necessary ID infrastructure was in place to support such element referencing wherever a need might arise.

### IDREF/ID linking across different namespaces
As is described above, the elements of mdSecType (&lt;dmdSec>, &lt;techMD>, &lt;rightsMD>, &lt;sourceMD> and &lt;digiprovMD>) all have required ID attributes.  The unique identifier values assigned to these attributes allow these elements to be referenced from the DMDID and/or ADMID attributes that are associated with &lt;file> and &lt;div> elements. The mdSecType elements can all include metadata in the form of elements drawn from other namespaces in their &lt;xmlData> sections. And in cases where the elements drawn from other namespaces for populating the &lt;xmlData> sections themselves have ID attributes, as is the case with some elements drawn from the MODS and VRACORE namespaces, the DMDID and ADMID attributes can reference identifier values assigned to these ID attributes instead of or in addition to the values assigned to ID attributes in the top level mdSecType element (e.g., &lt;dmdSec>).



### EXAMPLE
The example below includes a &lt;dmdSec> with very abbreviated VRA encoded descriptive metadata.  These metadata include a description of a print series, a description of a single print from this series, and descriptions of multiple images.  The various other parts of the METS document reference the pertinent sections of the VRA encoding by citing ID values identifying elements in the VRA namespace.  For example, each <file> element in the &lt;fileSec> uses its DMDID attribute to cite the ID attribute value that identifies the &lt;vra:image> element that describes it. The root <div> element in the mets <structMap> uses its DMDID attribute to cite the ID attribute value that identifies the &lt;vra: work> element that describes the print series as a whole; and the &lt;div> that is the immediate child of the root &lt;div> element, and which represents a single print from the series, uses its DMDID attribute to cite the ID attribute value that identifies the &lt;vra:work> element that describes the individual print.


        <mets:mets xmlns:mets="http://www.loc.gov/METS/" xmlns:vra="http://www.vraweb.org/vracore4.htm" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/mets.xsd http://www.vraweb.org/vracore4.htm http://gort.ucsd.edu/escowles/vracore4/vra-4.0-strict.xsd" OBJID="ark:/13030/kt9s2009hz" LABEL="Los Caprichos">


        	<mets:dmdSec ID="DMD1">


        		<mets:mdWrap MDTYPE="VRA">


        			<mets:xmlData>


        				<vra:vra>


        					<vra:work id="WORK1">


        						<vra:agentSet>


        							<vra:display>Francisco Goya (Spanish, 1746-1828)</vra:display>


        							<vra:agent>


        								<vra:name vocab="ULAN" refid="500035328">Goya,Francisco


        								</vra:name>


        								<vra:dates type="life">


        									<vra:earliestDate>1746</vra:earliestDate>


        									<vra:latestDate>1828</vra:latestDate>


        								</vra:dates>


        								<vra:culture>Spanish</vra:culture>


        								<vra:role vocab="AAT" refid="300025164">printmaker


        								</vra:role>


        							</vra:agent>


        						</vra:agentSet>


        						<vra:titleSet>


        							<vra:display>Los Caprichos</vra:display>


        							<vra:title type="creator" pref="true"xml:lang="es">Los 


        							Caprichos</vra:title>


        						</vra:titleSet>


        						<vra:worktypeSet>


        							<vra:display>print series</vra:display>


        							<vra:worktype>print series</vra:worktype>


        						</vra:worktypeSet>


        					</vra:work>


        					<vra:work id="WORK2">


        						<vra:agentSet>


        							<vra:display>Francisco Goya (Spanish, 1746-1828)


        							</vra:display>


        							<vra:agent vocab="ULAN" refid=" 500035328">


        								<vra:dates type="life">


        									<vra:earliestDate>1746</vra:earliestDate>


        									<vra:latestDate>1828</vra:latestDate>


        								</vra:dates>


        								<vra:culture>Spanish</vra:culture>


        								<vra:role vocab="AAT"refid=" 300025164">printmaker


        								</vra:role>


        							</vra:agent>


        						</vra:agentSet>


        						<vra:descriptionSet>


        							<vra:description>Man, asleep at a table, surrounded by demonic-


        							 looking animals and birds. Originally intended as the 


        							 frontispiece for the series.</vra:description>


        						</vra:descriptionSet>


        						<vra:titleSet>


        							<vra:display> El Sueño de la Razon Produce Monstruos (The Sleep


        							 of Reason Produces Monsters)</vra:display>


        							<vra:title type="creator" pref="true"xml:lang="es">El Sueño de 


        							 la Razon Produce Monstruos</vra:title>


        							<vra:title type="translated" pref="true" xml:lang="en">The 


        							 Sleep of Reason Produces Monsters</vra:title>


        						</vra:titleSet>


        					</vra:work>


        					<vra:image id="IMAGE1">


        						<vra:measurementsSet>


        							<vra:display>349 x 520 pixels</vra:display>


        							<vra:measurements type="width" unit="pixels"extent=


        							 "overall">349</vra:measurements>


        							<vra:measurements type="height" unit="pixels"extent= 


        							 "overall">520</vra:measurements>


        						</vra:measurementsSet>


        						<vra:titleSet>


        							<vra:display>Full view</vra:display>


        							<vra:title type="descriptive">Full view</vra:title>


        						</vra:titleSet>


        					</vra:image>


        					<vra:image id="IMAGE2">


        						<vra:measurementsSet>


        							<vra:display>459 x 683 pixels</vra:display>


        							<vra:measurements type="width" unit="pixels"extent= 


        							 "overall">459</vra:measurements>


        							<vra:measurements type="height" unit="pixels"extent= 


        							 "overall">683</vra:measurements>


        						</vra:measurementsSet>


        						<vra:titleSet>


        							<vra:display>Large full view</vra:display>


        							<vra:title type="descriptive">Large full view</vra:title>


        						</vra:titleSet>


        					</vra:image>


        					<vra:image id="IMAGE3">


        						<vra:measurementsSet>


        							<vra:display>111 x 165 pixels</vra:display>


        							<vra:measurements type="width" unit="pixels"extent=


        							 "overall">111</vra:measurements>


        							<vra:measurements type="height" unit="pixels"extent=


        							 "overall">165</vra:measurements>


        						</vra:measurementsSet>


        						<vra:titleSet>


        							<vra:display>Thumbnail view</vra:display>


        							<vra:title type="descriptive">Thumbnail view</vra:title>


        						</vra:titleSet>


        					</vra:image>


        				</vra:vra>


        			</mets:xmlData>


        		</mets:mdWrap>


        	</mets:dmdSec>


        	<mets:fileSec>


        		<mets:fileGrp USE="Full view">


        			<mets:file ID="FID1" MIMETYPE="image/jpg" DMDID="IMAGE1">


        				<mets:FLocat xlink:href="http://www.museum.cornell.edu/HFJ/permcoll/pdp/


        				 img_pr/monstros_l.jpg" LOCTYPE="URL"/>


        			</mets:file>


        		</mets:fileGrp>


        		<mets:fileGrp USE="Large full view">


        			<mets:file ID="FID2" MIMETYPE="image/jpg" DMDID="IMAGE2">


        				<mets:FLocat xlink:href="http://www.museum.cornell.edu/HFJ/permcoll/pdp/


        				 img_pr/monstros_X.jpg" LOCTYPE="URL"/>


        			</mets:file>


        		</mets:fileGrp>	


        		<mets:fileGrp USE="Thumbnail view">


        			<mets:file ID="FID3" MIMETYPE="image/jpg" DMDID="IMAGE3">


        				<mets:FLocat xlink:href="http://www.museum.cornell.edu/HFJ/permcoll/pdp/


        				 img_pr/monstros_s.jpg" LOCTYPE="URL"/>


        			</mets:file>


        		</mets:fileGrp>


        	</mets:fileSec>


        	<mets:structMap TYPE="physical">


        		<mets:div TYPE="intaglio print series" LABEL="Los Caprichos" DMDID="WORK1">


        			<mets:div TYPE="intaglio print" LABEL="El Sueño de la Razon Produce Monstruos 


        			 (The Sleep of Reason Produces Monsters)"DMDID="WORK2">


        				<mets:fptr FILEID="FID1"/>


        				<mets:fptr FILEID="FID2"/>


        				<mets:fptr FILEID="FID3"/> 


        			</mets:div>


        		</mets:div>


        	</mets:structMap>


        </mets:mets>



## **Linking via XLink attributes.**
XLink is a specification for an XML linking language.  Essentially XLink provides for a number of named attributes which can be used to specify linking relationships between two resources and to associate metadata with these links. (The specification is available at [http://www.w3.org/TR/xlink/](http://www.w3.org/TR/xlink/))  The XLink specification does not include a normative implementation of the standard, and developers are left to implement their own XLink schemas or DTDs.  The implementers of the METS standard have provided an XLink schema for use with METS.  Attributes declared in this XLink schema are used in two main ways in METS. 



### Linking to external resources.
METS uses XLink attributes from the Xlink  “simpleLink” attribute group to provide links to external resources from elements within METS.  Specifically, the xlink:href attribute is used to specify the URL of the pertinent external resource; and the xlink:role, xlink:arcrole, xlink:title, xlink:show, and xlink:actuate can be used to specify or associate pertinent metadata with the specified xlink:href link.  (For more information on the use of specific xlink attributes, see the attribute tables associated with specific METS elements as well as the XLink specification.)  The XLink simpleLink attributes can be used in two main contexts in METS.



### Context 1: The &lt;mdRef> sub-element in elements of mdSecType.
The &lt;mdRef> element in &lt;dmdSec>, &lt;techMD>, &lt;rightsMD>, &lt;sourceMD> and &lt;digiprovMD> elements uses the xlink:href attribute to point to the external resource containing the pertinent metadata.  In addition, the other xlink simpleLink attributes could be used to describe this link.

### EXAMPLE
In the &lt;dmdSec> below, the xlink:href attribute cites a URL that identifies the location of an external, EAD based description.


        	<mets:dmdSec ID="DMD1">


        		<mets:mdRef  LABEL="Patrick Breen Papers" xlink:href=


        		 "http://sunsite2.berkeley.edu/cgi-bin/oac/calher/breenpapers" 


        		 LOCTYPE="URL" MDTYPE="EAD" XPTR="xpointer(id('xyzj0098'))"/>


        	</mets:dmdSec>



### Context 2: The &lt;FLocat> sub-element of the &lt;file> elements in the &lt;fileSec>.
The &lt;FLocat> element uses an xlink:href attribute to point to the pertinent content file in its external location.  The other XLink simpleLink attributes can be used to describe this link.  


### EXAMPLE
In the example below, the xlink:href attribute uses a URL to identify the location of the pertinent external content file. 


        		<mets:fileGrp USE="Full view">


        			<mets:file ID="FID1" MIMETYPE="image/jpg" DMDID="IMAGE1">


        				<mets:FLocat xlink:href="http://www.museum.cornell.edu/HFJ/


        				 permcoll/pdp/img_pr/monstros_l.jpg" LOCTYPE="URL"/>


        			</mets:file>


        		</mets:fileGrp>



### Linking &lt;div> elements internally in &lt;structLink>.
The &lt;structLink> section of a METS document can be used to express non-hierarchical, hyperlink type relationships between &lt;div> elements in the &lt;structMap>.  The best way to accomplish this is to assign a unique string value to the “xlink:label” attribute on each &lt;div> in the structMap that represents the source node or the target node of a hyperlink relationship.  An &lt;smLink> element in the &lt;structLink> section of the METS document can then define each hyperlink relationship by referencing the xlink:label attribute value for the &lt;div> representing a source node in its xlink:from attribute and the xlink:label attribute value for the &lt;div> representing the target node in its xlink:to attribute.  For more information on the use of XLink attributes for establishing hyperlink relationships, see below.

### EXAMPLE
See Examples 1 and 2 from the &lt;structLink> section of this manual



## **Wrapping metadata and digital content in METS**
METS provides a means both for wrapping metadata conforming to externally defined formats and for wrapping digital content of any type directly in a METS object. It accomplishes this through its &lt;xmlData> and &lt;binData> elements.  These elements can occur in different contexts as is described below.



### &lt;xmlData>
#### Namespace concepts and <xmlData>
* Any XML schema can declare a target namespace. This takes the form of a URI intended to serve as a unique identifier for the specific context represented by the schema.  For example, the target namespace declared by the METS schema is “http://www.loc.gov/METS/”
* An element declared in a particular schema can be unambiguously referenced in any xml context by first identifying the target namespace from which the element is being drawn and then specifying the name of the element.  Often an instance document accomplishes this by associating a different prefix with the URI for each target namespace it declares, and then using the appropriate prefix in combination with each element name appearing in the document to identify the namespace from which the element is drawn.  For example, once an instance document has associated the prefix “mods” with the namespace identified by the URI “http://www.loc.gov/mods/v3” it can use <mods:titleInfo> unambiguously to reference the <titleInfo> element as it is declared in version 3 of the MODS schema.
* The target namespace URI is an identifier, and is not necessarily resolvable.  It does not specify the location of a schema that implements the namespace context that it identifies.  XML documents, however, can associate each namespace context they declare with a specific schema and location by means of a schemaLocation attribute.  Doing this allows an XML parser/validator to check all of the elements in an XML document against the specific schemas in which they are declared.
* Some schema, such as METS, allow instance documents conforming to the schema to use elements declared in any external namespaces or in no namespace in certain contexts. The METS <xmlData> elements provide such contexts.


#### METS &lt;xmlData> elements
METS &lt;xmlData> elements serve as wrappers for xml content whose constituent elements may be drawn from any namespace or from no namespace.  The &lt;xmlData> elements specify a “processContents” directive of “lax,” which means that an xml validator will check the xml elements appearing within the &lt;xmlData> element for validity if and only if the METS instance document declares the namespace that governs the elements and specifies a valid schemaLocation for a schema that implements the namespace.  If a namespace is not declared for the elements, or if the governing schema cannot be found, then an XML validator will check the xml within the &lt;xmlData> element for well-formedness, but not for validity.

&lt;xmlData> elements as described above appear in the following contexts in METS:

#### Context 1: The &lt;mdWrap> elements of the “mdSecType”.
These include:
* &lt;dmdSec>  Typically in this context, the <xmlData> element would contain elements from an xml-based descriptive metadata format such as MODS, MARCXML, DC, VRA, etc.
* &lt;techMD>, &lt;rightsMD>, &lt;sourceMD> and &lt;digiprovMD> in an &lt;amdSec>: Typically in these contexts the &lt;xmlData> element would contain elements from an xml-based administrative metadata format such as MIX (for &lt;techMD> about images) or PREMIS (for &lt;digiprovMD> about digital content).


#### Context 2: &lt;FContent> elements associated with &lt;file> elements in the &lt;fileSec>.
If the digital content represented by a <file> element is in XML format, and a METS implementer wishes to incorporate that content directly in the &lt;file> element, then the XML comprising the content can appear directly in a FContent/xmlData element.

### <binData>
The METS &lt;binData> elements serve as wrappers for base64 encoded binary content.  METS implementers would use this element when they wish to include non-xml metadata or digital content directly in the METS document.

A &lt;binData> element as described above can appear in each of the following contexts.

#### Context 1: The &lt;mdWrap> element of elements of the “mdSecType”.
The &lt;binData> element allows the METS &lt;dmdSec>, &lt;techMD>, &lt;rightsMD>, &lt;sourceMD> and &lt;digiprovMD> elements to wrap non-XML content.  For example, by means of the &lt;binData> element, a &lt;dmdSec> could include a full, standard ISO 2709 MARC format record describing the resource represented by the METS document.  In this case, the METS implementer would encode the MARC record in base64 binary format and then wrap this encoding in a dmdSec/mdWrap/binData element.  (Note that an alternative to this approach would be to include an XML encoding that conforms to the MARC 21 XML Schema in an dmdSec/mdWrap/xmlData element).

#### Context 2:  The &lt;FContent> element of a &lt;file> element.
If the digital content represented by a &lt;file> element is not in XML format it can be encoded in a &lt;file> element using the base64 binary format and then wrapping that encoding in a file/Fcontent/binData element. 

## **Elements of anyType:  &lt;stream> and &lt;transformFile>.**
METS has two elements declared as “anyType,” both of which can appear in the context of a &lt;file> element.  These elements can include any attributes in addition to those explicitly defined for the elements.  They can also contain any combination of character data and elements so long as this content is well-formed XML.