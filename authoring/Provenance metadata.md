# Provenance metadata

Under construction

- Provenance metadata for creation of Paper DOCX

    <details>

    <summary>Provenance metadata section for PREMIS Event</summary>

    ```xml
    <mets:md ID="event-001" USE="PROVENANCE" MDID="agent-001">
      <mets:mdWrap MDTYPE="PREMIS:EVENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:event>
            <premis:eventIdentifier>
              <premis:eventIdentifierType>local</premis:eventIdentifierType>
              <premis:eventIdentifierValue>event-001</premis:eventIdentifierValue>
            </premis:eventIdentifier>
            <premis:eventType authority="premisEventType" authorityURI="http://id.loc.gov/vocabulary/preservation/eventType" valueURI="http://id.loc.gov/vocabulary/preservation/eventType/cre">creation</premis:eventType>
            <premis:eventDateTime>2021-12-01T15:05</premis:eventDateTime>
            <premis:eventDetailInformation>
              <premis:eventDetail>Object created with Microsoft Office Word</premis:eventDetail>
            </premis:eventDetailInformation>
            <premis:linkingAgentIdentifier>
              <premis:linkingAgentIdentifierType>local</premis:linkingAgentIdentifierType>
              <premis:linkingAgentIdentifierValue>agent-001</premis:linkingAgentIdentifierValue>
              <premis:linkingAgentRole authority="premisEventRelatedAgentRole" authorityURI="http://id.loc.gov/vocabulary/preservation/eventRelatedAgentRole" valueURI="http://id.loc.gov/vocabulary/preservation/eventRelatedAgentRole/exe">executing program</premis:linkingAgentRole>
            </premis:linkingAgentIdentifier>
          </premis:event>            
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>

    <details>

    <summary>Provenance metadata section for PREMIS Agent</summary>

    ```xml
    <mets:md ID="agent-001" USE="PROVENANCE" MDID="event-001">
      <mets:mdWrap MDTYPE="PREMIS:AGENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:agent>
            <premis:agentIdentifier>
              <premis:agentIdentifierType>local</premis:agentIdentifierType>
              <premis:agentIdentifierValue>agent-001</premis:agentIdentifierValue>
            </premis:agentIdentifier>
            <premis:agentName>Microsoft Office Word</premis:agentName>
            <premis:agentType authority="premisAgentType" authorityURI="http://id.loc.gov/vocabulary/preservation/agentType" valueURI="http://id.loc.gov/vocabulary/preservation/agentType/sof">software</premis:agentType>
            <premis:linkingEventIdentifier>
              <premis:linkingEventIdentifierType>local</premis:linkingEventIdentifierType>
              <premis:linkingEventIdentifierValue>event-001</premis:linkingEventIdentifierValue>
            </premis:linkingEventIdentifier>
          </premis:agent>
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>

- Provenance metadata for creation of Presentation PPTX

    <details>

    <summary>Provenance metadata section for PREMIS Event</summary>

    ```xml
    <mets:md ID="event-002" USE="PROVENANCE" MDID="agent-002">
      <mets:mdWrap MDTYPE="PREMIS:EVENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:event>
            <premis:eventIdentifier>
              <premis:eventIdentifierType>local</premis:eventIdentifierType>
              <premis:eventIdentifierValue>event-002</premis:eventIdentifierValue>
            </premis:eventIdentifier>
            <premis:eventType authority="premisEventType" authorityURI="http://id.loc.gov/vocabulary/preservation/eventType" valueURI="http://id.loc.gov/vocabulary/preservation/eventType/cre">creation</premis:eventType>
            <premis:eventDateTime>2023-09-15T23:02</premis:eventDateTime>
            <premis:eventDetailInformation>
              <premis:eventDetail>Object created with Microsoft Office Powerpoint</premis:eventDetail>
            </premis:eventDetailInformation>
            <premis:linkingAgentIdentifier>
              <premis:linkingAgentIdentifierType>local</premis:linkingAgentIdentifierType>
              <premis:linkingAgentIdentifierValue>agent-002</premis:linkingAgentIdentifierValue>
              <premis:linkingAgentRole authority="premisEventRelatedAgentRole" authorityURI="http://id.loc.gov/vocabulary/preservation/eventRelatedAgentRole" valueURI="http://id.loc.gov/vocabulary/preservation/eventRelatedAgentRole/exe">executing program</premis:linkingAgentRole>
            </premis:linkingAgentIdentifier>
          </premis:event>            
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>

    <details>

    <summary>Provenance metadata section for PREMIS Agent</summary>

    ```xml
    <mets:md ID="agent-002" USE="PROVENANCE" MDID="event-002">
      <mets:mdWrap MDTYPE="PREMIS:AGENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:agent>
            <premis:agentIdentifier>
              <premis:agentIdentifierType>local</premis:agentIdentifierType>
              <premis:agentIdentifierValue>agent-002</premis:agentIdentifierValue>
            </premis:agentIdentifier>
            <premis:agentName>Microsoft Office Powerpoint</premis:agentName>
            <premis:agentType authority="premisAgentType" authorityURI="http://id.loc.gov/vocabulary/preservation/agentType" valueURI="http://id.loc.gov/vocabulary/preservation/agentType/sof">software</premis:agentType>
            <premis:linkingEventIdentifier>
              <premis:linkingEventIdentifierType>local</premis:linkingEventIdentifierType>
              <premis:linkingEventIdentifierValue>event-002</premis:linkingEventIdentifierValue>
            </premis:linkingEventIdentifier>
          </premis:agent>
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>

- Provenance metadata for creation of Handout PDF

    <details>

    <summary>Provenance metadata section for PREMIS Event</summary>      

    ```xml
    <mets:md ID="event-003" USE="PROVENANCE" MDID="agent-003">
      <mets:mdWrap MDTYPE="PREMIS:EVENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:event>
            <premis:eventIdentifier>
              <premis:eventIdentifierType>local</premis:eventIdentifierType>
              <premis:eventIdentifierValue>event-003</premis:eventIdentifierValue>
            </premis:eventIdentifier>
            <premis:eventType authority="premisEventType" authorityURI="http://id.loc.gov/vocabulary/preservation/eventType" valueURI="http://id.loc.gov/vocabulary/preservation/eventType/cre">creation</premis:eventType>
            <premis:eventDateTime>2023-09-19T16:09:15</premis:eventDateTime>
            <premis:eventDetailInformation>
              <premis:eventDetail>Object created from Microsoft Word for Windows</premis:eventDetail>
            </premis:eventDetailInformation>
            <premis:linkingAgentIdentifier>
              <premis:linkingAgentIdentifierType>local</premis:linkingAgentIdentifierType>
              <premis:linkingAgentIdentifierValue>agent-003</premis:linkingAgentIdentifierValue>
              <premis:linkingAgentRole authority="premisEventRelatedAgentRole" authorityURI="http://id.loc.gov/vocabulary/preservation/eventRelatedAgentRole" valueURI="http://id.loc.gov/vocabulary/preservation/eventRelatedAgentRole/exe">executing program</premis:linkingAgentRole>
            </premis:linkingAgentIdentifier>
          </premis:event>            
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>

    <details>

    <summary>Provenance metadata section for PREMIS Agent</summary>

    ```xml
    <!-- provenance agent for creation of Handout PDF -->
    <mets:md ID="agent-003" USE="PROVENANCE" MDID="event-003">
      <mets:mdWrap MDTYPE="PREMIS:AGENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:agent>
            <premis:agentIdentifier>
              <premis:agentIdentifierType>local</premis:agentIdentifierType>
              <premis:agentIdentifierValue>agent-003</premis:agentIdentifierValue>
            </premis:agentIdentifier>
            <premis:agentName>Microsoft Word</premis:agentName>
            <premis:agentType authority="premisAgentType" authorityURI="http://id.loc.gov/vocabulary/preservation/agentType" valueURI="http://id.loc.gov/vocabulary/preservation/agentType/sof">software</premis:agentType>
            <premis:linkingEventIdentifier>
              <premis:linkingEventIdentifierType>local</premis:linkingEventIdentifierType>
              <premis:linkingEventIdentifierValue>event-003</premis:linkingEventIdentifierValue>
            </premis:linkingEventIdentifier>
          </premis:agent>
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>

- Provenance metadata for migration of Paper PDF

    <details>

    <summary>Provenance metadata section for PREMIS Event</summary>

    ```xml
    <mets:md ID="event-004" USE="PROVENANCE" MDID="agent-004">
      <mets:mdWrap MDTYPE="PREMIS:EVENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:event>
            <premis:eventIdentifier>
              <premis:eventIdentifierType>local</premis:eventIdentifierType>
              <premis:eventIdentifierValue>event-004</premis:eventIdentifierValue>
            </premis:eventIdentifier>
            <premis:eventType authority="premisEventType" authorityURI="http://id.loc.gov/vocabulary/preservation/eventType" valueURI="http://id.loc.gov/vocabulary/preservation/eventType/mig">migration</premis:eventType>
            <premis:eventDateTime>2023-11-01T19:52:59</premis:eventDateTime>
            <premis:eventDetailInformation>
              <premis:eventDetail>Object migrated from Microsoft Word for Windows to Acrobat PDF 1.4 - Portable Document Format</premis:eventDetail>
            </premis:eventDetailInformation>
            <premis:linkingAgentIdentifier>
              <premis:linkingAgentIdentifierType>local</premis:linkingAgentIdentifierType>
              <premis:linkingAgentIdentifierValue>agent-004</premis:linkingAgentIdentifierValue>
              <premis:linkingAgentRole authority="premisEventRelatedAgentRole" authorityURI="http://id.loc.gov/vocabulary/preservation/eventRelatedAgentRole" valueURI="http://id.loc.gov/vocabulary/preservation/eventRelatedAgentRole/exe">executing program</premis:linkingAgentRole>
            </premis:linkingAgentIdentifier>
          </premis:event>            
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>

    <details>

    <summary>Provenance metadata section for PREMIS Agent</summary>

    ```xml
    <!-- provenance agent for creation of Paper PDF -->
    <mets:md ID="agent-004" USE="PROVENANCE" MDID="event-004">
      <mets:mdWrap MDTYPE="PREMIS:AGENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:agent>
            <premis:agentIdentifier>
              <premis:agentIdentifierType>local</premis:agentIdentifierType>
              <premis:agentIdentifierValue>agent-004</premis:agentIdentifierValue>
            </premis:agentIdentifier>
            <premis:agentName>macOS Version 12.6.8 (Build 21G725) Quartz PDFContext</premis:agentName>
            <premis:agentType authority="premisAgentType" authorityURI="http://id.loc.gov/vocabulary/preservation/agentType" valueURI="http://id.loc.gov/vocabulary/preservation/agentType/sof">software</premis:agentType>
            <premis:linkingEventIdentifier>
              <premis:linkingEventIdentifierType>local</premis:linkingEventIdentifierType>
              <premis:linkingEventIdentifierValue>event-004</premis:linkingEventIdentifierValue>
            </premis:linkingEventIdentifier>
          </premis:agent>
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>

- Provenance metadata for migration of Presentation PDF

    <details>

    <summary>Provenance metadata section for PREMIS Event</summary>

    ```xml
    <!-- provenance event for creation/migration of Presentation PDF -->
    <mets:md ID="event-005" USE="PROVENANCE" MDID="agent-005">
      <mets:mdWrap MDTYPE="PREMIS:EVENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:event>
            <premis:eventIdentifier>
              <premis:eventIdentifierType>local</premis:eventIdentifierType>
              <premis:eventIdentifierValue>event-005</premis:eventIdentifierValue>
            </premis:eventIdentifier>
            <premis:eventType authority="premisEventType" authorityURI="http://id.loc.gov/vocabulary/preservation/eventType" valueURI="http://id.loc.gov/vocabulary/preservation/eventType/mig">migration</premis:eventType>
            <premis:eventDateTime>2023-09-15T23:09:29</premis:eventDateTime>
            <premis:eventDetailInformation>
              <premis:eventDetail>Object migrated from Microsoft Powerpoint for Windows to Acrobat PDF 1.7 - Portable Document Format</premis:eventDetail>
            </premis:eventDetailInformation>
            <premis:linkingAgentIdentifier>
              <premis:linkingAgentIdentifierType>local</premis:linkingAgentIdentifierType>
              <premis:linkingAgentIdentifierValue>agent-005</premis:linkingAgentIdentifierValue>
              <premis:linkingAgentRole authority="premisEventRelatedAgentRole" authorityURI="http://id.loc.gov/vocabulary/preservation/eventRelatedAgentRole" valueURI="http://id.loc.gov/vocabulary/preservation/eventRelatedAgentRole/exe">executing program</premis:linkingAgentRole>
            </premis:linkingAgentIdentifier>
          </premis:event>            
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>

    <details>

    <summary>Provenance metadata section for PREMIS Agent</summary>

    ```xml
    <!-- provenance agent for creation/migration of Presentation PDF -->
    <mets:md ID="agent-005" USE="PROVENANCE" MDID="event-005">
      <mets:mdWrap MDTYPE="PREMIS:AGENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:agent>
            <premis:agentIdentifier>
              <premis:agentIdentifierType>local</premis:agentIdentifierType>
              <premis:agentIdentifierValue>agent-005</premis:agentIdentifierValue>
            </premis:agentIdentifier>
            <premis:agentName>Microsoft® PowerPoint® for Microsoft 365</premis:agentName>
            <premis:agentType authority="premisAgentType" authorityURI="http://id.loc.gov/vocabulary/preservation/agentType" valueURI="http://id.loc.gov/vocabulary/preservation/agentType/sof">software</premis:agentType>
            <premis:linkingEventIdentifier>
              <premis:linkingEventIdentifierType>local</premis:linkingEventIdentifierType>
              <premis:linkingEventIdentifierValue>event-005</premis:linkingEventIdentifierValue>
            </premis:linkingEventIdentifier>
          </premis:agent>
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>
