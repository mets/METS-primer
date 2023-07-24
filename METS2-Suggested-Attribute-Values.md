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

An attribute that can be used [as in HTML](https://www.w3.org/TR/2011/WD-html5-20110405/author/the-map-element.html#attr-area-shape) to define the shape of the relevant area within the content file pointed to by the &lt;area&gt; element. Typically this would be used with image content (still image or video frame) when only a portion of the image pertains. If `SHAPE` is specified then `COORDS` MUST also be present. `SHAPE` SHOULD be used in conjunction with `COORDS` in the manner defined for the `shape` and `coords` attributes on an [HTML5 <area> element](https://www.w3.org/TR/2011/WD-html5-20110405/author/the-map-element.html#the-area-element). `SHAPE` MAY contain one of the following values:

* `RECT` 
* `CIRCLE`
* `POLY`

Implementations SHOULD interpret these values as in HTML 5. 
				
Other values MAY be used for this attribute in METS 2; their interpretation is implementation-specific.

## `area@BETYPE`

Begin/End Type: An attribute that specifies the kind of `BEGIN` and/or `END` values that are being used. For example, if `BYTE` is specified, then the `BEGIN` and `END` point values represent the byte offsets into a file. If `IDREF` is specified, then the `BEGIN` element specifies the `ID` value that identifies the element in a structured text file where the relevant section of the file begins; and the `END` value (if present) would specify the `ID` value that identifies the element with which the relevant section of the file ends. May be one of the following values: 

* `BYTE`: An integer byte offset into the referenced file.
* `IDREF`: A reference to an `ID` attribute in the referenced XML file as described in [XML 1.1](https://www.w3.org/TR/2006/REC-xml11-20060816/#id) or referenced HTML as file as described in [HTML 5](https://www.w3.org/TR/2011/WD-html5-author-20110809/global-attributes.html#the-id-attribute).
* `SMIL`: A [SMIL (Synchronized Multimedia Integration Language) time value](https://www.w3.org/TR/SMIL3/smil-timing.html) that would be valid for the SMIL `begin` or `end` attribute.
* `MIDI`: Integer representing delta time within a MIDI file in [Standard MIDI file (SMF) format](https://www.midi.org/specifications/file-format-specifications/standard-midi-files), as described in Standard MIDI Files 1.0 section "Header Chunks".
* `TIME`: a simple time code of the form HH:MM:SS
* `TCF`: Time Code Format.
* `XPTR`: an XPointer as described in [XPointer Framework](https://www.w3.org/TR/xptr-framework/)

The following time values are defined by reference to the [ST 12-1:2008 SMPTE standard](https://ieeexplore.ieee.org/document/7289820)

* `SMPTE-25`: SMPTE time code for 25 frame per second material.
* `SMPTE-24`:  SMPTE time code for 24 frame per second material.
* `SMPTE-DF30`: SMPTE time code for 30 frame per second frame material.
* `SMPTE-NDF30`: SMPTE time code for 30 frame per second non-drop material.
* `SMPTE-DF29.97`: SMPTE time code for 29.97 frame per second drop frame material.
* `SMPTE-NDF29.97`: SMPTE time code for 29.97 frame per second non drop material.


Other values MAY be used for this attribute in METS 2; their interpretation is implementation-specific.	

## `LOCTYPE`: `<mptr>`, `<mdRef>`, `<FLocat>`
## `MDTYPE`: `<mdRef>`, `<mdWrap>`
## `CHECKSUMTYPE`: `<mdRef>`, `<mdWrap>`
