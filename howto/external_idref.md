---
title: Referencing METS elements from external documents
parent: METS How-Tos
---
# Referencing METS elements from external documents

Each element defined in the METS schema for use in a METS instance document has an associated ID attribute. In general, except for the few cases noted above, this ID attribute is optional. However, an ID attribute value can be assigned to identify any METS element in an instance document any time it might be necessary to provide a handle to which this element can be referred to unambiguously from outside the METS document. The implementers of the METS schema did not attempt to anticipate the specific applications in which such handles might be necessary or useful, but simply attempted to ensure that the necessary ID infrastructure was in place to support such element referencing wherever a need might arise.
