# Technical metadata

Long-term management and preservation of digital resources requires information regarding the technical characteristics of the digital content. Such technical metadata about text, image, audio, and video data is best produced when the digital content is originally created.

I our example case we create technical PREMIS metadata for five different files each. In METS all of these follow the following notation:

```xml
<mets:md ID="[id]" USE="TECHNICAL"> 
  <mets:mdWrap MDTYPE="PREMIS:OBJECT" MDTYPEVERSION="3.0">
    <mets:xmlData>
      <premis:object xsi:type="premis:file">
        [...]
      </premis:object>
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```
In element `<mets:md>`, attributes `ID` and `USE` describe the identifier and the use of the metadata section, respectively. For technical metadata, we recommend using `TECHNICAL` for `USE`. Elements `<mets:mdWrap>` and `<mets:xmlData>` denote that the metadata is embedded in the section in XML format. Attributes `MDTYPE` and `MDTYPEVERSION` define that the type of the included metadata is PREMIS Object of version 3.0.

In our example, the PREMIS Obect metadata is created for each of the five files included, separately. All of them are listed below:

- **File 1**: [iPRES2023_METS_Tutorial.docx](https://raw.githubusercontent.com/mets/METS-board/master/iPres2023Tutorial/originalfiles/iPRES2023_METS_Tutorial.docx)
    <details>
  
    <summary>PREMIS metadata</summary>

    ```xml
    <mets:md ID="tech-001" USE="TECHNICAL"> 
      <mets:mdWrap MDTYPE="PREMIS:OBJECT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:object xsi:type="premis:file">
            <premis:objectIdentifier>
              <premis:objectIdentifierType>local</premis:objectIdentifierType>
              <premis:objectIdentifierValue>file-001</premis:objectIdentifierValue>
            </premis:objectIdentifier>
            <premis:objectCharacteristics>
              <premis:compositionLevel>0</premis:compositionLevel>
              <premis:fixity>
                <premis:messageDigestAlgorithm authority="cryptographicHashFunctions" authorityURI="http://id.loc.gov/vocabulary/preservation/cryptographicHashFunctions" valueURI="http://id.loc.gov/vocabulary/preservation/cryptographicHashFunctions/md5">MD5</premis:messageDigestAlgorithm>
                <premis:messageDigest>dbf121ba5952a3b48528e2d032b00ad3</premis:messageDigest>
              </premis:fixity>
              <premis:size>51554</premis:size>
              <premis:format>
                <premis:formatDesignation>
                  <premis:formatName>Microsoft Word for Windows</premis:formatName>
                  <premis:formatVersion>2007 onwards</premis:formatVersion>
                </premis:formatDesignation>
                <premis:formatRegistry>
                  <premis:formatRegistryName>PRONOM</premis:formatRegistryName>
                  <premis:formatRegistryKey>fmt/412</premis:formatRegistryKey>
                  <premis:formatRegistryRole authority="http://id.loc.gov/vocabulary/preservation/formatRegistryRole" valueURI="http://id.loc.gov/vocabulary/preservation/formatRegistryRole/spe">specification</premis:formatRegistryRole>
                </premis:formatRegistry>
              </premis:format>
            </premis:objectCharacteristics>
            <premis:originalName>iPRES2023_METS_Tutorial.docx</premis:originalName>
          </premis:object>
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

    </details>
