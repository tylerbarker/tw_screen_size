# TwScreenSize

![tw_screen_size_gif](https://pub-0bd602de4141434f899c6f284446e48a.r2.dev/twScreenSize.gif)

A tiny LiveView widget showing the current screen dimensions and Tailwind breakpoint. Ported from [Shayan Taslim](https://github.com/Sh4yy)'s React implementation (see [Gist](https://gist.github.com/Sh4yy/0300299ae60af4910bcb341703946330)).

## Installation

Prerequisites: Your LiveView application must already be using TailwindCSS.

1. Install the package from Hex by adding `tw_screen_size` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tw_screen_size, "~> 1.1.0"}
  ]
end
```

2. Ensure Tailwind searches for styles in the `tw_screen_size` package:

```js
// assets/tailwind.config.js
module.exports = {
  content: [
    "../deps/tw_screen_size/**/*.{ex,js}", // <--- Add this line
  ],
  ...
}
```

3. Import and integrate the `TwScreenSizeHook` in your `app.js`:

```js
// assets/app.js

// import the hook
import { TwScreenSizeHook } from "../../deps/tw_screen_size/assets/js/hooks";

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: { ...OtherHooks, TwScreenSizeHook }, // <--- Add TwScreenSizeHook here
  params: { _csrf_token: csrfToken },
});
```

4. Extend your `dev.exs` configuration to enable the component in development only:

```elixir
# dev.exs
config :my_app, tw_screen_size: true
```

5. Import TwScreenSize, and add the component to your root layout:

```elixir
# layouts.ex
defmodule MyAppWeb.Layouts do
  use MyAppWeb, :html
  import TwScreenSize

  embed_templates "layouts/*"
end
```

```heex
<!-- root.html.heex -->
<!-- ... -->
<body class="antialiased bg-white">
  <%= @inner_content %>
  <.tw_screen_size :if={Application.get_env(:my_app, :tw_screen_size)} />
</body>
```

## Opacity Timeout

The component is always visible by default. If you'd prefer it to appear temporarily on the first page-load, and on screen resizes, you can set the `:opacity_timeout` attribute:

```elixir
<.tw_screen_size
  :if={Application.get_env(:my_app, :tw_screen_size)}
  opacity_timeout={3000}
/>
```

## All Attributes

```elixir
attr :base_class, :string,
  default:
    "items-center space-x-2 rounded-full bg-black px-2.5 py-1 font-mono text-xs font-medium text-white",
  doc:
    "Override the default styling with a custom class. This is appended to the always required classes: `hidden fixed opacity-0 transition-opacity z-[999]`."

attr :placement_class, :string,
  default: "bottom-5 left-5",
  doc:
    "Classes to determine where the screen size component is placed on the screen. Defaults to `bottom-5 left-5`."

attr :transition_duration_class, :string,
  default: "duration-300",
  doc: "The Tailwind transition duration class. Defaults to `duration-300`."

attr :opacity_timeout, :integer,
  doc:
    "Make the component 100% transparent after this timeout in milliseconds. Becomes visible on initial page load and during resizes. Disabled by default."
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/tw_screen_size>.
