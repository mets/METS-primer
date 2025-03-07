---
title: IDREF/ID linking across different namespaces
parent: METS How-Tos
---
# IDREF/ID linking across different namespaces

As is described above, the elements of the `mdType` has a required ID attributes. The unique identifier values assigned to this attribute allow these elements to be referenced from the MDID attributes that are associated with `<file>` and `<div>` elements. The mdType elements can all include metadata in the form of elements drawn from other namespaces in their `<xmlData>` sections. And in cases where the elements drawn from other namespaces for populating the `<xmlData>` sections themselves have ID attributes, as is the case with some elements drawn from the MODS and VRACORE namespaces, the MDID attribute can reference identifier values assigned to these ID attributes instead of or in addition to the values assigned to ID attributes in the top level `mdType` element (e.g., `<md>`).

## Example

The example below includes a `<md>` with very abbreviated VRA encoded descriptive metadata. These metadata include a description of a print series, a description of a single print from this series, and descriptions of multiple images. The various other parts of the METS document reference the pertinent sections of the VRA encoding by citing ID values identifying elements in the VRA namespace. For example, each `<file>` element in the `<fileSec>` uses its MDID attribute to cite the ID attribute value that identifies the `<vra:image>` element that describes it. The root `<div>` element in the mets `<structMap>` uses its MDID attribute to cite the ID attribute value that identifies the `<vra:work>` element that describes the print series as a whole; and the `<div>` that is the immediate child of the root `<div>` element, and which represents a single print from the series, uses its MDID attribute to cite the ID attribute value that identifies the `<vra:work>` element that describes the individual print.

```xml
<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
    xmlns:vra="http://www.vraweb.org/vracore4.htm"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/METS/v2
      https://github.com/mets/METS-schema/raw/mets2/v2/mets.xsd
      http://www.vraweb.org/vracore4.htm
      https://www.loc.gov/standards/vracore/vra-strict-20171101.xsd"
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
                  <vra:name vocab="ULAN" refid="500035328">Goya,Francisco</vra:name>
                  <vra:dates type="life">
                    <vra:earliestDate>1746</vra:earliestDate>
                    <vra:latestDate>1828</vra:latestDate>
                  </vra:dates>
                  <vra:culture>Spanish</vra:culture>
                  <vra:role vocab="AAT" refid="300025164">printmaker</vra:role>
                </vra:agent>
              </vra:agentSet>
              <vra:titleSet>
                <vra:display>Los Caprichos</vra:display>
                <vra:title type="creator" pref="true" xml:lang="es">Los Caprichos</vra:title>
              </vra:titleSet>
              <vra:worktypeSet>
                <vra:display>print series</vra:display>
                <vra:worktype>print series</vra:worktype>
              </vra:worktypeSet>
            </vra:work>
            <vra:work id="WORK2">
              <vra:agentSet>
                <vra:display>Francisco Goya (Spanish, 1746-1828)</vra:display>
                <vra:agent vocab="ULAN" refid=" 500035328">
                  <vra:dates type="life">
                    <vra:earliestDate>1746</vra:earliestDate>
                    <vra:latestDate>1828</vra:latestDate>
                  </vra:dates>
                  <vra:culture>Spanish</vra:culture>
                  <vra:role vocab="AAT" refid="300025164">printmaker</vra:role>
                </vra:agent>
              </vra:agentSet>
              <vra:descriptionSet>
                <vra:description>Man, asleep at a table, surrounded by demonic-
                  looking animals and birds. Originally intended as the
                  frontispiece for the series.
                </vra:description>
              </vra:descriptionSet>
              <vra:titleSet>
                <vra:display>El Sueño de la Razon Produce Monstruos
                  (The Sleep of Reason Produces Monsters)
                </vra:display>
                <vra:title type="creator" pref="true" xml:lang="es">
                  El Sueño de la Razon Produce Monstruos
                </vra:title>
                <vra:title type="translated" pref="true" xml:lang="en">
                  The Sleep of Reason Produces Monsters
                </vra:title>
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
        <mets:FLocat LOCTYPE="URL"
            LOCREF="http://www.museum.cornell.edu/HFJ/permcoll/pdp/img_pr/monstros_l.jpg"/>
      </mets:file>
    </mets:fileGrp>
    <mets:fileGrp USE="Large full view">
      <mets:file ID="FID2" MIMETYPE="image/jpg" MDID="IMAGE2">
        <mets:FLocat LOCTYPE="URL"
            LOCREF="http://www.museum.cornell.edu/HFJ/permcoll/pdp/img_pr/monstros_X.jpg"/>
      </mets:file>
    </mets:fileGrp>
    <mets:fileGrp USE="Thumbnail view">
      <mets:file ID="FID3" MIMETYPE="image/jpg" MDID="IMAGE3">
        <mets:FLocat LOCTYPE="URL"
            LOCREF="http://www.museum.cornell.edu/HFJ/permcoll/pdp/img_pr/monstros_s.jpg"/>
      </mets:file>
    </mets:fileGrp>
  </mets:fileSec>
  <mets:structSec>
    <mets:structMap TYPE="physical">
      <mets:div TYPE="intaglio print series" LABEL="Los Caprichos" MDID="WORK1">
        <mets:div LABEL="El Sueño de la Razon Produce Monstruos (The Sleep of Reason Produces Monsters)"
            TYPE="intaglio print" MDID="WORK2">
          <mets:fptr FILEID="FID1"/>
          <mets:fptr FILEID="FID2"/>
          <mets:fptr FILEID="FID3"/>
        </mets:div>
      </mets:div>
    </mets:structMap>
  </mets:structSec>
</mets:mets>
```
