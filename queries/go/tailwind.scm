(call_expression
  function: (identifier) @function_identifier
  arguments: (argument_list
    (interpreted_string_literal) @tailwind)
  (#eq? @function_identifier "Class"))

(composite_literal
  type: (qualified_type
    name: (type_identifier) @type_identifier)
  body: (literal_value
    (keyed_element
      (literal_element
        (interpreted_string_literal) @tailwind)))
  (#eq? @type_identifier "Classes"))
