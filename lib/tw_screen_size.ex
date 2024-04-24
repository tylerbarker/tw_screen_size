defmodule TwScreenSize do
  @moduledoc """
  Documentation for `TwScreenSize`. A tiny, one-component package for LiveView x Tailwind to elevate your design iteration experience.
  """
  use Phoenix.Component

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

  def tw_screen_size(assigns) do
    ~H"""
    <div
      id="tw-screen-size"
      phx-update="ignore"
      phx-hook="TwScreenSizeHook"
      data-opacity-timeout={opacity_timeout(assigns)}
      class={"hidden fixed opacity-0 transition-opacity z-[999] #{@transition_duration_class} #{@placement_class} #{@base_class}"}
    >
      <span class="">
        <span id="tw-screen-size-width">0</span> x <span id="tw-screen-size-height">0</span>
      </span>
      <div class="h-4 w-px bg-gray-800" />
      <span class="sm:hidden">XS</span>
      <span class="hidden sm:max-md:inline">SM</span>
      <span class="hidden md:max-lg:inline">MD</span>
      <span class="hidden lg:max-xl:inline">LG</span>
      <span class="hidden xl:max-2xl:inline">XL</span>
      <span class="max-2xl:hidden">2XL</span>
    </div>
    """
  end

  defp opacity_timeout(%{opacity_timeout: timeout}) when is_integer(timeout), do: "#{timeout}"
  defp opacity_timeout(%{opacity_timeout: timeout}) when is_binary(timeout), do: timeout
  defp opacity_timeout(_), do: ""
end
