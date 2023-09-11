This page documents suggested attribute values and suggested related attribute value syntax in METS 2. This list currently includes the allowed values from METS 1.

METS 2 does not require particular attribute values, and it is up to the [METS profile](https://www.loc.gov/standards/mets/mets-profiles.html) to specify this. (Work is forthcoming to update the METS profile schema in accordance with METS 2.) However, using the values recommended here may aid with interoperability.

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

### Other values

Other values are possible; their interpretation is up to the specific METS profile.

## `agent@TYPE`

Used to specify the type of agent.

Values allowed from METS 1 are:

* `INDIVIDUAL`: Use if an individual has served as the agent.
* `ORGANIZATION`: Use if an institution, corporate body, association, non-profit enterprise, government, religious body, etc. has served as the agent.

### Other values

Other values are possible; their interpretation is up to the specific METS profile.

## `area@SHAPE`

An attribute that can be used [as in HTML](https://www.w3.org/TR/2011/WD-html5-20110405/author/the-map-element.html#attr-area-shape) to define the shape of the relevant area within the content file pointed to by the `<area>` element. Typically this would be used with image content (still image or video frame) when only a portion of the image pertains. If `SHAPE` is specified then `COORDS` must also be present. `SHAPE` should be used in conjunction with `COORDS` in the manner defined for the `shape` and `coords` attributes on an [HTML5 <area> element](https://www.w3.org/TR/2011/WD-html5-20110405/author/the-map-element.html#the-area-element). 

Values allowed from METS 1 are:

* `RECT` 
* `CIRCLE`
* `POLY`

Implementations should interpret these values as in HTML 5. 

### Other values
				
Other values may be used for this attribute in METS 2, but their interpretation is implementation-specific.

## `area@BETYPE`

Begin/End Type: An attribute that specifies the kind of `BEGIN` and/or `END` values that are being used. For example, if `BYTE` is specified, then the `BEGIN` and `END` point values represent the byte offsets into a file. If `IDREF` is specified, then the `BEGIN` element specifies the `ID` value that identifies the element in a structured text file where the relevant section of the file begins; and the `END` value (if present) would specify the `ID` value that identifies the element with which the relevant section of the file ends. For a given implementation, the METS profile should specify the allowed values for `BETYPE` and the syntax of the `BEGIN` and `END` attributes.

Values allowed from METS 1, and recommended syntaxes for the `BEGIN` and `END` attributes, are:

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

Time codes should be formatted as in section 8 (Time code) of [ST 258:2004](https://ieeexplore.ieee.org/document/7291839), for example as HH:MM:SS:FF (hours, minutes, seconds, and frames) for a non-drop time code or as HH:MM:SS;FF for a drop frame time code.

### Other values

Other values are possible; their interpretation is up to the specific METS profile.

## `area@EXTTYPE`

Extent type: An attribute that specifies the kind of `EXTENT` values that are being used. For example if `BYTE` is specified then `EXTENT` would represent a byte count. If `TIME` is specified the `EXTENT` would represent a duration of time. For a given implementation, the METS profile should specify the allowed values for `EXTTYPE` and the syntax of the `EXTENT` attribute.

Values allowed from METS 1 are any of the values for `BETYPE` except for `IDREF` and `XPTR`.

### Other values

Other values are possible; their interpretation is up to the specific METS profile.

## `file@BETYPE`, `stream@BETYPE`

Begin/End Type: An attribute that specifies the kind of `BEGIN` and/or `END` values that are being used.

The only allowed value from METS 1 is `BYTE`; `BEGIN` and `END` point values represent the byte offsets into the parent file. 

### Other values

Other values are possible; their interpretation is up to the specific METS profile.

## `transformfile@TRANSFORMTYPE`

Used to indicate the type of transformation needed to render content of a file accessible. This may include unpacking a file into subsidiary files/streams.

Allowed values from METS 1 are:

* `decompression`: The action of reversing data compression, i.e., the process of encoding information using fewer bits than an unencoded representation would use by means of specific encoding schemas.
* `decryption`: The process of restoring data that has been obscured to make it unreadable without special knowledge (encrypted data) to its original form.

### Other values

Possible values and their interpretation should be specified in the METS profile.

## `CHECKSUMTYPE`: `<mdRef>`, `<mdWrap>`

Specifies the checksum algorithm used to produce the value
contained in the `CHECKSUM` attribute. For a given implementation, the METS profile should specify the allowed values for `CHECKSUMTYPE` and the syntax of the `CHECKSUM` attribute.

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

Generally, checksums should be encoded as hexadecimal digits (rather than as Base64 or some other binary encoding). For example, an MD5 checksum would appear as `CHECKSUMTYPE="MD5" CHECKSUM="68b329da9893e34099c7d8ad5cb9c940"`

Interoperable implementations of METS should be able to verify checksums using `CRC32`, `MD5`, `SHA-1`, `SHA-256`, `SHA-384`, and `SHA-512`, as these checksums are in wide use and tools to compute them are readily available.

### Other values

Other values are possible; their interpretation is up to the specific METS profile.

## `LOCTYPE`: `<mptr>`, `<mdRef>`, `<FLocat>`

Specifies the locator type used in the `LOCREF` attribute. For a given implementation, the METS profile should specify the allowed values for `LOCTYPE` and the syntax of the `LOCREF` attribute. Generally, best practice is to use a resolvable URL for the value of `LOCREF`; if that is not possible, the METS profile should specify how locations are resolved.

Values allowed from METS 1 are:

* `ARK`: An [Archival Resource Key](https://arks.org/). For interoperability, this should be a resolvable URL that includes a name mapping authority as described in [ARK anatomy](https://arks.org/about/), rather than a bare identifier of the form `ark:/.../...`.
* `URN`: A [Uniform Resource Name](https://datatracker.ietf.org/doc/html/rfc8141), that is, a URI that uses the `urn:` scheme.
* `URL`: Any [Uniform Resource Locator](https://url.spec.whatwg.org/) not covered by another listed category. Relative URLs should be resolved as in [Section 5 of RFC3986](https://datatracker.ietf.org/doc/html/rfc3986#section-5). METS does not provide a mechanism for embedding a base URI, so base URIs will typically be resolved either by the URI used to retrieve the METS document ([section 5.1.3](https://datatracker.ietf.org/doc/html/rfc3986#section-5.1.3)) or via an application-specific default ([section 5.1.4](https://datatracker.ietf.org/doc/html/rfc3986#section-5.1.4))
* `PURL`: A persistent URL, such as those created by [Internet Archive](https://purl.archive.org/help) or the [Government Publishing Office](https://purl.access.gpo.gov/), which does not fall into any more specific category of persistent identifier.
* `HANDLE`: A persistent URL resolvable via [handle.net](https://handle.net/). For interoperability, this should be a resolvable URL that includes the `https://handle.net/` prefix.
* `DOI`: A Digital Object Identifier as described in ISO 26324. For interoperability, this should be a resolvable URL that includes the `https://doi.org/` prefix.

### Other values

Other values are possible; their interpretation is up to the specific METS profile.


## `MDTYPE`: `<mdRef>`, `<mdWrap>`

Used to indicate the type of the associated metadata. Metadata included or linked to by METS files is typically (but is not required to be) formatted as XML.  For a given implementation, the METS profile should specify the allowed values for `MDTYPE` and the corresponding syntax of included or linked metadata.

Values allowed in METS 1 are:

* `MARC`: MAchine-Readable Cataloging (MARC) record, typically as [MARC-XML](https://www.loc.gov/standards/marcxml/); could also be used for MARC21 binary data as specified by [ISO 2709:2008](https://www.iso.org/standard/41319.html) or for MARC expressed as JSON (commonly-used, but not standardized).
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

Additional values could include:

* `AUDIOOBJECT` - [AES57 metadata](https://www.aes.org/publications/standards/search.cfm?docID=84)
* `EBUCORE` - [AES60 metadata](https://www.aes.org/publications/standards/search.cfm?docID=85)
* `DATACITE` - [DataCite metadata](https://schema.datacite.org/)
* `[BIBFRAME](https://www.loc.gov/bibframe/)`
* `[ALTO](https://www.loc.gov/standards/alto/)`

### Other values

Other values are possible; their interpretation is up to the specific METS profile.

## `USE`: `<md>`, `<mdGrp>`

Recommended values for metadata `USE` attributes in METS 2 are:

* `DESCRIPTIVE` - Used to record descriptive metadata pertaining to the METS object as a whole or one of its components. Can be expressed according to many description standards (i.e., MARC, MODS, Dublin Core, TEI Header, EAD, VRA, FGDC, DDI) or any other appropriate XML schema. Corresponds to `<dmdSec>` in METS 1.
* `TECHNICAL` - Used to record technical metadata about a component of the METS object, such as a digital content file. May be expressed using schemas such as [MIX](https://www.loc.gov/mix/), [AudioMD/VideoMD](https://www.loc.gov/standards/amdvmd/index.html), [TextMD](https://www.loc.gov/standards/textMD/), or any other appropriate XML schema. Corresponds to `<techMD>` in METS 1. 
* `RIGHTS` - Records information about copyright and licensing pertaining to a component of the METS object. Rights metadata can be expressed using [PREMIS](https://www.loc.gov/standards/premis/) Rights or any other appropriate XML schema. Corresponds to `<rightsMD>` in METS 1. 
* `SOURCE` - Used to record descriptive and administrative metadata about the source format or media of a component of the METS object such as a digital content file. It is often used for discovery, data administration or preservation of the digital object. Corresponds to `<sourceMD>` in METS 1. 
* `PROVENANCE` - Used to record any preservation-related actions taken on the various files which comprise a digital object (e.g., those subsequent to the initial digitization of the files such as transformation or migrations) or, in the case of born digital materials, the files’ creation. In short, digital provenance should be used to record information that allows both archival/library staff and scholars to understand what modifications have been made to a digital object and/or its constituent parts during its life cycle. This information can then be used to judge how those processes might have altered or corrupted the object’s ability to accurately represent the original item. One might, for example, record master derivative relationships and the process by which those derivations have been created. It may also be used for information regarding the migration/transformation of a file from its original digitization (e.g., OCR, TEI, etc.,) to its current incarnation as a digital object (e.g., JPEG2000). Can be expressed can be expressed using [PREMIS](https://www.loc.gov/standards/premis/) Events or other appropriate XML schemas. Corresponds to `<digiprovMD>` in METS 1. 

### Other values

Other values are possible; their interpretation is up to the specific METS profile.


