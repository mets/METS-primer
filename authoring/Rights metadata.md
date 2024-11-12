# Rights metadata

Some form of intellectual property rights statement regarding the content of the digital object and the source from which it was derived might be added.

I our example case we create a section for PREMIS Rights metadata in the following way:

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

In element `<mets:md>`, attributes `ID` and `USE` describe the identifier and the use of the metadata section, respectively. For rights metadata, we recommend using value `RIGHTS` for attribute `USE`. Elements `<mets:mdWrap>` and `<mets:xmlData>` denote that the metadata is embedded in the section in XML format. Attributes `MDTYPE` and `MDTYPEVERSION` define that the type of the included metadata is PREMIS Rights of version 3.0.
