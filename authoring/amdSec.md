## **Administrative Metadata Section**
In addition to descriptive metadata, management of digital objects can require substantial amounts of administrative metadata.  For a newly created object such as this, there are at least two forms of administrative metadata that might be added immediately.  The first is some form of intellectual property rights statement regarding the content of the digital object and the source from which it was derived.  The second is technical metadata regarding the content files themselves.  METS provides a section for recording all of these forms of administrative metadata, the [`<amdSec>`](#bookmark=id.13qzunr) element.  Within the `<amdSec>` element, there are four major sub-elements: `<techMD>`, `<rightsMD>`, `<sourceMD>`, and `<digiprovMD>`.  The `<techMD>` element records technical metadata about content files, `<rightsMD>` records intellectual property rights information, `<sourceMD>` records descriptive, technical or rights information about an analog source document used to generate the digital library object, and `<digiprovMD>` records digital preservation information, such as information about the digital library object's life-cycle and history.

Our digital object, in this case, was digitized from a public domain edition of Martial's _Epigrams_, so a relatively short statement to that effect created using the METSRights schema will suffice for this object:


```xml
<mets:amdSec>
  <mets:rightsMD ID="ADMRTS1">
    <mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="METSRights">
      <mets:xmlData>
        <rts:RightsDeclarationMD RIGHTSCATEGORY="PUBLIC DOMAIN">
          <rts:Context CONTEXTCLASS="GENERAL PUBLIC">
            <rts:Constraints CONSTRAINTTYPE="RE-USE">
              <rts:ConstraintDescription>This volume was published in Great
              Britain in 1927 by William Heineman (London) with a reference 
              to G.P. Putnam's Sons in New York. (The verso of the title page 
              says "Printed in Great Britain” and notes that it was 
              originally published in 1920 and reprinted in 1927). Because 
              this work was published abroad before 1978 without compliance 
              with US Copyright formalities and because it entered the public 
              domain in its home country as of 1 January 1996, it is now also
              considered in the public domain in the United States without 
              any constraints on use.
              </rts:ConstraintDescription>
            </rts:Constraints>
          </rts:Context>
        </rts:RightsDeclarationMD>
      </mets:xmlData>
    </mets:mdWrap>
  </mets:rightsMD>
</mets:amdSec>
```

As with the descriptive metadata record, it is useful to clarify that this record applies to the entirety of the work by associating it with the root <div> element in the structural map.  Editing the <div> element to add an ADMID attribute linking the <div> to this rights statement via the ID attribute on the <rightsMD> element accomplishes this:


```xml
<mets:div TYPE="book" LABEL="Martial Epigrams II" DMDID="DMD1" ADMID="ADMRTS1">
```