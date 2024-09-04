## **Structural Map and File Section**
The only required portion of a METS document is the structural map, and most schema-aware editing tools, when asked to create a METS document, will create the outermost [`<mets>`](#bookmark=id.3abhhcj) element and a subsidiary [`<structMap>`](#bookmark=id.1pgrrkc) element.  However, when authoring a METS document from scratch, it is often easier to create the file section ([`<fileSec>`](#bookmark=id.49gfa85)) first to record all of the digital content files, and then create both the basic structure for the object within the structural map as well as the links from the structural map to the content files.  So in this instance, we will populate the file section of the METS document first.

The `<fileSec>` portion of the METS document can contain one or more file group (`<fileGrp>`) elements which can be used to organize the individual file elements into sets.  In this case, since we have three different types of files (archival master, reference copy, and thumbnail), we will create three `<fileGrp>` elements within the `<fileSec>` to organize the individual files.  The basic structure of the file section thus looks like this:


```xml
<mets:fileSec>
  <mets:fileGrp USE="archive image"></mets:fileGrp>
  <mets:fileGrp USE="reference image"></mets:fileGrp>
  <mets:fileGrp USE="thumbnail image"></mets:fileGrp>
</mets:fileSec>
```

We use the "USE" attribute of the `<fileGrp>` element to indicate the types of files which can be found within each file group.  All that is left at this point is to populate each `<fileGrp>` with <file> elements for each of the individual content files.  METS provides the ability for content either to be stored within the METS file itself or stored externally in another file and referenced.  For this example, we will store all of the content externally and reference it using the `<FLocat>` sub-element of the <file> element as follows:


```xml
<mets:file ID="epi01m" MIMETYPE="image/tiff">
  <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/
    docgroup/full/01.tif" LOCTYPE="URL"/>
</mets:file>
```

Most of the important information within the <file> element and its sub-elements are actually conveyed via XML attributes.  So in this case, the <file> element itself provides two pieces of information: an XML ID value, which bears a unique identifier for this element that allows other portions of this METS document to reference it, and the MIME type for the data file being referenced.  The `<FLocat>` element supplies the location of the content file, using the xlink:href attribute, and also an indication of the type of referencing mechanism being used within the xlink:href attribute, in this case a URL (other possibilities might be a URN, HANDLE or PURL).  We can place this <file> element, and similar file elements for the equivalent reference and thumbnail images in the `<fileSec>` as follows:


```xml
<mets:fileSec>
  <mets:fileGrp USE="archive image">
    <mets:file ID="epi01m" MIMETYPE="image/tiff">
      <mets:FLocat xlink:href="http://www.loc.gov/standards/mets/docgroup/full/01.tif"
        LOCTYPE="URL"/>
    </mets:file>
  </mets:fileGrp>
  <mets:fileGrp USE="reference image">
    <mets:file ID="epi01r" MIMETYPE="image/jpeg">
      <mets:FLocat
        xlink:href="http://www.loc.gov/standards/mets/docgroup/jpg/01.jpg"
        LOCTYPE="URL"/>
    </mets:file>
  </mets:fileGrp>
  <mets:fileGrp USE="thumbnail image">
    <mets:file ID="epi01t" MIMETYPE="image/gif">
      <mets:FLocat
        xlink:href="http://www.loc.gov/standards/mets/docgroup/gif/01.gif"
        LOCTYPE="URL"/>
    </mets:file>
  </mets:fileGrp>
</mets:fileSec>
```

We could continue adding the `<file>` elements to each of the `<fileGrp>` elements for each data file for all of the scanned pages, until we have `<fileSec>` that records the location for every page image file and provides a unique XML ID attribute value for each.

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