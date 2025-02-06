---
title: Recording who created or modified a METS document
parent: METS How-Tos
---
# Recording who created or modified a METS document

The **agent** element `<agent>` provides for various parties and their
roles with respect to the METS record to be documented.

## Sub-elements

The element `<agent>` has two sub-elements, `<name>` and
`<note>`. The element `<name>` can be used to record the full
name of the agent. The `<note>` element can be used to record
any additional information regarding the agent's activities with
respect to the METS document.

## Example

This example shows a METS document that was created on 9th of May 2006
at 10:30 a.m., by Rick Beaubien.

```xml
<metsHdr CREATEDATE="2006-05-09T10:30:00">
  <mets:agent ROLE="CREATOR">
    <mets:name>Rick Beaubien</mets:name>
  </mets:agent>
</metsHdr>
```
