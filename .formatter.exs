# Used by "mix format"
locals_without_parens = [
  attr: 3,
  slot: 2,
  slot: 3
]

[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"],
  locals_without_parens: locals_without_parens,
  export: [locals_without_parens: locals_without_parens],
  plugins: [Phoenix.LiveView.HTMLFormatter]
]
