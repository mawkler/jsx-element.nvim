; extends

; Self closing tags
(jsx_self_closing_element
  name: (identifier)
  .
  (_) @jsx_element.inner
  (_)* @jsx_element.inner
  (#set! "jsx_element.inner")) @jsx_element.outer

; Paired tags
(jsx_element
  open_tag: (_)
  .
  (_) @jsx_element.inner
  (_)* @jsx_element.inner
  .
  close_tag: (_)
  (#set! "jsx_element.inner")) @jsx_element.outer
