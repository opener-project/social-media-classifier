Feature: Using a file as input and another file as an output
  In order to classify a set
  Using a file as an input
  Using a file as an output

  Scenario Outline: classify input file.
    Given the fixture file "<input_file>"
    And I put them through the kernel
    Then the output should match the fixture "<output_file>"
  Examples:
    | input_file | output_file |
    | input.arff | output.arff |
