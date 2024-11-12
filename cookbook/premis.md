# Digital provenance metadata -- PREMIS

The **digital provenance metadata** could contain metadata about any
preservation-related actions taken on the various files which comprise
a digital object (e.g., those subsequent to the initial digitization of
the files such as transformation or migrations) or, in the case of born
digital materials, the files' creation. In short, digital provenance
should be used to record information that allows both archival/library
staff and scholars to understand what modifications have been made to a
digital object and/or its constituent parts during its life cycle. This
information can then be used to judge how those processes might have
altered or corrupted the object's ability to accurately represent the
original item. One might, for example, record master derivative
relationships and the process by which those derivations have been
created. Digital provenance metadata could contain information regarding
the migration/transformation of a file from its original digitization
(e.g., OCR, TEI, etc.,)to its current incarnation as a digital object
(e.g., JPEG2000). Digital provenance metadata can be
expressed according to current digital provenance description standards
(such as PREMIS) or a locally produced XML schema.

## TODO use current version of PREMIS

```xml
<mets:md ID="DP_0755ad93-5fd1-11da-b211-19e7a5cf4814"
    CREATED="2006-11-27T21:37:13" USE="PROVENANCE">
  <mets:mdWrap MDTYPE="PREMIS"
    <mets:xmlData xmlns:premis=http://www.loc.gov/standards/premis/v1
        xsi:schemaLocation="http://www.loc.gov/standards/premis/v1
          http://www.loc.gov/standards/premis/v1/Event-v1-1.xsd">
        <premis:eventIdentifier>
          <premis:eventIdentifierType>Validation</premis:eventIdentifierType>
          <premis:eventIdentifierValue>Ingest_Validation_01</premis:eventIdentifierValue>
        </premis:eventIdentifier>
        <premis:eventType>Validation</premis:eventType>
        <premis:eventDateTime>2006-11-27-08:00</premis:eventDateTime>
        <premis:eventDetail>ValidationResults</premis:eventDetail>
        <premis:eventOutcomeInformation>
        <premis:eventOutcome>Pass</premis:eventOutcome>
          <premis:eventOutcomeDetail>
            <ingestValidation ID="FILE_epi01m.tiff">
              <JhoveOutput>File is of format: TIFF. The file is well
                -formed. The file is valid. </JhoveOutput>
              <IngestValidatorOutput>The computed checksum matches the
                original checksum for file[file:90990250/90990250.pdf]
              </IngestValidatorOutput>
              <IngestValidatorOutput>Original file ID: FILE_epi01m.tiff
                has been changed to FILE_07108e3e-5fd1-11da-b211-19e7a5cf4814
              </IngestValidatorOutput>
              <IngestValidatorOutput>Original file name eip01m>tiff has
                been changed to FILE_07108e3e-5fd1-11da-b211-19e7a5cf4814,pdf
              </IngestValidatorOutput>
            </ingestValidation>
          </premis:eventOutcomeDetail>
        </premis:eventOutcomeInformation>
        <premis:linkingAgentIdentifier>
          <premis:linkingAgentIdentifierType>"Software"/>
          <premis:linkingAgentIdentifierValue>"JHove"/>
        </premis:linkingAgentIdentifier>
        <premis:linkingAgentIdentifier>
          <premis:linkingAgentIdentifierType>"Software"/>
          <premis:linkingAgentIdentifierValue>"SDR_Ingest_Validator"/> </premis:linkingAgentIdentieier>
      </premis:event>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

Examples for implementing PREMIS can be found on the
[PREMIS website](https://www.loc.gov/standards/premis/)
