This page documents suggested attribute values and their interpretation in METS 2. This list currently includes the allowed values from METS 1.

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in BCP 14 [[RFC2119](https://www.rfc-editor.org/rfc/rfc9457.html#RFC2119)] [[RFC8174](https://www.rfc-editor.org/rfc/rfc9457.html#RFC8174)] when, and only when, they appear in all capitals, as shown here.

## `agent@ROLE`

Specifies the function of the agent with respect to the METS record.

Values allowed from METS 1 are:

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

Values allowed from METS 1 are:

* `INDIVIDUAL`: Use if an individual has served as the agent.
* `ORGANIZATION`: Use if an institution, corporate body, association, non-profit enterprise, government, religious body, etc. has served as the agent.

Interpretation of these values is implementation-specific. Other values MAY be used for this attribute in METS 2; their interpretation is also implementation-specific.

## `area@SHAPE`

An attribute that can be used [as in HTML](https://www.w3.org/TR/2011/WD-html5-20110405/author/the-map-element.html#attr-area-shape) to define the shape of the relevant area within the content file pointed to by the &lt;area&gt; element. Typically this would be used with image content (still image or video frame) when only a portion of the image pertains. If `SHAPE` is specified then `COORDS` MUST also be present. `SHAPE` SHOULD be used in conjunction with `COORDS` in the manner defined for the `shape` and `coords` attributes on an [HTML5 <area> element](https://www.w3.org/TR/2011/WD-html5-20110405/author/the-map-element.html#the-area-element). 

Values allowed from METS 1 are:

* `RECT` 
* `CIRCLE`
* `POLY`

Implementations SHOULD interpret these values as in HTML 5. 
				
Other values MAY be used for this attribute in METS 2; their interpretation is implementation-specific.

## `area@BETYPE`

Begin/End Type: An attribute that specifies the kind of `BEGIN` and/or `END` values that are being used. For example, if `BYTE` is specified, then the `BEGIN` and `END` point values represent the byte offsets into a file. If `IDREF` is specified, then the `BEGIN` element specifies the `ID` value that identifies the element in a structured text file where the relevant section of the file begins; and the `END` value (if present) would specify the `ID` value that identifies the element with which the relevant section of the file ends. 

Values allowed from METS 1 are:

* `BYTE`: An integer byte offset into the referenced file.
* `IDREF`: A reference to an `ID` attribute in the referenced XML file as described in [XML 1.1](https://www.w3.org/TR/2006/REC-xml11-20060816/#id) or referenced HTML as file as described in [HTML 5](https://www.w3.org/TR/2011/WD-html5-author-20110809/global-attributes.html#the-id-attribute).
* `SMIL`: A [SMIL (Synchronized Multimedia Integration Language) time value](https://www.w3.org/TR/SMIL3/smil-timing.html) that would be valid for the SMIL `begin` or `end` attribute.
* `MIDI`: Integer representing delta time within a Standard MIDI File, as described in [Standard MIDI Files 1.0](https://www.midi.org/specifications/file-format-specifications/standard-midi-files) section "Header Chunks".
* `TIME`: [ISO 8601 extended 24-hour time format](https://en.wikipedia.org/wiki/ISO_8601#Times) `HH:MM:SS[.ss]` (hours, minutes, seconds, fractional seconds), without reference to any particular frame or sample rate.
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

## `area@EXTTYPE`

Extent type: An attribute that specifies the kind of EXTENT values that are being used. For example if BYTE is specified then EXTENT would represent a byte count. If TIME is specified the EXTENT would represent a duration of time.

Values allowed from METS 1 are any of the values for `BETYPE` except for `IDREF` and `XPTR`.

Other values MAY be used for the `EXTTYPE` attribute in METS 2; their interpretation is implementation-specific.	

## `LOCTYPE`: `<mptr>`, `<mdRef>`, `<FLocat>`

Specifies the locator type used in the `LOCREF` attribute.

Values allowed from METS 1 are:

* `ARK`: An [Archival Resource Key](https://arks.org/). This SHOULD be a resolvable URL that includes a name mapping authority as described in [ARK anatomy](https://arks.org/about/), rather than a bare identifier of the form `ark:/.../...`.
* `URN`: A [Uniform Resource Name](https://datatracker.ietf.org/doc/html/rfc8141), that is, a URI that uses the `urn:` scheme.
* `URL`: Any [Uniform Resource Locator](https://url.spec.whatwg.org/) not covered by another listed category. Relative URLs MUST be resolved as in [Section 5 of RFC3986](https://datatracker.ietf.org/doc/html/rfc3986#section-5). METS does not provide a mechanism for embedding a base URI, so base URIs will typically be resolved either by the URI used to retrieve the METS document ([section 5.1.3](https://datatracker.ietf.org/doc/html/rfc3986#section-5.1.3)) or via an application-specific default ([section 5.1.4](https://datatracker.ietf.org/doc/html/rfc3986#section-5.1.4))
* `PURL`: A persistent URL, such as those created by [Internet Archive](https://purl.archive.org/help) or the [Government Publishing Office](https://purl.access.gpo.gov/), which does not fall into any more specific category of persistent identifier.
* `HANDLE`: A persistent URL resolvable via [handle.net](https://handle.net/). This SHOULD be a resolvable URL that includes the `https://handle.net/` prefix.
* `DOI`: A Digital Object Identifier as described in ISO 26324. This SHOULD be a resolvable URL that includes the `https://doi.org/` prefix.

Other values MAY be used; their interpretation is implementation-specific. In METS 2 (unlike METS 1), other types of locators or identifiers besides URIs MAY be used.

## `MDTYPE`: `<mdRef>`, `<mdWrap>`

Used to indicate the type of the associated metadata. Metadata included or linked to by METS files is typically (but is not required to be) formatted as XML.

Values allowed in METS 1 are:

* `MARC`: MAchine-Readable Cataloging (MARC) record, typically as [MARC-XML](https://www.loc.gov/standards/marcxml/); may also be used for MARC21 binary data as specified by [ISO 2709:2008](https://www.iso.org/standard/41319.html) or for MARC expressed as JSON (commonly-used, but not standardized).
* `MODS`: [Metadata Object Description Schema](https://www.loc.gov/standards/mods/) metadata
* `EAD`: [Encoded Archival Description](https://www.loc.gov/ead/) finding aid
* `DC`: [Dublin Core](https://www.dublincore.org/) metadata, typically using the [simple or qualified Dublin Core XML schemas](https://www.dublincore.org/schemas/xmls/)
* `NISOIMG`: NISO Technical Metadata for Digital Still Images, typically using the [MIX XML schema](https://www.loc.gov/standards/mix/)
* `LC-AV`: [AudioMD and VideoMD technical metadata](https://www.loc.gov/standards/amdvmd/index.html)
* `VRA`: [Visual Resources Association Core](https://www.loc.gov/standards/vracore/) metadata
* `TEIHDR`: [Text Encoding Initiative Header](https://tei-c.org/release/doc/tei-p5-doc/en/html/HD.html)
* `DDI`: [Data Documentation Initiative](https://ddialliance.org/Specification/) metadata
* `FGDC`: Federal Geographic Data Committee (FGDC) [Content Standard for Digital Geospatial Metadata](https://www.fgdc.gov/metadata/csdgm-standard) (CSDGM)
* `LOM`: [IEEE 1484.12.1](https://standards.ieee.org/ieee/1484.12.1/7699/) Learning Object metadata
* `PREMIS`: [PREservation Metadata: Implementation Strategies](https://www.loc.gov/standards/premis/) (PREMIS)
* `PREMIS:OBJECT`: PREMIS Object entity
* `PREMIS:AGENT`: PREMIS Agent entity
* `PREMIS:RIGHTS`: PREMIS Rights entity
* `PREMIS:EVENT`: PREMIS Event entity
* `TEXTMD`: [textMD Technical metadata for text](https://www.loc.gov/standards/textMD/)
* `METSRIGHTS`: [METS Rights Schema](https://www.loc.gov/standards/rights/METSRights.xsd)

Other values MAY be used; their interpretation is implementation-specific.

(To add: [AES-EBU metadata](https://www.aes.org/tmpFiles/aessc/20230815/aes60id-2020-i.pdf), [ISO Geospatial Metadata](https://www.fgdc.gov/metadata/iso-standards), ...?)

## `CHECKSUMTYPE`: `<mdRef>`, `<mdWrap>`

Specifies the checksum algorithm used to produce the value
contained in the CHECKSUM attribute.

Values allowed in METS 1 are:

* `Adler-32` as specified by [RFC1950](https://datatracker.ietf.org/doc/html/rfc1950) for the compressed ZLIB data format.
* `CRC32` as specified by [ISO 3309](https://www.iso.org/standard/8561.html) and implemented by zip, gzip, bzip2, png, the POSIX cksum utility, etc.
* `HAVAL` as specified by [Zheng, Pieprzyk, and Seaberry](https://web.archive.org/web/20150111210116/http://labs.calyptix.com/haval.php)
* `MD5` as specified by [RFC1321](https://datatracker.ietf.org/doc/html/rfc1321)
* `MNP` Microcom Networking Protocols
* `SHA-1` as specified by [FIPS 180-4](https://csrc.nist.gov/pubs/fips/180-4/upd1/final)
* `SHA-256` as specified by [FIPS 180-4](https://csrc.nist.gov/pubs/fips/180-4/upd1/final)
* `SHA-384` as specified by [FIPS 180-4](https://csrc.nist.gov/pubs/fips/180-4/upd1/final)
* `SHA-512` as specified by [FIPS 180-4](https://csrc.nist.gov/pubs/fips/180-4/upd1/final)
* `TIGER` as specified by [Anderson and Biham](https://www.cl.cam.ac.uk/~rja14/Papers/tiger.pdf)
* `WHIRLPOOL` as specified by [ISO/IEC 10118-3](https://www.iso.org/standard/67116.html)

All checksums SHOULD be encoded as hexadecimal digits (rather than as Base64 or some other binary encoding). For example, an MD5 checksum would appear as `CHECKSUMTYPE="MD5" CHECKSUM="68b329da9893e34099c7d8ad5cb9c940"`

Interoperable implementations of METS SHOULD be able to verify checksums using `CRC32`, `MD5`, `SHA-1`, `SHA-256`, `SHA-384`, and `SHA-512`. Use of other checksum formats is NOT RECOMMENDED for interoperability, as tools to compute those checksums are less widely available.

Other values MAY be used; their interpretation is implementation-specific.