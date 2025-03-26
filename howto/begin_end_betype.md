---
title: Referring to parts of external XML documents
parent: METS How-Tos
---
# Referring to parts of external XML documents

Through its descendant `<fptr>`, `<area>`, `<par>` and `<seq>` elements, a `<div>` in the `<structMap>` can point to the `<file>` element or elements in the `<fileSec>` representing the content that manifests the `<div>`. Sometimes, however, only a portion of the integral content represented by the referenced `<file>` element is pertinent. If the content represented by the `<file>` element is encoded in XML, SGML, or HTML and the key elements of the content file have associated ID attribute values, a METS `<area>` element can use these ID values to isolate the relevant portion of the content file. In this case, the `<area>`'s BEGIN attribute would cite the ID attribute value of the first pertinent element in the indicated content file; the `<area>`'s END attribute would cite the ID value of the last pertinent element in the indicated content file; and the BETYPE attribute value would be "IDREF" to indicate that ID values were being used to identify the bounding elements defining the relevant section of the content file.
## Example

In the example below, which is an excerpt from a longer encoding, the second `<div>` element in the `<structMap>` uses the `<area>` element’s BEGIN, END and BETYPE attributes to isolate just the relevant portion of a TEI content file that manifests the `<div>`. The `<div>` represents a single, dated entry in the diary; and the `<area>` element associates this `<div>` with just the portion of the integral TEI encoding that begins with the TEI element identified by the ID attribute value “entry1” and ends with the TEI element identified by the ID attribute value “entry1end.”

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
    xmlns:mods="http://www.loc.gov/mods/"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/METS/v2
      https://github.com/mets/METS-schema/raw/mets2/v2/mets.xsd"
    OBJID="ark:/13030/kt9s2010hz" TYPE="text"
    LABEL="[Patrick Breen Diary November 20, 1846 - March 1, 1847]"
    PROFILE="http://www.loc.gov/mets/profiles/00000005.xml">
  <mets:mdSec>
    <mets:md ID="DMD1">
      <mets:mdRef LABEL="Patrick Breen Papers"
          LOCREF="http://sunsite2.berkeley.edu/cgi-bin/oac/calher/breenpapers"
          LOCTYPE="URL" MDTYPE="EAD"/>
    </mets:md>
  </mets:mdSec>
  <mets:fileSec>
    <mets:fileGrp VERSDATE="1998-12-04T00:00:00" USE="text/tei">
      <mets:file ID="FID1" MIMETYPE="text/sgml" SEQ="1"
          CREATED="1998-12-04T00:00:00" GROUPID="GID1">
        <mets:FLocat LOCREF="http://sunsite.berkeley.edu/~jmcdonou/BREEN/sgml/breen2.sgm"
            LOCTYPE="URL"/>
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
