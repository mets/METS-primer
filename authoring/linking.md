---
title: Linking between metadata and files
parent: A Complete METS 2 Example
nav_order: 5
---
# Linking between metadata and files

Without internal links in METS, we would just have a set of unrelated metadata blocks and files. So we need to link them all together.

The method used in our example is one of the basic ways of implementing links in XML. Our example works as follows:

- In the metadata section, each metadata block has its own internal identifier in the `ID` attribute. For example:
  ```xml
  <mets:mdGrp USE="DESCRIPTIVE">
    <mets:md ID="dmd-001">
      [...]
  ```
  ```xml
  <mets:md ID="tech-001" USE="TECHNICAL">
    [...]
  ```

- In addition, it is possible to link between metadata sections, and in our example we will do this for provenance metadata to link an event and an agent. This is done by referencing the `ID` of the metadata section using the `MDID` attribute in another section.

  For an event:

  ```xml
  <mets:md ID="event-001" USE="PROVENANCE" MDID="agent-001">
    <mets:mdWrap MDTYPE="PREMIS:EVENT" MDTYPEVERSION="3.0">
      [...]
  ```

  and for an agent:

  ```xml
  <mets:md ID="agent-001" USE="PROVENANCE" MDID="event-001">
    <mets:mdWrap MDTYPE="PREMIS:AGENT" MDTYPEVERSION="3.0">
      [...]
  ```
    
- In the file section, each file element has an internal identifier in the attribute `ID`. The `MDID` attribute refers to the metadata sections associated with the file, more specifically the technical and provenance metadata. In provenance metadata, we could have references for both event and agent, but since event and agent blocks refer to each other, it is sufficient to have a link for one.

  ```xml
  <mets:file ID="file-001" MDID="tech-001 event-001">
    [...]
  ```

- Finally, the structural map combines files and all metadata. The `MDID` attribute in the `<mets:div>` root division elemet refers to three types of metadata: descriptive metadata, rights metadata and technical metadata describing a handle identifier for the whole content (intellectual entity). The root division element indicates that these metadata blocks apply to the entire content. The file pointer element `<mets:fptr>` has an attribute `FILEID` referring to the file section. The file specific metadata blocks are referenced in the file section.

  ```xml
  <mets:structMap>
    <mets:div LABEL="Understanding and implementing METS, A tutorial focused on METS 2"
      MDID="dmd-001 tech-006 rights-001">
      <mets:div LABEL="UNDERSTANDING AND IMPLEMENTING METS: A tutorial focused on METS 2"
        TYPE="Paper">
        <mets:fptr FILEID="file-001"/>
          [...]
  ```

