---
title: METS Header 
parent: Sections of a METS Document
nav_order: 2
---
# METS Header 

The **mets header** element `<metsHdr>` captures metadata about the METS document itself, not the digital object the METS document encodes.  Although it records a more limited set of metadata, it is very similar in function and purpose to the headers employed in other schema such as the Text Encoding Initiative (TEI) or in the Encoded Archival Description (EAD).

The `<metsHdr>` may include: document author or agent, any alternative identifiers for a METS document, creation and update dates and times, and the status of the METS document.

## More Information

* [Recording who created or modified a METS document](../howto/agent.md)
* [Alternative identifiers for a digital object](../howto/altRecordID.md)

## Example

Modification to this example record is indicated in LASTMODDATE.

```xml
<metsHdr CREATEDATE="2006-05-09T15:00:00"
    LASTMODDATE="2006-05-09T21:00:00">
  <mets:agent ROLE="CREATOR" TYPE="INDIVIDUAL">
    <mets:name>Rick Beaubien</mets:name>
  </mets:agent>
  <mets:altRecordID TYPE="LCCN">20022838</mets:altRecordID>
</metsHdr>
```

