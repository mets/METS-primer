# Linking to external resources from METS

METS uses its own attributes to provide links to external resources from elements within METS. Specifically, the LOCREF attribute is used to specify the URL of the pertinent external resource; and the LOCTYPE can be used to specify or associate pertinent metadata with the specified xlink:href link. These attributes can be used in two main contexts in METS.

## Context 1: The `<mdRef>` sub-element in elements of mdType

The `<mdRef>` element in `<md>` elements uses LOCREF attribute to point to the external resource containing the pertinent metadata.
### Example

In the `<mdSec>` below, the LOCREF attribute cites a URL that identifies the location of an external, EAD based description.

```xml
<mets:mdSec>
    <mets:md ID="DMD1">
        <mets:mdRef LABEL="Patrick Breen Papers" LOCREF="http://sunsite2.berkeley.edu/cgi-bin/oac/calher/breenpapers#xyzj0098" LOCTYPE="URL" MDTYPE="EAD"/>
    </mets:md>
</mets:mdSec>
```
## Context 2: The `<FLocat>` sub-element of the `<file>` elements in the `<fileSec>`

The `<FLocat>` element uses an xlink:href attribute to point to the pertinent content file in its external location. The other XLink simpleLink attributes can be used to describe this link. 
### Example

In the example below, the LOCREF attribute uses a URL to identify the location of the pertinent external content file. 

```xml
<mets:fileGrp USE="Full view">
  <mets:file ID="FID1" MIMETYPE="image/jpg" MDID="IMAGE1">
    <mets:FLocat LOCREF="http://www.museum.cornell.edu/HFJ/permcoll/pdp/img_pr/monstros_l.jpg" LOCTYPE="URL"/>
  </mets:file>
</mets:fileGrp>
```