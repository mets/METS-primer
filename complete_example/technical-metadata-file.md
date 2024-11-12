* premis file data
* message digest & file size -- included here, not duplicated in `fileSec`
* file format information from PRONOM included here as well
* `USE="TECHNICAL"` mirrors `techMD` from METS 1
* to describe: `premis:compositionLevel`, `premis:objectIdentifierValue`, `premis:originalName`
* any need to go through each set of file technical metadata separately, or is one enough?

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