---
title: Intellectual property rights metadata
parent: METS How-Tos
---
# Intellectual property rights metadata

**Intellectual property rights metadata** is metadata about copyright and licensing pertaining to a component of the METS object. Rights metadata can be expressed according current rights description standards, such as PREMIS Rights or a locally produced XML schema.

## TODO use premis rights for the example
```xml
<mets:md ID="ADMRTS1" USE="RIGHTS">
  <mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="METSRights">
    <mets:xmlData>
      <rts:RightsDeclarationMD RIGHTSCATEGORY="PUBLIC DOMAIN">
        <rts:Context CONTEXTCLASS="GENERAL PUBLIC">
          <rts:Constraints CONSTRAINTTYPE="RE-USE">
            <rts:ConstraintDescription>This volume was published in Great
              Britain in 1927 by William Heineman (London) with a reference to
              G.P. Putnam's Sons in New York. (The verso of the title page says
              "Printed in Great Britain" and notes that is was originally
              published in 1920 and reprinted in 1927). Because this work was
              published abroad before 1978 without compliance with US Copyright
              formalities and because it entered the public domain in its home
              country as of 1 January 1996, it is now also considered in the
              public domain in the United States without any constraints on use.
            </rts:ConstraintDescription>
          </rts:Constraints>
        </rts:Context>
      </rts:RightsDeclarationMD>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```
