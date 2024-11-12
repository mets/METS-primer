# Provenance metadata

To keep the authenticity of the digital content, all changes to the data (and metadata) must be done in a controlled way. This requires documenting the essential actions done to the content during its full lifecycle.

I our example case we create provenance PREMIS metadata, including event and agent, for the creation of five different files. There are a couple of way to do this, but we create separate metadata sections for each event and agent.

In METS, all of these follow the following notation for events:

    ```xml
    <mets:md ID="[event-id]" USE="PROVENANCE" MDID="[agent-id]">
      <mets:mdWrap MDTYPE="PREMIS:EVENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:event>
            [...]
          </premis:event>            
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```
and for agents:

    ```xml
    <mets:md ID="[agent-id]" USE="PROVENANCE" MDID="[event-id]">
      <mets:mdWrap MDTYPE="PREMIS:AGENT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:agent>
            [...]
          </premis:agent>
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```
In element `<mets:md>`, attributes `ID` and `USE` describe the identifier and the use of the metadata section, respectively. Attibute MDID refers from event to the corresponding agent and vice versa, by using the `ID` identifier of the section to refer to. For provenance metadata, we recommend using value `PROVENANCE` for attribute `USE`. Elements `<mets:mdWrap>` and `<mets:xmlData>` denote that the metadata is embedded in the section in XML format. Attributes `MDTYPE` and `MDTYPEVERSION` define that the type of the included metadata is PREMIS Event or Agent of version 3.0.

In our example, the PREMIS Event and Agent metadata is created for each of the five files included, separately. All of them are listed below:

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
