---
title: Presenting content simultaneously (in parallel)
parent: METS How-Tos
---
# Presenting content simultaneously (in parallel)

The `<par>` or parallel files element aggregates pointers to files, parts of files, and/or sequences of files or parts of files that must be played or displayed simultaneously to manifest a block of digital content represented by an `<fptr>` element.

This might be the case, for example, with multi-media content, where a still image might have an accompanying audio track that comments on the still image. In this case, a `<par>` element would aggregate two `<area>` elements, one of which pointed to the image file and one of which pointed to the audio file that must be played in conjunction with the image. The `<area>` element associated with the image could be further qualified with SHAPE and COORDS attributes if only a portion of the image file was pertinent and the `<area>` element associated with the audio file could be further qualified with BETYPE, BEGIN, EXTTYPE, and EXTENT attributes if only a portion of the associated audio file should be played in conjunction with the image.

## Example 1

In the example below the `<structMap>` encoding uses the `<par>` element to recreate the experience and intent of the original analog source. In the source, a page of Latin text appears side by side with a page containing its English translation. The `<par>` elements here aggregate the images that represent the pairs of pages that must be displayed together to recreate this experience.

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.loc.gov/METS/v2
   http://www.loc.gov/standards/mets/mets.xsd"
 OBJID="ark:/13030/kt9s2009hz" LABEL="Martial Epigrams">
  <mets:fileSec>
    <mets:fileGrp USE="REFERENCE IMAGE">
      <mets:file ID="epi09r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/09/jpg"
          LOCTYPE="URL"/>
      </mets:file>
      <mets:file ID="epi10r" MIMETYPE="image/jpeg">
        <mets:FLocat LOCREF="http://www.loc.gov/standards/mets/docgroup/jpg/10.jpg"
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
          <mets:div TYPE="paired pages" LABEL="page 1: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi09r"/>
                <mets:area FILEID="epi10r"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="paired pages" LABEL="page 2: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi11r"/>
                <mets:area FILEID="epi12r"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="paired pages" LABEL="page 3: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi13r"/>
                <mets:area FILEID="epi14r"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
          ...
        </mets:div>
      </mets:div>
    </mets:structMap>
  </mets:structSec>
</mets:mets>
```

A `<par>` element can also aggregate `<seq>` elements representing sequences of files or parts of files that must be played or displayed simultaneously to manifest the content represented by an `<fptr>` This might be the case when a single bytestream which should be played in parallel with other streams is too large to fit in a single file (e.g., very high quality multi-track audio, or video). In these cases, you would use subsidiary `<seq>` elements, where each sequence identified the files comprising a particular bytestream in the order they should be played back.

The two potential subsidiary units --- `<area>` and `<seq>` --- may not both be used directly under the same `<par>` element; a `<par>` must contain either a set of `<area>` elements or a set of `<seq>` elements.  In the case where a `<par>` element aggregates `<seq>` elements, however, the `<seq>` elements themselves will aggregate the `<area>` elements that point to the pertinent files or parts of files.

The example below demonstrates a use of `<seq>` elements within a `<par>` element. In this case, the `<structMap>` provides for the parallel display of Latin and English versions of the material where the Latin and English versions appear on separate pages in the analog source, and in separate sets of image files in the digital version.  Furthermore, the `<structMap>` arranges the digital version of the material into a logical structure in which the divisions are manifested by just portions of the referenced integral image files. But, in the case of two divisions, that for the "Introduction" and that for "Book VIII, Epigram III," the relevant portions of the material spans two image files. Therefore, the relevant areas of two image files must be displayed in sequence to manifest these divisions; and two different sequences must be displayed in parallel to manifest both Latin and English versions simultaneously.

## Example 2

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
        <mets:FLocat LOCREF="http://www.loc.gov/standards.mets/docgroup/jpg/10.jpg"
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
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structSec>
    <mets:structMap TYPE="logical">
      <mets:div TYPE="volume" LABEL="Martial Epigrams II">
        <mets:div TYPE="section" LABEL="Book VIII">
          <mets:div TYPE="epigram" LABEL="Introduction: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:seq>
                  <mets:area FILEID="epi09r" SHAPE="RECT" COORDS="0,1150,2500,3150"/>
                  <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,600,2500,900"/>
                </mets:seq>
                <mets:seq>
                  <mets:area FILEID="epi10r" SHAPE="RECT" COORDS="0,1100,2500,3300"/>
                  <mets:area FILEID="epi12r" SHAPE="RECT" COORDS="0,650,2500,950"/>
                </mets:seq>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram I: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,1000,2500,1500"/>
                <mets:area FILEID="epi12r" SHAPE="RECT" COORDS="0,950,2500,1600"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram II: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,1500,2500,2350"/>
                <mets:area FILEID="epi12r" SHAPE="RECT" COORDS="0,1600,2500,2350"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram III: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:seq>
                  <mets:area FILEID="epi11r" SHAPE="RECT" COORDS="0,2350,2500,3050"/>
                  <mets:area FILEID="epi13r" SHAPE="RECT" COORDS="0,500,2500,2100"/>
                </mets:seq>
                <mets:seq>
                  <mets:area FILEID="epi12r" SHAPE="RECT" COORDS="0,2350,2500,3050"/>
                  <mets:area FILEID="epi14r" SHAPE="RECT" COORDS="0,600,2500,2100"/>
                </mets:seq>
              </mets:par>
            </mets:fptr>
          </mets:div>
          <mets:div TYPE="epigram" LABEL="Epigram IV: Latin &amp; English">
            <mets:fptr>
              <mets:par>
                <mets:area FILEID="epi13r" SHAPE="RECT" COORDS="0,2100,2500,2700"/>
                <mets:area FILEID="epi14r" SHAPE="RECT" COORDS="0,2100,2500,2700"/>
              </mets:par>
            </mets:fptr>
          </mets:div>
        </mets:div>
      </mets:div>
    </mets:structMap>
  </mets:structSec>
</mets:mets>
```
