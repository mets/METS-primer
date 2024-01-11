# Chapter 1:  Introduction and background



## **What is METS?**
The Metadata Encoding and Transmission Standard (METS) is a data encoding and transmission specification, expressed in XML, that provides the means to convey the metadata necessary for both the management of digital objects within a repository[^1] and the exchange of such objects between repositories (or between repositories and their users).  This common object format was designed to allow the sharing of efforts to develop information management tools/services and to facilitate the interoperable exchange of digital materials among institutions (including vendors).  The METS XML schema was created in 2001 under the sponsorship of the Digital Library Federation (DLF), is supported by the Library of Congress as its maintenance agency, and is governed by the METS Editorial Board.  In 2004 it received NISO Registration, which was renewed in 2006.



## **What problem is METS trying to solve?**
Many institutions in the digital arena are finding it at least desirable, if not necessary, to maintain metadata about the digital objects they are creating and/or keeping for the long term.  As the number and complexity of these digital objects increases, institutions are finding the metadata needed for successful management, access, and use is both more extensive and different from that used to manage, access, and use its other collections.  Many institutions are finding it necessary, for instance, to retain structural metadata that describes, anchors, and organizes the components of a digital object so that the integrity of the digital object may be retained even when its components are stored in different places. And, when a repository of digital objects intends to share metadata about a digital object, or the object itself, with another repository or with a tool meant to render the object, the use of a common data transfer syntax between repositories and between tools greatly improves the facility and efficiency with which the transactions can occur.  METS was created and designed to provide a relatively easy format for these kinds of activities during the life-cycle of the digital object.



## **How is METS maintained?**
The METS Editorial Board maintains editorial control of METS; it’s XML Schema, the METS Profile XML Schema, and official METS documentation. Additionally, the Board promotes the use of the standard, maintains a registry of METS Profiles, and endorses best practices in the use of METS as they emerge.  The Board has recently expanded its scope to include support and development of the METS community.  

The METS Editorial Board is a volunteer group selected from the international METS community.  Board members usually represent institutions which have or plan to implement METS, but also come from different sectors of the information creation and delivery communities including academic research libraries, local and national archives, museums, national libraries, governmental and non-governmental organizations, and vendors.  Current membership of the Board can be found on the [METS website](http://www.loc.gov/standards/mets/mets-home.html).

METS is sponsored by the [Digital Library Federation](http://www.diglib.org/), a consortium of libraries and related agencies whose members initiated the effort.  The Library of Congress serves as the maintenance agency for METS by hosting the website and providing other invaluable support and services.



## **What is METS built upon?**
METS builds upon the work of the Making of America II project (MOA2) which provided an XML document format for encoding the metadata necessary for both the management of digital objects within a repository and the exchange of such objects between repositories (or between repositories and their users).  The MOA2 initiative started in 1997.  Participants included the University of California, Berkeley (Lead), Stanford University, Penn State, Cornell and New York Public Library.  The goal of MOA2 was to define a framework for digital library services; as part of that effort, participants recognized that a common definition of a digital object for library resources would both simplify and reduce the cost of developing a service framework.  This effort resulted in the MOA2 DTD (an XML DTD) which defined a digital object standard for encoding structural, descriptive and administrative metadata along with primary content.  UC Berkeley and the California Digital Library (CDL) adopted MOA2.  Others, like the Library of Congress and Harvard University, considered implementation.  MOA2 was a common object format that allowed for the sharing of effort to develop tools/services.  The common object format ensures interoperability of digital materials as they are exchanged between institutions (including vendors).  Project deliverables included a metadata capture database, a Java object browser, and the MOA2 DTD.

After a few years using the MOA2 DTD, the MOA2 community realized a need to expand their ability to share, archive, and display digital objects which required more varied descriptive and administrative metadata, and the need to support many other data formats including audio / video.  In February 2001, the concerned parties first met to review and revise MOA2; the outcome was version 1.0 of the METS XML schema (mets.xsd).[^2] 



## **Who is the METS community?**
Use of METS has steadily increased since 2001.  To the best of our knowledge, many in the METS community are University Libraries, Archives, or Museums, but there is no way to know of all the METS implementations. Those institutions which have chosen to register their implementation can be found on the [METS Implementation Registry](http://www.loc.gov/standards/mets/mets-registry.html).



## **How can I find out more about METS?**
The [METS website](http://www.loc.gov/standards/mets/mets-home.html) maintained by the Library of Congress is a good place to start for those interested in learning more about METS.  The current and earlier versions of the [METS schema](http://www.loc.gov/standards/mets/mets-schemadocs.html) and related documentation, including a METS Overview and Tutorial in a number of languages, can be found on the METS website.  In addition, a number of example [METS documents](http://www.loc.gov/standards/mets/mets-examples.html) can be found as well as recent presentations that describe METS and its implementations.  The website also contains a place from which METS-related [tools and utilities](http://www.loc.gov/standards/mets/mets-tools.html) can be downloaded.  Announcements about events, changes to documentation and the schemas themselves are made on the website.

Technical questions about the use of METS and other questions can be addressed to the [METS listserv](http://www.loc.gov/standards/mets/mets-list-enter.html).  The METS community has also requested a [METS wiki](http://www.socialtext.net/mim-2006/index.cgi) to provide a place where more informal discussions and development of sample METS documents, profiles, and tools can be drafted.  The METS wiki is also the place where proposals for changes to either the METS schema or the METS profile schema can be made.

Throughout the year, there are various opportunities for face-to-face meetings with other METS community members.  Open Editorial Board meetings are held at each Digital Library Federation Forum in Spring and Fall in various places in the United States.  The Board has announced its intention to hold every fourth Board meeting in Europe, usually in conjunction with other digital repository or digital library events.  Often DLF and other institutions sponsor and/or host training events such as the METS  Opening Days, outlined on the METS website, and METS Implementation Meetings, which often combine both training and discussion on technical issues related to METS implementation, METS profiles, and use of external schemas with METS.


<!-- Footnotes themselves at the bottom. -->
## Notes

[^1]:
    	 The use of the term “repository” in the METS context usually refers to institutions collecting “library-like” digital materials, but  can also include digital  libraries of course-related content, data-sets, and other scientific materials as well as the digital resources of archives and museums.  

[^2]:
    	 Those institutions taking part in these discussions were: New York University (host), Columbia University, Cornell University, Harvard University, Library of Congress, METAe project of the European Commission’s 5<sup>th</sup> Framework program, CCS docWorks, Michigan State University, National Archives and Records Administration, New York Public Library, San Diego Supercomputer Center, University of California Berkeley, University of California Los Angeles, University of Chicago, University of Virginia.  
