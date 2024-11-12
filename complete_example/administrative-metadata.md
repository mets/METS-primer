* Wrapping a variety of metadata in an `ADMINISTRATIVE` mdGrp; mirrors structure and semantics of `amdSec` from METS 1. 
* Likewise `USE="TECHNICAL"`, `USE="PROVENANCE"`, `USE="RIGHTS"` mirrors `techMD`, `digiprovMD`, and `rightsMD` from METS 1.
* Other ways of structuring could be to use a separate `mdGrp USE="TECHNICAL"` for all technical metadata, etc; could include metadata directly under `mdSec` without including any `mdGrp`. *can't* have nested `mdGrp`.

```xml
<mets:mdGrp USE="ADMINISTRATIVE">
  <!-- technical metadata in PREMIS of Paper DOCX  -->
  <mets:md ID="tech-001" USE="TECHNICAL">...</mets:md>
  <!-- technical metadata in PREMIS of Presentation PPTX  -->
  <mets:md ID="tech-002" USE="TECHNICAL">...</mets:md>
  <!-- technical metadata in PREMIS of Handout PDF -->
  <mets:md ID="tech-003" USE="TECHNICAL">...</mets:md>
  <!-- technical metadata in PREMIS of Paper PDF -->
  <mets:md ID="tech-004" USE="TECHNICAL">...</mets:md>
  <!-- technical metadata in PREMIS of Presentation PDF  -->
  <mets:md ID="tech-005" USE="TECHNICAL">...</mets:md>
  <!-- technical metadata in PREMIS of complete Tutorial IE  -->
  <mets:md ID="tech-006" USE="TECHNICAL">...</mets:md>
  <!-- provenance event for creation of Paper DOCX -->
  <mets:md ID="event-001" USE="PROVENANCE" MDID="agent-001">...</mets:md>
  <!-- provenance agent for creation of Paper DOCX -->
  <mets:md ID="agent-001" USE="PROVENANCE" MDID="event-001">...</mets:md>
  <!-- provenance event for creation of Presentation PPTX -->
  <mets:md ID="event-002" USE="PROVENANCE" MDID="agent-002">...</mets:md>
  <!-- provenance agent for creation of Presentation PPTX -->
  <mets:md ID="agent-002" USE="PROVENANCE" MDID="event-002">...</mets:md>
  <!-- provenance event for creation of Handout PDF -->
  <mets:md ID="event-003" USE="PROVENANCE" MDID="agent-003">...</mets:md>
  <!-- provenance agent for creation of Handout PDF -->
  <mets:md ID="agent-003" USE="PROVENANCE" MDID="event-003">...</mets:md>
  <!-- provenance event for creation/migration of Paper PDF -->
  <mets:md ID="event-004" USE="PROVENANCE" MDID="agent-004">...</mets:md>
  <!-- provenance agent for creation of Paper PDF -->
  <mets:md ID="agent-004" USE="PROVENANCE" MDID="event-004">...</mets:md>
  <!-- provenance event for creation/migration of Presentation PDF -->
  <mets:md ID="event-005" USE="PROVENANCE" MDID="agent-005">...</mets:md>
  <!-- provenance agent for creation/migration of Presentation PDF -->
  <mets:md ID="agent-005" USE="PROVENANCE" MDID="event-005">...</mets:md>
  <!-- rights in PREMIS for Tutorial IE -->
  <mets:md ID="rights-001" USE="RIGHTS">...</mets:md>
</mets:mdGrp>
```