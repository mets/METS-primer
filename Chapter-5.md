


# Chapter 5:  Profiles



## **Purpose of METS Profiles**
One of the most advantageous features of the METS schema is its flexibility; it can be adapted to fit local practice as well as locally-developed tools and work flows.  This same flexibility can also be a disadvantage, however, when institutions are looking to transfer METS files between and among each other for any number of purposes.  As a mechanism to allow flexibility, but also to establish common practice among METS users, a METS profile schema has been developed along with a formal registration process that makes the profiles visible to others looking to implement and/or share data and metadata among those using a given profile.  



## **Components of a METS Profile**
A METS profile can accomplish a number of purposes for an institution and for the METS community at large. The METS website provides a description of the components of a METS profile [http://www.loc.gov/standards/mets/profile_docs/components.html], and the full set of elements specified and required by the profile schema.  By making use of all the components, an institution not only declares how it builds a METS document of a certain digital object type, or for a specific application or purpose, but can also provide an implicit description of the data model used for internal METS document creators, METS tool developers, and external recipients of their METS documents.  This information can be an invaluable means to convey succinctly the critical information necessary to disaggregate a METS document for disposal within another institutional repository, for instance, or for the use of searching, navigating, displaying, and rendering applications or tools.  Note that while the profile scheme is expressed as an XML schema (.xsd), it is nevertheless designed to provide a _narrative_ description of the way the declared class of METS documents are intended to be created rather than a machine-actionable method for judging conformance to the profile.

## **Profile Development**
A sample METS profile document is available in the Profile section of the METS website, [http://www.loc.gov/standards/mets/profile_docs/mets_profile_example.xml] as well as within each of the profiles registered on the METS site [http://www.loc.gov/standards/mets/mets-registered-profiles.html].  For an excellent explication of the issues faced in constructing one of the profiles registered by the Library of Congress, see a presentation made by Morgan Cundiff from the Network Standards and Development Office on the METS website.  

The METS Editorial Board strongly encourages institutions to register the profiles that they are using within their institutions for the purposes of not only of sharing METS documents, but also to establish common practice among institutions.  Recognizing, however, that institutions are often reluctant to register formally a profile until its use has been tested within a local institution, and perhaps among several institutions, a METS Profile Playground has been established on the METS wiki.  The METS Profile Playground is envisioned as a place where entire drafts or discrete components of a draft profile can be posted for discussion.  For instance, members of the METS community may be interested in exploring various ways to describe the logical and physical structures of similar digital objects.  

Questions or issues related to creating a METS profile can also be directed to the METS listserv and the METS listserv archives [http://sun8.loc.gov/listarch/mets.html]  



## **Profile Registration**
Once an institution is ready to register formally its profile, the process is fairly simple. The profile is first vetted for technical compliance with a subset of the METS Editorial Board, and then made available to the full METS community on the METS listserv for a short period of time.  If no serious objections or concerns are expressed by either the Board or the METS community, the profile receives registration status and is listed on the METS website.  Both current and deprecated versions of profiles are included on the METS website in case others in the METS community are relying upon a previous version of a registered schema.  More specific documentation of the elements of the METS profile schema [http://www.loc.gov/standards/mets/profile_docs/mets.profile.v1-2.html] can also be found on the METS website.