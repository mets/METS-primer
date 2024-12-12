---
title: Descriptive metadata
parent: Metadata section
---
# Descriptive metadata

The descriptive metadata needed for discovery and content management is easily added by creating a `<md>` element to contain it. We can then insert the descriptive metadata record of our choice within that section.

In our example case we create a section for descriptive Dublin Core metadata in the following way:

```xml
<mets:mdGrp USE="DESCRIPTIVE">
  <mets:md ID="dmd-001">
    <mets:mdWrap MDTYPE="DC">
      <mets:xmlData>
        <dc:record xmlns:dc="http://purl.org/dc/elements/1.1/"
          xmlns:dcterms="http://purl.org/dc/terms/">
          <dc:title>Understanding and implementing METS, A tutorial focused on METS 2</dc:title>
          <dc:creator>Karin Bredenberg</dc:creator>
          <dc:creator>Aaron Elkiss</dc:creator>
          <dc:creator>Juha Lehtonen</dc:creator>
          <dc:date>2023-09-19</dc:date>
          <dc:description>Tutorial</dc:description>
          <dcterms:license>Copyright held by the author(s). The text of this paper is published under a CC BY-SA license (https://creativecommons.org/licenses/by/4.0/).</dcterms:license>
          <dc:identifier>https://hdl.handle.net/2142/121056</dc:identifier>
          <dc:subject>Metadata and information strategies and workflows</dc:subject>
          <dc:subject>Infrastructure, systems, and tools</dc:subject>
          <dc:subject>Case studies, best practices and novel challenges</dc:subject>
          <dc:subject>Training and education for a new version</dc:subject>
          <dcterms:abstract>This half day tutorial will provide
            participants with an introduction to the Metadata
            Encoding and Transmission Standard (METS) starting in
            METS version 1 and the METS Primer, but focusing
            on METS version 2. It will give a basic overview of METS
            and explore different models of implementation. The
            METS schema is a standard for encoding descriptive,
            administrative, and structural metadata regarding
            objects within a digital library as well as digital
            archives, expressed using the XML schema language of
            the World Wide Web Consortium. It is maintained by
            the METS Editorial Board, and the METS Maintenance
            Activity is managed by the Library of Congress.
          </dcterms:abstract>
          <dc:type>text</dc:type>
          <dcterms:isPartOf>iPRES 2023 Conference Proceedings</dcterms:isPartOf>
        </dc:record>
      </mets:xmlData>
    </mets:mdWrap>
  </mets:md>
</mets:mdGrp>
```

In element `<mets:mdGrp>` attribute `USE` and in element `<mets:md>` and ID describe the use and the identifier of the metadata section, respectively. For descriptive metadata, we recommend using value `DESCRIPTIVE` for attribute `USE`. Elements `<mets:mdWrap>` and `<mets:xmlData>` denote that the metadata is embedded in the section in XML format. Attribute `MDTYPE` defines that the type of the included metadata is Dublin Core.

There are other possibilities to construct METS metadata sections. One example is to have the grouping with some other way, or even without grouping, and define the `USE` as `DESCRIPTIVE` in the `<mets:md>` element:

```xml
<mets:md ID="dmd-001" USE="DESCRIPTIVE">
   [...]
</mets:md>
```
