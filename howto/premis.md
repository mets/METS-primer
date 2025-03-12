---
title: Digital provenance metadata -- PREMIS
parent: METS How-Tos
---
# Digital provenance metadata -- PREMIS

The **digital provenance metadata** could contain metadata about any preservation-related actions taken on the various files which comprise a digital object (e.g., those subsequent to the initial digitization of the files such as transformation or migrations) or, in the case of born digital materials, the files' creation. In short, digital provenance should be used to record information that allows both archival/library staff and scholars to understand what modifications have been made to a digital object and/or its constituent parts during its life cycle. This information can then be used to judge how those processes might have altered or corrupted the object's ability to accurately represent the original item. One might, for example, record master derivative relationships and the process by which those derivations have been created. Digital provenance metadata could contain information regarding the migration/transformation of a file from its original digitization (e.g., OCR, TEI, etc.) to its current incarnation as a digital object (e.g., JPEG2000). Digital provenance metadata can be expressed according to current digital provenance description standards (such as PREMIS) or a locally produced XML schema.

```xml
<mets:md USE="PROVENANCE" ID="md-001" CREATED="2025-02-12T23:04:00">
  <mets:mdWrap MDTYPE="PREMIS">
    <mets:xmlData>
      <premis:event xmlns:premis="http://www.loc.gov/premis/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.loc.gov/premis/v3 https://www.loc.gov/standards/premis/v3/premis-v3-0.xsd" version="3.0">
        <premis:eventIdentifier>
          <premis:eventIdentifierType>Validation</premis:eventIdentifierType>
          <premis:eventIdentifierValue>Ingest_Validation_01</premis:eventIdentifierValue>
        </premis:eventIdentifier>
        <premis:eventType>Validation</premis:eventType>
        <premis:eventDateTime>2025-02-12T08:00:03</premis:eventDateTime>
        <premis:eventDetailInformation>
          <premis:eventDetail>ValidationResults</premis:eventDetail>
        </premis:eventDetailInformation>
        <premis:eventOutcomeInformation>
          <premis:eventOutcome>Pass</premis:eventOutcome>
          <premis:eventOutcomeDetail>
            <premis:eventOutcomeDetailExtension>
              <ingestValidation ID="FILE_epi01m.tiff">
                <JhoveOutput>File is of format: TIFF. The file is well-formed. The file is valid.</JhoveOutput>
                <IngestValidatorOutput>The computed checksum matches the original checksum for
                  file[file:90990250/90990250.pdf]</IngestValidatorOutput>
                <IngestValidatorOutput>Original file ID: FILE_epi01m.tiff has been changed to
                  FILE_07108e3e-5fd1-11da-b211-19e7a5cf4814</IngestValidatorOutput>
                <IngestValidatorOutput>Original file name eip01m.tiff has been changed to
                  FILE_07108e3e-5fd1-11da-b211-19e7a5cf4814.pdf</IngestValidatorOutput>
              </ingestValidation>
            </premis:eventOutcomeDetailExtension>
          </premis:eventOutcomeDetail>
        </premis:eventOutcomeInformation>
        <premis:linkingAgentIdentifier>
          <premis:linkingAgentIdentifierType>"Software"</premis:linkingAgentIdentifierType>
          <premis:linkingAgentIdentifierValue>"JHove"</premis:linkingAgentIdentifierValue>
        </premis:linkingAgentIdentifier>
        <premis:linkingAgentIdentifier>
          <premis:linkingAgentIdentifierType>"Software"</premis:linkingAgentIdentifierType>
          <premis:linkingAgentIdentifierValue>"SDR_Ingest_Validator"</premis:linkingAgentIdentifierValue>
        </premis:linkingAgentIdentifier>
      </premis:event>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```

Examples for implementing PREMIS can be found on the
[PREMIS website](https://www.loc.gov/standards/premis/)
