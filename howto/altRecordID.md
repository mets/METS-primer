---
title: Alternative identifiers for a digital object
parent: METS How-Tos
---
# Alternative identifiers for a digital object

The **alternative identifier** element `<altRecordID>` allows one to use alternative record identifier values for the digital object represented by the METS document; the primary record identifier is stored in the OBJID attribute in the root `<mets>` element.

## Examples

In the first example, expanding on the basic example, `<altRecordID>` reflects the Library of Congress Control Number (LCCN) associated with the manifestation "20023838".

```xml
<metsHdr CREATEDATE="2006-05-09T00:00:00">
  <mets:agent ROLE="CREATOR">
    <mets:name>Rick Beaubien</mets:name>
  </mets:agent>
  <mets:altRecordID TYPE="LCCN">20022838</mets:altRecordID>
<mets:metsHdr>
```

In the second example, `<altRecordID>` reflects the University of California, San Diego's internal identification code for the object. This example also illustrates various uses of the role attribute on `<agent>`.

```xml
<metsHdr CREATEDATE="2004-02-22T00:00:00"
  LASTMODDATE="2004-03-16T00:00:00" RECORDSTATUS="production">
  <mets:agent ROLE="CREATOR" TYPE="ORGANIZATION">
    <mets:name>UCSD</mets:name>
    <mets:note>SIP METS submitted to CDL.</mets:note>
  </mets:agent>
  <mets:agent ROLE="PRESERVATION" TYPE="ORGANIZATION">
    <mets:name>California Digital Library</mats:name>
    <mets:note>SIP METS and associated file(s) placed in Preservation Repository.</mets:note>
  </mets:agent>
  <mets:agent ROLE="EDITOR" TYPE="ORGANIZATION">
    <mets:name>California Digital Library</mets:name>
    <mets:note>DIP METS created.</mets:note>
  </mets:agent>
  <mets:agent ROLE="DISSEMINATOR" TYPE="ORGANIZATION">
    <mets:name>California Digital Library</mets:name>
    <mets:note>Object placed in production.</mets:note>
  </mets:agent>
  <mets:altRecordID TYPE="UCSD">siogc29s5</altRecordID>
</metsHdr>
```
