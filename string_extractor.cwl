#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: ExpressionTool
label: Extract the location/path of a file

requirements:
  InlineJavascriptRequirement: {}

inputs:
  input_file:
    type: File

outputs:
  output:
    type: string
  output2:
    type: string
  output3:
    type: string
  output4:
    type: string
  output5:
    type: string

expression: |
  ${
  var test= inputs.input_file.location.replace('file://','');
  var test1= test.substr(0,test.lastIndexOf("/"));
  var test3= test.substr(test.lastIndexOf("/")+1);
  test3= test3.substr(0,test3.lastIndexOf('.'));
  if (test3.endsWith(".D") || test3.endsWith(".d") || test3.endsWith(".Wiff") ||test3.endsWith(".wiff") || test3.endsWith(".WIFF")){
    test3= test3.substr(0,test3.lastIndexOf('.'));
  }
  var test4= test3 + "_FileConverter_op.mzML"
  var test5= test1.substr(0,test1.lastIndexOf("/"))+"/fileconverter_cwl.sh";
  return {"output": test, "output2": test1, "output3": test3, "output4": test4, "output5": test5}; }
