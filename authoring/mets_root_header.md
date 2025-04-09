---
title: METS root and header
parent: A Complete METS 2 Example
nav_order: 1
---
# METS root and header

METS root starts the METS document. In our example, it contains all the namespaces used in the METS document. It also contains the identifier of the primary identifier assigned to the entire METS object in the `OBJID` attribute. This identifier is used to identify the whole METS object to external systems. A description of the content may be added in the `LABEL` attribute.

It is also a good practice to declare the METS document as an XML 1.0 file with encoding UTF-8 in the first line of the XML file.

```xml
<?xml version="1.0" encoding="UTF-8"?>

<mets:mets xmlns:mets="http://www.loc.gov/METS/v2"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:premis="http://www.loc.gov/premis/v3"
  xsi:schemaLocation="http://www.loc.gov/METS/v2
    https://raw.githubusercontent.com/mets/METS-schema/mets2/v2/mets.xsd
    http://www.loc.gov/premis/v3
    https://www.loc.gov/standards/premis/v3/premis-v3-0.xsd
    http://purl.org/dc/elements/1.1/
    https://www.dublincore.org/schemas/xmls/qdc/2008/02/11/dc.xsd
    http://purl.org/dc/terms/
    https://www.dublincore.org/schemas/xmls/qdc/2008/02/11/dcterms.xsd"
  OBJID="OBJIDexample1"
  LABEL="Born digital METS2 example created by the METS Editorial Board">

  [...]

</mets:mets>
```

The METS header is one of the main sections of a METS document. The METS header contains metadata about the METS document itself. The METS header can contain one or more agents of different types (e.g. `ORGANIZATION`) and roles (e.g. `CREATOR`).

In our example, we can see from the `CREATEDATE` and `LASTMODDATE` attributes in the `<mets:metsHdr>` element that the METS document was created on January 1st, 2024 and modified on September 16th, 2024. The `RECORDSTATUS` describes the status of the record, which in this case is just an example. Our example contains an organizational agent as the creator, which is defined in the `TYPE` and `ROLE` attributes of the `<mets:agent>` element. The elements `<mets:name>` and `<mets:note>` contain the agent name `METS Editorial Board` and a note, respectively.

```xml
<mets:metsHdr CREATEDATE="2024-01-01T00:00:00" LASTMODDATE="2024-09-16T00:00:00"
    RECORDSTATUS="EXAMPLE">
  <mets:agent ROLE="CREATOR" TYPE="ORGANIZATION">
    <mets:name>METS Editorial Board</mets:name>
    <mets:note>This METS file has been created by the METS Editorial Board
      as a METS2 example for born digital material</mets:note>
  </mets:agent>
</mets:metsHdr>
```
