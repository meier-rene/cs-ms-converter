#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow
label: For conversion purpose

inputs:
  in_file:
    type: File
    label: mzXML or vendor file format
    format: edam:format_3245
  
  in_file1:
    type: File
  
  in_file2:
    type: File

 # parameters:
  #  type: string[]
   # default: [mzML]

steps:
  step1:
    run: string_extractor.cwl
    in:
      input_file: in_file
    out: [output, output2, output3, output4, output5]

  step2:
    run: msconvert.cwl
    in:
      in_file1: in_file1
      in_file: in_file
      in_file2: in_file2
      in_dir: step1/output2
    out: [output_dir]
  
  step3:
    run: validation_file_creation.cwl
    in:
      input: step1/output3
      in_dir: step1/output2
      input2: step1/output5
    out: [output_dir]


outputs:
  outputA:
    type: string
    outputSource: step1/output

  outputB:
    type: string
    outputSource: step1/output4

  outputC:
    type: Directory
    outputSource: step2/output_dir

  outputD:
    type: Directory
    outputSource: step3/output_dir


$namespaces:
  s: https://schema.org/
  edam: http://edamontology.org/
$schemas:
  - https://schema.org/version/latest/schemaorg-current-http.rdf
  - http://edamontology.org/EDAM_1.18.owl