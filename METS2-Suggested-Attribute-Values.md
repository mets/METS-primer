This page documents suggested attribute values in METS 2. This list currently includes the allowed values from METS 1.

## `agent@ROLE`

Specifies the function of the agent with respect to the METS record.

Values allowed in METS 1 are:

* `CREATOR`: The person(s) or institution(s) responsible for the METS document.
* `EDITOR`: The person(s) or institution(s) that prepares the metadata for encoding.
* `ARCHIVIST`: The person(s) or institution(s) responsible for the document/collection.
* `PRESERVATION`: The person(s) or institution(s) responsible for preservation functions.
* `DISSEMINATOR`: The person(s) or institution(s) responsible for dissemination functions.
* `CUSTODIAN`: The person(s) or institution(s) charged with the oversight of a document/collection.
* `IPOWNER`: Intellectual Property Owner: The person(s) or institution holding copyright, trade or service marks or other intellectual property rights for the object.

Interpretation of these values is implementation-specific. Other values MAY be used for this attribute in METS 2; their interpretation is also implementation-specific.

## `agent@TYPE`

Used to specify the type of agent.

Values allowed in METS 1 are:

* `INDIVIDUAL`: Use if an individual has served as the agent.
* `ORGANIZATION`: Use if an institution, corporate body, association, non-profit enterprise, government, religious body, etc. has served as the agent.

Interpretation of these values is implementation-specific. Other values MAY be used for this attribute in METS 2; their interpretation is also implementation-specific.

## `area@SHAPE`

An attribute that can be used [as in HTML](https://www.w3.org/TR/2011/WD-html5-20110405/author/the-map-element.html#attr-area-shape) to define the shape of the relevant area within the content file pointed to by the &lt;area&gt; element. Typically this would be used with image content (still image or video frame) when only a portion of the image pertains. If `SHAPE` is specified then `COORDS` MUST also be present. `SHAPE` SHOULD be used in conjunction with `COORDS` in the manner defined for the `shape` and `coords` attributes on an [HTML5 <area> element](https://www.w3.org/TR/2011/WD-html5-20110405/author/the-map-element.html#the-area-element). 

Values allowed in METS 1 are:

* `RECT` 
* `CIRCLE`
* `POLY`

Implementations SHOULD interpret these values as in HTML 5. 
				
Other values MAY be used for this attribute in METS 2; their interpretation is implementation-specific.

## `area@BETYPE`

Begin/End Type: An attribute that specifies the kind of `BEGIN` and/or `END` values that are being used. For example, if `BYTE` is specified, then the `BEGIN` and `END` point values represent the byte offsets into a file. If `IDREF` is specified, then the `BEGIN` element specifies the `ID` value that identifies the element in a structured text file where the relevant section of the file begins; and the `END` value (if present) would specify the `ID` value that identifies the element with which the relevant section of the file ends. 

Values allowed in METS 1 are:

* `BYTE`: An integer byte offset into the referenced file.
* `IDREF`: A reference to an `ID` attribute in the referenced XML file as described in [XML 1.1](https://www.w3.org/TR/2006/REC-xml11-20060816/#id) or referenced HTML as file as described in [HTML 5](https://www.w3.org/TR/2011/WD-html5-author-20110809/global-attributes.html#the-id-attribute).
* `SMIL`: A [SMIL (Synchronized Multimedia Integration Language) time value](https://www.w3.org/TR/SMIL3/smil-timing.html) that would be valid for the SMIL `begin` or `end` attribute.
* `MIDI`: Integer representing delta time within a Standard MIDI File, as described in [Standard MIDI Files 1.0](https://www.midi.org/specifications/file-format-specifications/standard-midi-files) section "Header Chunks".
* `TIME`: a simple time code of the form HH:MM:SS (hours, minutes, and seconds) without reference to any particular frame or sample rate.
* `TCF`: Time Code Format as defined in [AES31-3-2021](https://www.aes.org/publications/standards/search.cfm?docID=32) Annex B
* `XPTR`: an XPointer as described in [XPointer Framework](https://www.w3.org/TR/xptr-framework/)

### SMPTE time codes

The following time values are defined by reference to the [ST 12-1:2008](https://ieeexplore.ieee.org/document/7289820) and [ST 258:2004](https://ieeexplore.ieee.org/document/7291839) SMPTE standards. 

* `SMPTE-25`: SMPTE time code for 25 frame per second material.
* `SMPTE-24`:  SMPTE time code for 24 frame per second material.
* `SMPTE-DF30`: SMPTE time code for 30 frame per second frame material.
* `SMPTE-NDF30`: SMPTE time code for 30 frame per second non-drop material.
* `SMPTE-DF29.97`: SMPTE time code for 29.97 frame per second drop frame material.
* `SMPTE-NDF29.97`: SMPTE time code for 29.97 frame per second non-drop material.

Time codes SHOULD be formatted as in section 8 (Time code) of [ST 258:2004](https://ieeexplore.ieee.org/document/7291839), for example as HH:MM:SS:FF (hours, minutes, seconds, and frames) for a non-drop time code or as HH:MM:SS;FF for a drop frame time code.

### Other values

Other values MAY be used for the `BETYPE` attribute in METS 2; their interpretation is implementation-specific.	

## `LOCTYPE`: `<mptr>`, `<mdRef>`, `<FLocat>`

Specifies the locator type used in the `LOCREF` attribute.

Values allowed in METS 1 are:

* `ARK`
* `URN`
* `URL`
* `PURL`
* `HANDLE`
* `DOI`

Other values MAY be used; their interpretation is implementation-specific.	

## `MDTYPE`: `<mdRef>`, `<mdWrap>`

Used to indicate the type of the associated metadata. Values allowed in METS 1 are:

* `MARC`: any form of MARC record
* `MODS`: metadata in the Library of Congress MODS format
* `EAD`: Encoded Archival Description finding aid
3 5
* `DC`: Dublin Core
* `NISOIMG`: NISO Technical Metadata for Digital Still Images
* `LC-AV`: technical metadata specified in the Library of Congress A/V prototyping project
* `VRA`: Visual Resources Association Core
* `TEIHDR`: Text Encoding Initiative Header
* `DDI`: Data Documentation Initiative
* `FGDC`: Federal Geographic Data Committee metadata
* `LOM`: Learning Object Model
* `PREMIS: PREservation Metadata`: Implementation Strategies
* `PREMIS:OBJECT`: PREMIS Object entiry
* `PREMIS:AGENT`: PREMIS Agent entity
* `PREMIS:RIGHTS`: PREMIS Rights entity
* `PREMIS:EVENT`: PREMIS Event entity
* `TEXTMD`: textMD Technical metadata for text
* `METSRIGHTS`: Rights Declaration Schema

Other values MAY be used; their interpretation is implementation-specific.	

## `CHECKSUMTYPE`: `<mdRef>`, `<mdWrap>`

Specifies the checksum algorithm used to produce the value
contained in the CHECKSUM attribute.

Values allowed in METS 1 are:

* `Adler-32`
* `CRC32`
* `HAVAL`
* `MD5`
* `MNP`
* `SHA-1`
* `SHA-256`
* `SHA-384`
* `SHA-512`
* `TIGER`
* `WHIRLPOOL`

Other values MAY be used; their interpretation is implementation-specific.	