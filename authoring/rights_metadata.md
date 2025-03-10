---
title: Rights metadata
parent: Metadata section
---
# Rights metadata

Some form of intellectual property rights statement about the content of the digital object and the source from which it was derived may be added.

In our example, we create a section for PREMIS Rights Statement metadata as follows:

```xml
<mets:md ID="rights-001" USE="RIGHTS">
  <mets:mdWrap MDTYPE="PREMIS:RIGHTS" MDTYPEVERSION="3.0">
    <mets:xmlData>
      <premis:rights>
        <premis:rightsStatement>
          <premis:rightsStatementIdentifier>
            <premis:rightsStatementIdentifierType>local</premis:rightsStatementIdentifierType>
            <premis:rightsStatementIdentifierValue>rights-001</premis:rightsStatementIdentifierValue>
          </premis:rightsStatementIdentifier>
          <premis:rightsBasis>license</premis:rightsBasis>
          <premis:licenseInformation>
            <premis:licenseDocumentationIdentifier>
              <premis:licenseDocumentationIdentifierType>uri</premis:licenseDocumentationIdentifierType>
              <premis:licenseDocumentationIdentifierValue>https://creativecommons.org/licenses/by/4.0/</premis:licenseDocumentationIdentifierValue>                    
            </premis:licenseDocumentationIdentifier>
            <premis:licenseTerms>The text of this paper is published under a CC BY-SA license (https://creativecommons.org/licenses/by/4.0/).</premis:licenseTerms>
          </premis:licenseInformation>
        </premis:rightsStatement>
      </premis:rights>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

In the `<mets:md>` element, the `ID` and `USE` attributes describe the identifier and use of the metadata section, respectively. For rights metadata, we recommend using the value `RIGHTS` for the `USE` attribute. The `<mets:mdWrap>` and `<mets:xmlData>` elements indicate that the metadata is embedded in the section in XML format. The `MDTYPE` and `MDTYPEVERSION` attributes indicate that the type of the included metadata is PREMIS Rights version 3.0.
