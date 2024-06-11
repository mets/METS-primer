## **Descriptive Metadata Section**
With a complete `<fileSec>` and `<structMap>`, we have sufficient information in our METS document to enable a page-turning application to display the digital library object.  But metadata needed for both discovery and management of the work is not yet included.  The descriptive metadata needed for discovery is easily added by creating a [`<mdSec>`](#bookmark=id.2olpkfy) element to contain it.  We can then insert the descriptive metadata record of our choice (in the example below, a MODS record) within that section.


```xml
<mets:mets>
  <mets:dmdSec ID="DMD1">
    <mets:mdWrap MIMETYPE="text/xml" MDTYPE="MODS">
      <mets:xmlData>
        <mods:mods version="3.1">
          <mods:titleInfo>
          <mods:title>Epigrams</mods:title>
          </mods:titleInfo>
          <mods:name type="personal">
           <mods:namePart>Martial</mods:namePart>
          </mods:name>
           <mods:name type="personal">
             <mods:namePart>Ker, Walter C. A. (Walter Charles Alan),1853-1929
             </mods:namePart>
           </mods:name>
           <mods:typeOfResource>text</mods:typeOfResource>
        </mods:mods>
      </mets:xmlData>
    </mets:mdWrap>
  </mets:dmdSec>
  <mets:fileSec>
  </mets:fileSec>
  <mets:structMap>
  </mets:structMap>
</mets:mets>
```

There are several things to note about this example.  The first is that we have chosen to embed the MODS record itself within the METS document; as an alternative, we could have stored the MODS record in a separate file, and then used the `<mdRef>` element instead of the `<mdWrap>` element within `<dmdSec>` to reference the location of the MODS record.


```xml
<mets:mets>
  <mets:dmdSec ID="DMD1">
    <mets:mdRef MIMETYPE="application/MODS" MDTYPE="MODS"/>
      <mets:binData>[base 64 encoded data goes here]</mets:binData>
  </mets:dmdSec>
</mets:mets>
```

The second is that the `<mdWrap>` element contains another subsidiary element, the `<xmlData>` element.  Since we are including a MODS record, this is the appropriate choice, but we could just as easily have placed a MARC record within the `<dmdSec>`, in which case we should have used the binary data wrapper element `<binData>` instead of `<xmlData>`.  Finally, note that we have assigned a unique XML ID attribute value to the `<dmdSec>` element itself.  This allows other portions of the METS document to reference to this descriptive metadata record.  For example, if we wish to link the root <div> element within the structural map to this MODS record to indicate that it pertains to the whole book (and not an individual page within the book), we could alter the <div> element to include a DMDID attribute referencing the MODS records ID attribute value as follows:


```xml
<mets:div TYPE="book" LABEL="Martial Epigrams II" DMDID="DMD1">
```

In this case, linking to the descriptive metadata record might not be crucial, but in cases where you may have separate descriptive metadata records for a book and individual chapters within the book (say for an edited volume compiling works from different authors) the ability to link a particular portion of the structure of the work to its own descriptive metadata record is valuable.