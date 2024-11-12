#!/bin/bash
movemd () {
  orig=$1
  new=$2

  echo "Original: '$1' new: '$2'"

  # rename in same directory
  mv "$1.md" "$2.md"

  find . -name "*.md" -print0 | xargs -0 perl -pi -e "s/\\[\\[$1\\]\\]/[$1]($2.md)/"
  find .. -maxdepth 1 -name "*.md" -print0 | xargs -0 perl -pi -e "s/\\[\\[$1\\]\\]/\\[$1\\]\\(cookbook\\/$2.md\\)/"
  find ../mets_sections -maxdepth 1 -name "*.md" -print0 | xargs -0 perl -pi -e "s/\\[\\[$1\\]\\]/\\[$1\\]\\(..\\/cookbook\\/$2.md\\)/"
}

movemd "Alternative identifiers for a digital object" altRecordID
movemd "Describing characteristics of the source material" source_metadata
movemd "Describing digital object content" file
movemd "Describing the digital object with metadata" md
movemd "Descriptive metadata - embedding binary MARC records" binary_marc
movemd "Digital provenance metadata -- PREMIS" premis
movemd "Embedding XML content in METS" xmlData
movemd "Embedding binary data in METS" binData
movemd "Embedding file content" FContent
movemd "Embedding metadata in METS" mdWrap
movemd "File section example - audio and transcription" fileSec_example_audio
movemd "File section example - multiple image representations" fileSec_example_images
movemd "Grouping related files" fileGrp
movemd "Handling 'wrapper' file formats" transformFile
movemd "IDREF linking across different namespaces" idref_namespaces
movemd "Including descriptive metadata with MODS" mods
movemd "Intellectual property rights metadata" mets_rights
movemd "Linking to external resources from METS" locref
movemd "Recording who created or modified a METS document" agent
movemd "Referencing METS elements from external documents" external_idref
movemd "Referencing external files" FLocat
movemd "Referring to Parts of XML Documents" id_idrefs
movemd "Referring to elements within METS" idrefs_within_mets
movemd "Referring to external metadata" mdRef
movemd "Referring to parts of external XML documents" begin_end_betype
movemd "Representing parts of files" stream
movemd "Technical metadata for images" technical_metadata
