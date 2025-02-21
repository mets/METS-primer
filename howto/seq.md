---
title: Presenting content sequentially
parent: METS How-Tos
---
# Presenting content sequentially

The sequence of files `<seq>` element aggregates pointers to files, parts of files and/or parallel sets of files or parts of files that must be played or displayed sequentially to manifest a block of digital content. This might be the case, for example, if the parent `<div>` element represented a logical division, such as a diary entry, that spanned multiple pages of a diary and, hence, multiple page image files.  In this case, a `<seq>` element would aggregate multiple, sequentially arranged `<area>` elements, each of which pointed to one of the image files that must be presented sequentially to manifest the entire diary entry. If the diary entry started in the middle of a page, then the first `<area>` element (representing the page on which the diary entry starts) might be further qualified, via its SHAPE and COORDS attributes, to specify the specific, pertinent area of the associated image file.

## Example 

The example below shows a case where a logical structuring of the digital content provided by the `<structMap>` is supported by the `<seq>` element. The structuring in this case is independent of the physical layout of the material in the analog source. The `<structMap>` here divides Book VIII of Martial's Epigrams into Latin and English versions, each of which is manifested by the sequences of files comprising the version.

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
 http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:fileSec>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi09r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/09.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi10r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/pjg/10/jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi11r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/11.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi12r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/12.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi13r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/13.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi14r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/14.jpg"
          LOCTYPE="URL"/>
      </mets:file>
      ...
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structSec>
    <mets:structMap TYPE="logical">
      <mets:div TYPE="volume" LABEL="Martial Epigrams II">
        <mets:div TYPE="section" LABEL="Book VIII">
          <mets:div TYPE="subsection" LABEL="Latin version">
            <mets:fptr>
              <mets:seq>
                <mets:area FILEID="epi09r"/>
                <mets:area FILEID="epi11r"/>
                <mets:area FILEID="epi13r"/>
                ...
              </mets:seq>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="subsection" LABEL="English version">
            <mets:fptr>
              <mets:seq>
                <mets:area FILEID="epi10r"/>
                <mets:area FILEID="epi12r"/>
                <mets:area FILEID="epi14r"/>
                ...
              </mets:seq>
            </mets:fptr>
          </mets:div>
        </mets:div>
      </mets:div>
    </mets:structMap>
  </mets:structSec>
</mets:mets>
```

Multiple `<seq>` elements would appear under a `<par>` element when multiple sequences of files or parts of files must be played/displayed simultaneously to manifest the content of the governing `<fptr>` element. See the section on the `<par>` element below for a more complete description of this case.