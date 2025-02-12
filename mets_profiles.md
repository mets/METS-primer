---
title: METS Profiles
nav_order: 7
---
# METS Profiles
(Text only moved from Primer version 1, chapter 5)
## TODO
* [ ] update [description of the components of a METS profile](http://www.loc.gov/standards/mets/profile_docs/components.html) for METS 2
* [ ] update http://www.loc.gov/standards/mets/profile_docs/mets_profile_example.xml] for METS 2
* [ ] issue template for METS-profiles
* [ ] pull request template /more detailed instructions for METS-profiles
* [ ] README for METS-profiles repository

***
## **Purpose of METS Profiles**
One of the most advantageous features of the METS schema is its flexibility; it can be adapted to fit local practice as well as locally-developed tools and work flows.  This same flexibility can also be a disadvantage, however, when institutions are looking to transfer METS files between and among each other for any number of purposes.  As a mechanism to allow flexibility, but also to establish common practice among METS users, a METS profile schema has been developed along with a process to make the profiles visible to others looking to implement and/or share data and metadata among those using a given profile.

## **Components of a METS Profile**

A METS profile can accomplish a number of purposes for an institution and for the METS community at large. The METS website provides a [description of the components of a METS profile](http://www.loc.gov/standards/mets/profile_docs/components.html), and the [full set of elements](https://mets.github.io/METS2_Profile_Docs/METS2_profile.html) specified and required by the profile schema.  By making use of all the components, an institution not only declares how it builds a METS document of a certain digital object type, or for a specific application or purpose, but can also provide an implicit description of the data model used for internal METS document creators, METS tool developers, and external recipients of their METS documents.  This information can be an invaluable means to convey succinctly the critical information necessary to disaggregate a METS document for disposal within another institutional repository, for instance, or for the use of searching, navigating, displaying, and rendering applications or tools.  Note that while the profile scheme is expressed as an XML schema (`.xsd`), it is primarily designed to provide a _narrative_ description of the way the declared class of METS documents are intended to be created. Optionally, a profile can include machine-actionable tests for judging conformance to the profile, but these are not required.

## **Profile Development**

A [sample METS profile document](http://www.loc.gov/standards/mets/profile_docs/mets_profile_example.xml) is available, and [additional example profiles](https://github.com/METS/METS-profiles) created by the community are available as well.

The METS Editorial Board encourages institutions to share the profiles that they are using within their institutions for the purposes of not only of sharing METS documents, but also to establish common practice among institutions. If creators of METS profiles wish to ask questions about a specific sample profile in development, they are encouraged to direct questions to the [METS listserv](https://listserv.loc.gov/cgi-bin/wa?SUBED1=mets&A=1), to review the [METS listserv archives](https://listserv.loc.gov/cgi-bin/wa?A0=METS), or to create an [issue](https://github.com/mets/METS-profiles/issues) or [draft pull request](https://github.com/mets/METS-profiles/pulls) in the [METS-profiles](https://github.com/METS/METS-profiles) repository.

## **Profile Sharing**

The METS Editorial Board maintains a set of publicly available profiles in the [METS-profiles GitHub repository](https://github.com/mets/METS-profiles). When a profile is ready to share, its creator should open a [pull request](https://github.com/mets/METS-profiles/pulls) using the template for profile sharing. The METS editorial board will review it, any other interested parties can also comment; once approved it will be made available in the METS-profiles GitHub repository.
