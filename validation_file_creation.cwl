#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool
label: Create a File for Validation

requirements:
  InlineJavascriptRequirement: {}

baseCommand: ["echo"]

inputs:
  input:
    type: string

  in_dir:
    type: string

  input2:
    type: string

outputs:
  output_file:
    type: File
    format: edam:format_3245
    outputBinding:
      glob: $(inputs.input)_validation_file.yml

  output_dir:
    type: Directory
    outputBinding:
      glob: .
      outputEval: |
        ${
          self[0].basename = inputs.in_dir;
          return self[0]
        }

stdout: $(inputs.input)_validation_file.yml

arguments: ["in_file:\n  class: File\n  path: $(inputs.in_dir)/$(inputs.input).mzML\n  format: http://edamontology.org/format_3245\nin_dir: $(inputs.in_dir)\nin_file1:\n  class: File\n  path: $(inputs.input2)"]


s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-7899-7192
    s:email: mailto:sneumann@ipb-halle.de
    s:name: Steffen Neumann

s:citation: https://dx.doi.org/10.6084/m9.figshare.3115156.v2
s:codeRepository: https://github.com/common-workflow-language/common-workflow-language
s:dateCreated: "2021-6-14"
s:license: https://spdx.org/licenses/MIT

$namespaces:
  s: https://schema.org/
  edam: http://edamontology.org/
$schemas:
  - https://schema.org/version/latest/schemaorg-current-http.rdf
  - http://edamontology.org/EDAM_1.18.owl
