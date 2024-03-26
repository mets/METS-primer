Text only moved from Primer version 1

Reviewers: Andreas

***

# Chapter 4:  Common constructs and standards

XML Technologies and specifications used throughout METS

## XSD ID, IDREF, and IDREFS

METS uses IDREF and IDREFS attributes on numerous elements to establish links between these elements and other elements within the METS document.  In addition, METS uses IDREF mechanisms to establish links between an ``<area>`` element within the METS structMap and elements in a structured text content file.

### Internal cross referencing in METS via ID, IDREF and IDREFS

#### Overview of ID, IDREF and IDREFS datatypes for XML attributes

##### The XSD ID datatype

XML schema provides a built-in ID datatype for the purpose of associating internally unique identifiers with elements in an XML instance document.  Note that an attribute implementing the XML schema ID datatype is ONLY intended to provide a means of assigning a unique identifier to the element with which it is associated.  Attributes of this type are NOT intended to store any kind of external identifier. The following characteristics apply to attributes implementing the XSD ID datatype.

* An XML schema or DTD can declare one and only one attribute of type ID in conjunction with each element declared by the schema.
* Values assigned to attributes of the ID type in an instance document must begin with a letter or underscore (not a digit), and can only contain letters, digits, periods, hyphens and underscores.
* Values assigned to attributes of the ID type in an instance document must be unique within the document and across elements from all the namespaces represented in the document.

##### The XSD IDREF and IDREFS datatypes
XML schema provides two built in datatypes for creating cross references from one element in an instance document to another element or elements in the same document. An attribute of type IDREF associated with an element can cite the ID value that identifies another element in the same instance document.  In other words, an attribute of type IDREF creates a cross reference from the source element with which it's associated to another element in the same instance document by citing the ID value that identifies the target element. An attribute of type IDREFS works in the same manner, but can contain multiple space delimited ID values, each of which identifies a different element in the same instance document.  So an attribute of type IDREFS creates cross references from the source element with which it is associated to multiple other elements in the same instance document by citing the ID values that identify the target elements.  The concrete examples of the application of IDREF and IDREFS attributes in METS that appear in the section immediately below should help clarify the IDREF/ID cross referencing mechanisms.

#### Cross-referencing in METS

METS makes extensive provisions for using attributes of the ID, IDREF and IDREFS datatypes to create cross-references between related elements.  Ultimately, these provisions allow units of information appearing in dispersed locations across a METS instance document to be linked to all of their appropriate contexts without redundancy.  METS elements of the mdType and fileType datatypes have required ID attributes which allow the metadata and content file elements that implement these datatypes to be referenced from the other parts of the METS instance document to which they pertain.  In addition to this, ``<div>`` elements in the ``<structMap>`` and many other elements can include ID attribute values that allow them to be referenced by other elements.  METS’ specific cross-referencing provisions for different contexts follow.

**_Context 1: ``<md>`` metadata_**

* A unique ID attribute value must identify each ``<md>`` element in a METS instance document.
* Each of the following elements can reference one or more specific ``<md>`` elements by citing their ID values in its MDID attribute (the MDID attribute is of IDREFS type):
  * mets/metsHdr
  * mets/mdSec/md
  * mets/fileSec/fileGrp
  * mets/fileSec/fileGrp/file
  * mets/fileSec/fileGrp/file/stream 
  * mets/structMap/div
  * mets/structMap/div/fptr//area
  
_Example 1: Descriptive metadata_

In the example below the ID attribute value of “MD1” identifies the single ``<md>`` element.  The root `<div>` in the `<structMap>` references this `<md>` by means of its MDID attribute. Thus the encoding indicates that the descriptive metadata in the `<md>` identified by the ID value “MD1” applies to the entire content as represented by the root `<div>` in the `<structMap>`.

```xml
<mets:mets
    xmlns:mets="http://www.loc.gov/METS/v2" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/METS/v2 https://github.com/mets/METS-schema/raw/mets2/v2/mets.xsd http://www.loc.gov/mods/v3 http://www.loc.gov/mods/v3/mods-3-1.xsd"
    OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
    
    <mets:mdSec>
        <mets:md ID="MD1">
            <mets:mdWrap MDTYPE="MODS">
                <mets:xmlData>
                    <mods:mods>
                        <mods:titleInfo>
                            <mods:title>Martial Epigrams</mods:title>
                        </mods:titleInfo>
                    </mods:mods>
                </mets:xmlData>
            </mets:mdWrap>
        </mets:md>
    </mets:mdSec>
    <mets:structSec>
        <mets:structMap TYPE="physical">
            <mets:div TYPE="book" LABEL="Martial Epigrams II" MDID="MD1"/>
        </mets:structMap>
    </mets:structSec>
</mets:mets>
```

_Example 2: Administrative metadata_ 
In the example below the ID attribute value of “App4ADM1” identifies the first `<md>` element and the ID value “App4ADM2” identifies the second `<md>` element.  The MDID attribute on the single `<file>` element in the `<fileSec>` references both of these ID values (“App4ADM1 App4ADM2”). Thus the encoding indicates that both the technical metadata in the first `<md>` element identified by the ID value “App4ADM1” and the rights metadata in the second `<md>` element identified by the ID value “App4ADM2” apply to the content file represented by the `<file>` element.

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:rts="http://cosimo.stanford.edu/sdr/metsrights/" xmlns:mix="http://www.loc.gov/mix/v20"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/METS/v2 https://github.com/mets/METS-schema/raw/mets2/v2/mets.xsd 
        http://cosimo.stanford.edu/sdr/metsrights/  https://www.loc.gov/standards/rights/METSRights.xsd
        http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-1.xsd
        http://www.loc.gov/mix/v20 http://www.loc.gov/standards/mix/mix.xsd"
    OBJID="ark:/13030/hb3c6005tv" TYPE="still image" LABEL="S. P. [Simmon Peña] Storms, Interpreter [&amp;c], Indian agency - near Grass Valley, California, 1851"
    PROFILE="http://www.loc.gov/standards/mets/profiles/0000000X.xml">
    <mets:mdSec>
        <mets:md ID="App4ADM1">
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
                            <mix:ImageProducer>DIL/U.C. Berkeley Library </mix:ImageProducer>
                            <mix:DeviceSource>reflection print scanner </mix:DeviceSource>
                            <mix:ScanningSystemCapture>
                                <mix:ScanningSystemHardware>
                                    <mix:ScannerManufacturer>Epson </mix:ScannerManufacturer>
                                    <mix:ScannerModel>
                                        <mix:ScannerModelName>836xl </mix:ScannerModelName>
                                        <mix:ScannerModelSerialNo>B05401003MG9601009 </mix:ScannerModelSerialNo>
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
        </mets:md>
        <mets:md ID="App4ADM2">
            <mets:mdWrap MDTYPE="METSRights">
                <mets:xmlData>
                    <rts:RightsDeclarationMD RIGHTSCATEGORY="OTHER" OTHERCATEGORYTYPE="UNKNOWN">
                        <rts:RightsHolder>
                            <rts:RightsHolderComments>All requests to reproduce, publish, quote from, or otherwise use collection materials must be submitted in writing to the Head of Access Services,
                                The Bancroft Library, University of California, Berkeley 94720-6000. Consent is given on behalf of The Bancroft Library as the owner of the physical items and does not
                                constitute permission from the copyright owner. Such permission must be obtained from the copyright owner. See: http:// bancroft.berkeley.edu/reference/
                                permissions.html </rts:RightsHolderComments>
                        </rts:RightsHolder>
                        <rts:Context CONTEXTCLASS="GENERAL PUBLIC">
                            <rts:Constraints>
                                <rts:ConstraintDescription>Copyright status unknown. Some materials in these collections may be protected by the U.S. Copyright Law (Title 17, U.X.C.). In addition, the
                                    reproduction of some materials may be restricted by terms of University of California gift or purchase agreements, donor restrictions, privacy and publicity rights,
                                    licensing and trademarks. Transmission or reproduction of materials protected by copyright beyond that allowed by fair use requires the written permission of
                                    copyright owners. Works not in the public domain cannot be commercially exploited without permission of the copyright owner. Responsibility for any use rests
                                    exclusively with the user. </rts:ConstraintDescription>
                            </rts:Constraints>
                        </rts:Context>
                    </rts:RightsDeclarationMD>
                </mets:xmlData>
            </mets:mdWrap>
        </mets:md>
    </mets:mdSec>
    <mets:fileSec>
        <mets:fileGrp VERSDATE="2003-01-22T00:00:00.0" USE="archive image">
            <mets:file ID="App4FID1" MIMETYPE="image/tiff" SEQ="1" CREATED="2003-01-22T00:00:00.0" MDID="App4ADM1 App4ADM2" GROUPID="GID1">
                <mets:FLocat LOCREF="http://offlineimage/calcultures/ucb/cubanc_1_2_00004722a.tif" LOCTYPE="URL"/>
            </mets:file>
        </mets:fileGrp>
    </mets:fileSec>
    <mets:structSec>
        <mets:structMap TYPE="physical">
            <mets:div ORDER="1" TYPE="still image" LABEL="S. P. [Simmon Peña] 
        		 Storms, Interpreter [&#x26;c], Indian agency - near Grass Valley, 
        		 California, 1851">
                <mets:fptr FILEID="App4FID1"/>
            </mets:div>
        </mets:structMap>
    </mets:structSec>
</mets:mets>
```

**_Context 2: `<file>` content files_**

* A unique ID attribute value must identify each `<file>` element in the `<fileSec>` of a METS document.
* Each of the following elements can reference the specific `<file>` pertinent to it by citing the `<file>` element’s ID value in its FILEID attribute. (The FILEID attribute is of type IDREF).
  * mets/structMap/div/fptr
  * mets/structMap/div/fptr/area
  * mets/structMap/div/fptr/seq/area
  * mets/structMap/div/fptr/par/area
  * mets/structMap/div/fptr/par/seq/area

_Example_
The _Example 2_ of the previous usage context immediately above also demonstrates the current context.  In that example, the ID attribute value of “App4FID1” identifies the single `<file>` element.  The single `<fptr>` element under the root `<div>` of the `<structMap>` references this ID value.  Thus the encoding indicates that the content file represented by the `<file>` element with an ID value of “App4FID1” manifests the root `<div>` element.

### External referencing using IDREF/ID links

#### Provisions for referencing specific elements in external, structured text content and metadata files from METS by means of ID attribute values declared in these external files

Several structured text languages — such as XML, SGML, and HTML — allow identifiers to be associated with individual elements by means of attributes that implement the XML ID datatype.  This has already been described above with respect to XML in general and METS in particular.  METS makes two provisions for referencing specific elements in external, structured text document.  

#### Use of BEGIN, END, and BETYPE to reference IDs in structured text content files.

Through its descendant `<fptr>`, `<area>`, `<par>` and `<seq>` elements, a `<div>` in the `<structMap>` can point to the `<file>` element or elements in the `<fileSec>` representing the content that manifests the `<div>`. Sometimes, however, only a portion of the integral content represented by the referenced `<file>` element is pertinent.  If the content represented by the `<file>` element is encoded in XML, SGML, or HTML and the key elements of the content file have associated ID attribute values, a METS `<area>` element can use these ID values to isolate the relevant portion of the content file.  In this case, the `<area>`'s BEGIN attribute would cite the ID attribute value of the first pertinent element in the indicated content file; the `<area>`'s END attribute would cite the ID value of the last pertinent element in the indicated content file; and the BETYPE attribute value would be "IDREF" to indicate that ID values were being used to identify the bounding elements defining the relevant section of the content file.

_Example_

In the example below, which is an excerpt from a longer encoding, the second `<div>` element in the `<structMap>` uses the `<area>` element’s BEGIN, END and BETYPE attributes to isolate just the relevant portion of a TEI content file that manifests the `<div>`.  The `<div>` represents a single, dated entry in the diary; and the `<area>` element associates this `<div>` with just the portion of the integral TEI encoding that begins with the TEI element identified by the ID attribute value “entry1” and ends with the TEI element identified by the ID attribute value “entry1end.”

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2" xmlns:mods="http://www.loc.gov/mods/" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/METS/v2 https://github.com/mets/METS-schema/raw/mets2/v2/mets.xsd" OBJID="ark:/13030/kt9s2010hz" TYPE="text"
    LABEL="[Patrick Breen Diary November 20, 1846 - March 1, 1847]" PROFILE="http://www.loc.gov/mets/profiles/00000005.xml">
    <mets:mdSec>
        <mets:md ID="DMD1">
            <mets:mdRef LABEL="Patrick Breen Papers" LOCREF="http://sunsite2.berkeley.edu/cgi-bin/oac/calher/breenpapers" LOCTYPE="URL" MDTYPE="EAD"/>
        </mets:md>
    </mets:mdSec>
    <mets:fileSec>
        <mets:fileGrp VERSDATE="1998-12-04T00:00:00" USE="text/tei">
            <mets:file ID="FID1" MIMETYPE="text/sgml" SEQ="1" CREATED="1998-12-04T00:00:00" GROUPID="GID1">
                <mets:FLocat LOCREF="http://sunsite.berkeley.edu/~jmcdonou/BREEN/sgml/breen2.sgm" LOCTYPE="URL"/>
            </mets:file>
        </mets:fileGrp>
    </mets:fileSec>
    <mets:structSec>
        <mets:structMap TYPE="logical">
            <mets:div LABEL="Patrick Breen Diary: Donner passage" MDID="DMD1">
                <mets:div TYPE="entry" LABEL="Friday Nov. 20th 1846">
                    <mets:fptr>
                        <mets:area FILEID="FID1" BETYPE="IDREF" BEGIN="entry1" END="entry1end"/>
                    </mets:fptr>
                </mets:div>
            </mets:div>
        </mets:structMap>
    </mets:structSec>
</mets:mets>
```

### Referencing METS elements from external documents
Each element defined in the METS schema for use in a METS instance document has an associated ID attribute.  In general, except for the few cases noted above, this ID attribute is optional. However, an ID attribute value can be assigned to identify any METS element in an instance document any time it might be necessary to provide a handle to which this element can be referred to unambiguously from outside the METS document.  The implementers of the METS schema did not attempt to anticipate the specific applications in which such handles might be necessary or useful, but simply attempted to ensure that the necessary ID infrastructure was in place to support such element referencing wherever a need might arise.

### IDREF/ID linking across different namespaces
As is described above, the elements of the `mdType` has a required ID attributes.  The unique identifier values assigned to this attribute allow these elements to be referenced from the MDID attributes that are associated with `<file>` and `<div>` elements. The mdType elements can all include metadata in the form of elements drawn from other namespaces in their `<xmlData>` sections. And in cases where the elements drawn from other namespaces for populating the `<xmlData>` sections themselves have ID attributes, as is the case with some elements drawn from the MODS and VRACORE namespaces, the MDID attribute can reference identifier values assigned to these ID attributes instead of or in addition to the values assigned to ID attributes in the top level `mdType` element (e.g., `<md>`).

_Example_

The example below includes a `<md>` with very abbreviated VRA encoded descriptive metadata.  These metadata include a description of a print series, a description of a single print from this series, and descriptions of multiple images.  The various other parts of the METS document reference the pertinent sections of the VRA encoding by citing ID values identifying elements in the VRA namespace.  For example, each `<file>` element in the `<fileSec>` uses its MDID attribute to cite the ID attribute value that identifies the `<vra:image>` element that describes it. The root `<div>` element in the mets `<structMap>` uses its MDID attribute to cite the ID attribute value that identifies the `<vra:work>` element that describes the print series as a whole; and the `<div>` that is the immediate child of the root `<div>` element, and which represents a single print from the series, uses its MDID attribute to cite the ID attribute value that identifies the `<vra:work>` element that describes the individual print.

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2" xmlns:vra="http://www.vraweb.org/vracore4.htm" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/METS/v2 https://github.com/mets/METS-schema/raw/mets2/v2/mets.xsd http://www.vraweb.org/vracore4.htm https://www.loc.gov/standards/vracore/vra-strict-20171101.xsd"
    OBJID="ark:/13030/kt9s2009hz" LABEL="Los Caprichos">
    <mets:mdSec>
        <mets:md ID="MD1">
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
                                <vra:title type="creator" pref="true" xml:lang="es">Los 
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
                                    <vra:role vocab="AAT" refid="300025164">printmaker
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
                                <vra:title type="creator" pref="true" xml:lang="es">El Sueño de 
        							 la Razon Produce Monstruos</vra:title>
                                <vra:title type="translated" pref="true" xml:lang="en">The 
        							 Sleep of Reason Produces Monsters</vra:title>
                            </vra:titleSet>
                        </vra:work>
                        <vra:image id="IMAGE1">
                            <vra:measurementsSet>
                                <vra:display>349 x 520 pixels</vra:display>
                                <vra:measurements type="width" unit="pixels" extent="overall">349</vra:measurements>
                                <vra:measurements type="height" unit="pixels" extent="overall">520</vra:measurements>
                            </vra:measurementsSet>
                            <vra:titleSet>
                                <vra:display>Full view</vra:display>
                                <vra:title type="descriptive">Full view</vra:title>
                            </vra:titleSet>
                        </vra:image>
                        <vra:image id="IMAGE2">
                            <vra:measurementsSet>
                                <vra:display>459 x 683 pixels</vra:display>
                                <vra:measurements type="width" unit="pixels" extent="overall">459</vra:measurements>
                                <vra:measurements type="height" unit="pixels" extent="overall">683</vra:measurements>
                            </vra:measurementsSet>
                            <vra:titleSet>
                                <vra:display>Large full view</vra:display>
                                <vra:title type="descriptive">Large full view</vra:title>
                            </vra:titleSet>
                        </vra:image>
                        <vra:image id="IMAGE3">
                            <vra:measurementsSet>
                                <vra:display>111 x 165 pixels</vra:display>
                                <vra:measurements type="width" unit="pixels" extent="overall">111</vra:measurements>
                                <vra:measurements type="height" unit="pixels" extent="overall">165</vra:measurements>
                            </vra:measurementsSet>
                            <vra:titleSet>
                                <vra:display>Thumbnail view</vra:display>
                                <vra:title type="descriptive">Thumbnail view</vra:title>
                            </vra:titleSet>
                        </vra:image>
                    </vra:vra>
                </mets:xmlData>
            </mets:mdWrap>
        </mets:md>
    </mets:mdSec>
    <mets:fileSec>
        <mets:fileGrp USE="Full view">
            <mets:file ID="FID1" MIMETYPE="image/jpg" MDID="IMAGE1">
                <mets:FLocat LOCREF="http://www.museum.cornell.edu/HFJ/permcoll/pdp/img_pr/monstros_l.jpg" LOCTYPE="URL"/>
            </mets:file>
        </mets:fileGrp>
        <mets:fileGrp USE="Large full view">
            <mets:file ID="FID2" MIMETYPE="image/jpg" MDID="IMAGE2">
                <mets:FLocat LOCREF="http://www.museum.cornell.edu/HFJ/permcoll/pdp/img_pr/monstros_X.jpg" LOCTYPE="URL"/>
            </mets:file>
        </mets:fileGrp>
        <mets:fileGrp USE="Thumbnail view">
            <mets:file ID="FID3" MIMETYPE="image/jpg" MDID="IMAGE3">
                <mets:FLocat LOCREF="http://www.museum.cornell.edu/HFJ/permcoll/pdp/img_pr/monstros_s.jpg" LOCTYPE="URL"/>
            </mets:file>
        </mets:fileGrp>
    </mets:fileSec>
    <mets:structSec>
        <mets:structMap TYPE="physical">
            <mets:div TYPE="intaglio print series" LABEL="Los Caprichos" MDID="WORK1">
                <mets:div TYPE="intaglio print" LABEL="El Sueño de la Razon Produce Monstruos (The Sleep of Reason Produces Monsters)" MDID="WORK2">
                    <mets:fptr FILEID="FID1"/>
                    <mets:fptr FILEID="FID2"/>
                    <mets:fptr FILEID="FID3"/>
                </mets:div>
            </mets:div>
        </mets:structMap>
    </mets:structSec>
</mets:mets>
```

## Linking to external resources.

METS uses its own attributes to provide links to external resources from elements within METS.  Specifically, the LOCREF attribute is used to specify the URL of the pertinent external resource; and the LOCTYPE can be used to specify or associate pertinent metadata with the specified xlink:href link.  These attributes can be used in two main contexts in METS.

**_Context 1: The `<mdRef>` sub-element in elements of mdType_**

The `<mdRef>` element in `<md>` elements uses LOCREF attribute to point to the external resource containing the pertinent metadata.

_Example_

In the `<mdSec>` below, the LOCREF attribute cites a URL that identifies the location of an external, EAD based description.

```xml
<mets:mdSec>
    <mets:md ID="DMD1">
        <mets:mdRef LABEL="Patrick Breen Papers" LOCREF="http://sunsite2.berkeley.edu/cgi-bin/oac/calher/breenpapers#xyzj0098" LOCTYPE="URL" MDTYPE="EAD"/>
    </mets:md>
</mets:mdSec>
```

**_Context 2: The `<FLocat>` sub-element of the `<file>` elements in the `<fileSec>`_**

The `<FLocat>` element uses an xlink:href attribute to point to the pertinent content file in its external location.  The other XLink simpleLink attributes can be used to describe this link.  


_Example_

In the example below, the LOCREF attribute uses a URL to identify the location of the pertinent external content file. 

```xml
<mets:fileGrp USE="Full view">
  <mets:file ID="FID1" MIMETYPE="image/jpg" MDID="IMAGE1">
    <mets:FLocat LOCREF="http://www.museum.cornell.edu/HFJ/permcoll/pdp/img_pr/monstros_l.jpg" LOCTYPE="URL"/>
  </mets:file>
</mets:fileGrp>
```

## Wrapping metadata and digital content in METS

METS provides a means both for wrapping metadata conforming to externally defined formats and for wrapping digital content of any type directly in a METS object. It accomplishes this through its `<xmlData>` and `<binData>` elements.  These elements can occur in different contexts as is described below.

### `<xmlData>`

#### Namespace concepts and `<xmlData>`

* Any XML schema can declare a target namespace. This takes the form of a URI intended to serve as a unique identifier for the specific context represented by the schema.  For example, the target namespace declared by the METS2 schema is `http://www.loc.gov/METS/v2`
* An element declared in a particular schema can be unambiguously referenced in any xml context by first identifying the target namespace from which the element is being drawn and then specifying the name of the element.  Often an instance document accomplishes this by associating a different prefix with the URI for each target namespace it declares, and then using the appropriate prefix in combination with each element name appearing in the document to identify the namespace from which the element is drawn.  For example, once an instance document has associated the prefix “mods” with the namespace identified by the URI `http://www.loc.gov/mods/v3` it can use `<mods:titleInfo>` unambiguously to reference the `<titleInfo>` element as it is declared in version 3 of the MODS schema.
* The target namespace URI is an identifier, and is not necessarily resolvable.  It does not specify the location of a schema that implements the namespace context that it identifies.  XML documents, however, can associate each namespace context they declare with a specific schema and location by means of a schemaLocation attribute.  Doing this allows an XML parser/validator to check all of the elements in an XML document against the specific schemas in which they are declared.
* Some schema, such as METS, allow instance documents conforming to the schema to use elements declared in any external namespaces or in no namespace in certain contexts. The METS `<xmlData>` elements provide such contexts.

#### METS `<xmlData>` elements

METS `<xmlData>` elements serve as wrappers for xml content whose constituent elements may be drawn from any namespace or from no namespace.  The `<xmlData>` elements specify a “processContents” directive of `lax`,  which means that an xml validator will check the xml elements appearing within the `<xmlData>` element for validity if and only if the METS instance document declares the namespace that governs the elements and specifies a valid schemaLocation for a schema that implements the namespace.  If a namespace is not declared for the elements, or if the governing schema cannot be found, then an XML validator will check the xml within the `<xmlData>` element for well-formedness, but not for validity.

`<xmlData>` elements as described above appear in the following contexts in METS:

**_Context 1: The `<mdWrap>` elements of the `mdType`_**

Typically in this context, the `<xmlData>` element would contain elements from an xml-based descriptive or administrative metadata format such as MODS, MARCXML, DC, VRA, MIX or PREMIS etc.

**_Context 2: `<FContent>` elements associated with `<file>` elements in the `<fileSec>`_**

If the digital content represented by a `<file>` element is in XML format, and a METS implementer wishes to incorporate that content directly in the `<file>` element, then the XML comprising the content can appear directly in a `FContent/xmlData` element.

### `<binData>`

The METS `<binData>` elements serve as wrappers for base64 encoded binary content.  METS implementers would use this element when they wish to include non-xml metadata or digital content directly in the METS document.

A `<binData>` element as described above can appear in each of the following contexts.

**_Context 1: The `<mdWrap>` element of elements of the `mdType`_**

The `<binData>` element allows the METS `<md>` element to wrap non-XML content.  For example, by means of the `<binData>` element, an `<md>` could include a full, standard ISO 2709 MARC format record describing the resource represented by the METS document.  In this case, the METS implementer would encode the MARC record in base64 binary format and then wrap this encoding in a `mdSec/md/mdWrap/binData` element.  (Note that an alternative to this approach would be to include an XML encoding that conforms to the MARC 21 XML Schema in an `mdSec/md/mdWrap/xmlData` element).

**_Context 2:  The `<FContent>` element of a `<file>` element_**

If the digital content represented by a `<file>` element is not in XML format it can be encoded in a `<file>` element using the base64 binary format and then wrapping that encoding in a `file/FContent/binData` element. 

## Elements of anyType: `<stream>` and `<transformFile>`
METS has two elements declared as `anyType`, both of which can appear in the context of a `<file>` element.  These elements can include any attributes in addition to those explicitly defined for the elements.  They can also contain any combination of character data and elements so long as this content is well-formed XML.
