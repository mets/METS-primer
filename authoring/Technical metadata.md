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
In element `<mets:md>`, attributes `ID` and `USE` describe the identifier and the use of the metadata section, respectively. For technical metadata, we recommend using value `TECHNICAL` for attribute `USE`. Elements `<mets:mdWrap>` and `<mets:xmlData>` denote that the metadata is embedded in the section in XML format. Attributes `MDTYPE` and `MDTYPEVERSION` define that the type of the included metadata is PREMIS Object of version 3.0.

In our example, the PREMIS Object metadata is created for each of the five files included, separately. All of them are listed below:

- **File 1 - Paper (DOCX)**: [iPRES2023_METS_Tutorial.docx](https://raw.githubusercontent.com/mets/METS-board/master/iPres2023Tutorial/originalfiles/iPRES2023_METS_Tutorial.docx)
    <details>
  
    <summary>Technical metadata section in PREMIS</summary>

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

- **File 2 - Presentation (PPTX)**: [1702_1A_Bredenberg.pptx](https://raw.githubusercontent.com/mets/METS-board/master/iPres2023Tutorial/originalfiles/1702_1A_Bredenberg.pptx)
    <details>
  
    <summary>Technical metadata section in PREMIS</summary>

    ```xml
    <mets:md ID="tech-002" USE="TECHNICAL"> 
      <mets:mdWrap MDTYPE="PREMIS:OBJECT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:object xsi:type="premis:file">
            <premis:objectIdentifier>
              <premis:objectIdentifierType>local</premis:objectIdentifierType>
              <premis:objectIdentifierValue>file-002</premis:objectIdentifierValue>
            </premis:objectIdentifier>
            <premis:objectCharacteristics>
              <premis:compositionLevel>0</premis:compositionLevel>
              <premis:fixity>
                <premis:messageDigestAlgorithm authority="cryptographicHashFunctions" authorityURI="http://id.loc.gov/vocabulary/preservation/cryptographicHashFunctions" valueURI="http://id.loc.gov/vocabulary/preservation/cryptographicHashFunctions/md5">MD5</premis:messageDigestAlgorithm>
                <premis:messageDigest>58806238a5c0d08afa2aa4cc59dc7238</premis:messageDigest>
              </premis:fixity>
              <premis:size>1233701</premis:size>
              <premis:format>
                <premis:formatDesignation>
                  <premis:formatName>Microsoft Powerpoint for Windows</premis:formatName>
                  <premis:formatVersion>2007 onwards</premis:formatVersion>
                </premis:formatDesignation>
                <premis:formatRegistry>
                  <premis:formatRegistryName>PRONOM</premis:formatRegistryName>
                  <premis:formatRegistryKey>fmt/215</premis:formatRegistryKey>
                  <premis:formatRegistryRole authority="http://id.loc.gov/vocabulary/preservation/formatRegistryRole" valueURI="http://id.loc.gov/vocabulary/preservation/formatRegistryRole/spe">specification</premis:formatRegistryRole>
                </premis:formatRegistry>
              </premis:format>
            </premis:objectCharacteristics>
            <premis:originalName>1702_1A_Bredenberg.pptx</premis:originalName>
          </premis:object>            
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

- **File 3 - Handout (PDF)**: [METS Exercise iPRES 2023.pdf](https://raw.githubusercontent.com/mets/METS-board/master/iPres2023Tutorial/METS%20Exercise%20iPRES%202023.pdf)
    <details>
  
    <summary>Technical metadata section in PREMIS</summary>

    ```xml
    <mets:md ID="tech-003" USE="TECHNICAL">
      <mets:mdWrap MDTYPE="PREMIS:OBJECT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:object xsi:type="premis:file">
            <premis:objectIdentifier>
              <premis:objectIdentifierType>local</premis:objectIdentifierType>
              <premis:objectIdentifierValue>file-003</premis:objectIdentifierValue>
            </premis:objectIdentifier>
            <premis:objectCharacteristics>
              <premis:compositionLevel>0</premis:compositionLevel>
              <premis:fixity>
                <premis:messageDigestAlgorithm authority="cryptographicHashFunctions" authorityURI="http://id.loc.gov/vocabulary/preservation/cryptographicHashFunctions" valueURI="http://id.loc.gov/vocabulary/preservation/cryptographicHashFunctions/md5">MD5</premis:messageDigestAlgorithm>
                <premis:messageDigest>ace57c041cef79977c87353e96475d58</premis:messageDigest>
              </premis:fixity>
              <premis:size>253648</premis:size>
              <premis:format>
                <premis:formatDesignation>
                  <premis:formatName>Acrobat PDF 1.7 - Portable Document Format</premis:formatName>
                  <premis:formatVersion>1.7</premis:formatVersion>
                </premis:formatDesignation>
                <premis:formatRegistry>
                  <premis:formatRegistryName>PRONOM</premis:formatRegistryName>
                  <premis:formatRegistryKey>fmt/276</premis:formatRegistryKey>
                  <premis:formatRegistryRole authority="http://id.loc.gov/vocabulary/preservation/formatRegistryRole" valueURI="http://id.loc.gov/vocabulary/preservation/formatRegistryRole/spe">specification</premis:formatRegistryRole>
                </premis:formatRegistry>
              </premis:format>
            </premis:objectCharacteristics>
            <premis:originalName>METS Exercise iPRES 2023.pdf</premis:originalName>
          </premis:object>            
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```

- **File 4 - Paper PDF**: [iPRES2023_submission_1702.pdf](https://www.ideals.illinois.edu/items/128260/bitstreams/428885/object)
    <details>
  
    <summary>Technical metadata section in PREMIS</summary>

    ```xml
    <mets:md ID="tech-004" USE="TECHNICAL">
      <mets:mdWrap MDTYPE="PREMIS:OBJECT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:object xsi:type="premis:file">
            <premis:objectIdentifier>
              <premis:objectIdentifierType>local</premis:objectIdentifierType>
              <premis:objectIdentifierValue>file-004</premis:objectIdentifierValue>
            </premis:objectIdentifier>
            <premis:objectCharacteristics>
              <premis:compositionLevel>0</premis:compositionLevel>
              <premis:fixity>
                <premis:messageDigestAlgorithm authority="cryptographicHashFunctions" authorityURI="http://id.loc.gov/vocabulary/preservation/cryptographicHashFunctions" valueURI="http://id.loc.gov/vocabulary/preservation/cryptographicHashFunctions/md5">MD5</premis:messageDigestAlgorithm>
                <premis:messageDigest>0b17b66e1c8ec8bb3074e9d5d3dd5623</premis:messageDigest>
              </premis:fixity>
              <premis:size>103555</premis:size>
              <premis:format>
                <premis:formatDesignation>
                  <premis:formatName>Acrobat PDF 1.4 - Portable Document Format</premis:formatName>
                  <premis:formatVersion>1.4</premis:formatVersion>
                </premis:formatDesignation>
                <premis:formatRegistry>
                  <premis:formatRegistryName>PRONOM</premis:formatRegistryName>
                  <premis:formatRegistryKey>fmt/18</premis:formatRegistryKey>
                  <premis:formatRegistryRole authority="http://id.loc.gov/vocabulary/preservation/formatRegistryRole" valueURI="http://id.loc.gov/vocabulary/preservation/formatRegistryRole/spe">specification</premis:formatRegistryRole>
                </premis:formatRegistry>
              </premis:format>
            </premis:objectCharacteristics>
            <premis:originalName>iPRES2023_submission_1702.pdf</premis:originalName>
          </premis:object>            
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>  
    ```

- **File 5 - Presentation PDF**: [METS Tutorial iPRES 2023.pdf](https://raw.githubusercontent.com/mets/METS-board/master/iPres2023Tutorial/METS%20Tutorial%20iPRES%202023.pdf)
    <details>
  
    <summary>Technical metadata section in PREMIS</summary>

    ```xml
    <mets:md ID="tech-005" USE="TECHNICAL"> 
      <mets:mdWrap MDTYPE="PREMIS:OBJECT" MDTYPEVERSION="3.0">
        <mets:xmlData>
          <premis:object xsi:type="premis:file">
            <premis:objectIdentifier>
              <premis:objectIdentifierType>local</premis:objectIdentifierType>
              <premis:objectIdentifierValue>file-005</premis:objectIdentifierValue>
            </premis:objectIdentifier>
            <premis:objectCharacteristics>
              <premis:compositionLevel>0</premis:compositionLevel>
              <premis:fixity>
                <premis:messageDigestAlgorithm authority="cryptographicHashFunctions" authorityURI="http://id.loc.gov/vocabulary/preservation/cryptographicHashFunctions" valueURI="http://id.loc.gov/vocabulary/preservation/cryptographicHashFunctions/md5">MD5</premis:messageDigestAlgorithm>
                <premis:messageDigest>0c171c6ecab670343e02cd0f26e85385</premis:messageDigest>
              </premis:fixity>
              <premis:size>972257</premis:size>
              <premis:format>
                <premis:formatDesignation>
                  <premis:formatName>Acrobat PDF 1.7 - Portable Document Format</premis:formatName>
                  <premis:formatVersion>1.7</premis:formatVersion>
                </premis:formatDesignation>
                <premis:formatRegistry>
                  <premis:formatRegistryName>PRONOM</premis:formatRegistryName>
                  <premis:formatRegistryKey>fmt/276</premis:formatRegistryKey>
                  <premis:formatRegistryRole authority="http://id.loc.gov/vocabulary/preservation/formatRegistryRole" valueURI="http://id.loc.gov/vocabulary/preservation/formatRegistryRole/spe">specification</premis:formatRegistryRole>
                </premis:formatRegistry>
              </premis:format>
            </premis:objectCharacteristics>
            <premis:originalName>METS Tutorial iPRES 2023.pdf</premis:originalName>
          </premis:object>            
        </mets:xmlData>
      </mets:mdWrap>
    </mets:md>
    ```
    
As the 6th technical metadata section, we add a PREMIS Intellectual Entity of full Tutorial. The METS elements are similar to the corresponding elements in PREMIS Object metadata of the files.

```xml
<mets:md ID="tech-006" USE="TECHNICAL"> 
  <mets:mdWrap MDTYPE="PREMIS:OBJECT" MDTYPEVERSION="3.0">
    <mets:xmlData>
      <premis:object xsi:type="premis:intellectualEntity">
        <premis:objectIdentifier>
          <premis:objectIdentifierType authority="identifiers" authorityURI="http://id.loc.gov/vocabulary/identifiers" valueURI="http://id.loc.gov/vocabulary/identifiers/hdl" >hdl</premis:objectIdentifierType>
          <premis:objectIdentifierValue>https://hdl.handle.net/2142/121056</premis:objectIdentifierValue>
        </premis:objectIdentifier> 
      </premis:object>            
    </mets:xmlData>
  </mets:mdWrap>
</mets:md>
```
