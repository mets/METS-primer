# Linking between metadata and files

Without internal linkings in METS, we would just have a set of unrelated metadata blocks and files. This is why all of these need to be linked together.

The method used in our example is one of the basic ways to implement the linkings. Our example works in the following way:

- In metadata section, every metadata block has it's own internal identifier in attribute `ID`. For example:
    ```xml
    <mets:mdGrp USE="DESCRIPTIVE">
      <mets:md ID="dmd-001">
        [...]
    ```
    ```xml
    <mets:md ID="tech-001" USE="TECHNICAL">
      [...]
    ```

- Additionally, linking between metadata sections is possible, and in our example we will do it for provenance metadata to connect an event and an agent related to event together. This is done by referring to the `ID`of the metadata section by using the attribute `MDID` in another section.

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
    
- In file section, each file element has an internal identifier in attribute `ID`. Attribute `MDID` refers to the metadata sections related to file, more specifically to technical and provenance metadata. In provenance metadata, we could have references for both event and agent, but since event and agent blocks refer between each other, it is enough to have a link for the other one.

    ```xml
      <mets:file ID="file-001" MDID="tech-001 event-001">
        [...]
    ```

- Finally, the structural map combines files and all the metadata together. Attribute `MDID` in the root division elemet `<mets:div>` refers to three different metadata. In the root division it shows that these metadata blocks concern the whole content. File pointer element `<mets:fptr>` has an attribute `FILEID` referring to the file section. The file specific metadata blocks are referred in the file section.

    ```xml
        <mets:structMap>
          <mets:div LABEL="Understanding and implementing METS, A tutorial focused on METS 2" MDID="dmd-001 tech-006 rights-001">
            <mets:div TYPE="Paper" LABEL="UNDERSTANDING AND IMPLEMENTING METS: A tutorial focused on METS 2">
              <mets:fptr FILEID="file-001"/>
                [...]
    ```

