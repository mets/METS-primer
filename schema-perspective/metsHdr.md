[Image]

## `<metsHdr>` METS Header 

The **mets header** element `<metsHdr>` captures metadata about the METS
document itself, not the digital object the METS document encodes.
Although it records a more limited set of metadata, it is very similar
in function and purpose to the headers employed in other schema such as
the Text Encoding Initiative (TEI) or in the Encoded Archival
Description (EAD).

### Elements contained in the METS header

The `<metsHdr>` may include: document author or agent, any alternative
identifiers for a METS document, creation and update dates and times,
and the status of the METS document.

#### Agent

The **agent** element `<agent>` provides for various parties and their
roles with respect to the METS record to be documented.

#### Agent -- elements

The element `<agent>` has two sub-elements, **name** `<name>` and
**note** `<note>`. The element `<name>` can be used to record the full
name of the document agent. The `<note>` element can be used to record
any additional information regarding the agent's activities with
respect to the METS document.

#### Agent -- example

This example shows a METS document that was created on 9th of May 2006
at 10:30 a.m., by Rick Beaubien.

```xml
<metsHdr CREATEDATE="2006-05-09T10:30:00">
  <mets:agent ROLE="CREATOR">
    <mets:name>Rick Beaubien</mets:name>
  </mets:agent>
</metsHdr>
```

#### Alternative identifiers

The **alternative identifier** element `<altRecordID>` allows one to use
alternative record identifier values for the digital object represented
by the METS document; the primary record identifier is stored in the
OBJID attribute in the root `<mets>` element.

#### Alternative identifiers -- examples

First example: expanding on the basic example, altRecordID reflects the
Library of Congress Control Number (LCCN) associated with the
manifestation "20023838".

```xml
<metsHdr CREATEDATE="2006-05-09T00:00:00>
  <mets:agent ROLE="CREATOR">
    <mets:name>Rick Beaubien</mets:name>
  </mets:agent>
  <mets:altRecordID TYPE="LCCN">20022838</mets:altRecordID>
<mets:metsHdr>
```

In the second example, altRecordID reflects the University of
California, San Diego's internal identification code for the object;
this example also reflects various uses of the role attribute on agent.

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

### METS header example

Modification to this example record is indicated in LASTMODDATE.

```xml
<metsHdr CREATEDATE="2006-05-09T15:00:00"
    LASTMODDATE="2006-05-09T21:00:00>
  <mets:agent ROLE="CREATOR" TYPE="INDIVIDUAL">
    <mets:name>Rick Beaubien</mets:name>
  </mets:agent>
  <mets:altRecordID TYPE="LCCN">20022838</mets:altRecordID>
</metsHdr>
```

