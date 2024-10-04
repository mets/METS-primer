## **Structural Map and File Section**
The only required portion of a METS document is the structural map, and most schema-aware editing tools, when asked to create a METS document, will create the outermost [`<mets>`](#bookmark=id.3abhhcj) element and a subsidiary [`<structMap>`](#bookmark=id.1pgrrkc) element.  However, when authoring a METS document from scratch, it is often easier to create the file section ([`<fileSec>`](#bookmark=id.49gfa85)) first to record all of the digital content files, and then create both the basic structure for the object within the structural map as well as the links from the structural map to the content files.  So in this instance, we will populate the file section of the METS document first.


Once the `<fileSec>` is completed, it is then relatively simple to construct a physical structural map for the work, listing all pages in sequence, and associate the components of the structural map with the various data files contained in the `<fileSec>` by referencing their XML ID values.  A simple structural map for the _Epigrams_ might look like the following:


```xml
<mets:structMap TYPE="physical">
  <mets:div TYPE="book" LABEL="Martial Epigrams II">
    <mets:div TYPE="page" LABEL="Blank page">
    </mets:div>
    <mets:div TYPE="page" LABEL="Page i: Half title page">
    </mets:div>
    <mets:div TYPE="page" LABEL="Page ii: Blank page">
    </mets:div>
    <mets:div TYPE="page" LABEL="Page iii: Title page">
    </mets:div>
    <mets:div TYPE="page" LABEL="Page iv: Publication info">
    </mets:div>	
    <mets:div TYPE="page" LABEL="Page v: Table of contents">
    </mets:div>
    <mets:div TYPE="page" LABEL="Page vi: Blank page">
    </mets:div>
    <mets:div TYPE="page" LABEL="Page 1: Half title page">
    </mets:div>
    <mets:div TYPE="page" LABEL="Page 2 (Latin)">
    </mets:div>
    <mets:div TYPE="page" LABEL="Page 3 (English)">
    </mets:div>
    <mets:div TYPE="page" LABEL="Page 4 (Latin)">
    </mets:div>
    <mets:div TYPE="page" LABEL="Page 5 (English)">
    </mets:div>
  </mets:div>
</mets:structMap>
```

In this structural map, we indicate (using the `<structMap>` TYPE attribute) that we will be providing a physical structure of the work in question (as opposed, for instance, to a logical one), and in this case, that structure consists of saying that the work in question is a book (asserted using the TYPE attribute of the root <div> element in the structMap), and that the book is composed of a subsidiary set of pages.  We use the LABEL attribute on each of the `<div>` elements to state what part of the work this particular `<div>` element represents.  To link the various parts of this structure to the data files in the `<fileSec>`, we use the `<fptr>` element.  Each 'page' <div> can contain one or more `<fptr>` elements linking to the different individual images representing that particular page.  So, for the very first page in the book (with the label of "blank page"), we could modify the <div> element to include three `<fptr>` elements as follows:


```xml
<mets:div TYPE="page" LABEL=" Blank page">
  <mets:fptr FILEID="epi01m"/>
  <mets:fptr FILEID="epi01r"/>
  <mets:fptr FILEID="epi01t"/>
</mets:div>
```

Each `<fptr>` element has a single FILEID attribute, which provides the value of the ID attribute of the appropriate `<file>` element within the `<fileSec>`.  So, in this case we have linked the `<div>` element for the first page of the book to three different files, the master TIFF image version, the reference copy, and the thumbnail version.  By inserting `<fptr>` elements in the other <div> elements within the `<structMap>`, we can link each to the matching image files for that particular page.

It is worth noting at this point that there are a variety of ways that we could have organized the structural map other than the one used here.  We could have chosen to do a logical structural map instead of a physical one, and had `<div>` elements for the individual books and epigrams, instead of for pages.  Given that epigrams may only consume a portion of a page, or run across multiple pages, this would have called for a more complicated mapping to the image files using the <area> sub-element of `<fptr>` to map a <div> element for a particular epigram to a portion of an image file, and/or the use of the <seq> element to indicate multiple <area> elements pointing to different page image files that must be viewed in sequence to see the entirety of an epigram.  We might also have chosen to have two structural maps, one for the Latin version of the work, and one for the English translation, with the "page" level `<div>` elements mapped to the appropriate page image files in each case.  None of these mappings is in any sense better or more correct; which one you might choose to implement depends upon the needs of your users and the resources you have available to create the necessary structures in METS.