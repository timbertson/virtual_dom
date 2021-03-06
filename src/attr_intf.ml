open Js_of_ocaml

module type S = sig

  (** This type covers both properties and attributes, despite the name. *)
  type t

  (** [create name value] creates a simple string-only attribute *)
  val create : string -> string -> t

  (** [string_property name value] creates a simple string-only property *)
  val string_property : string -> string -> t

  (** [property name value] creates a property with a generic value *)
  val property : string -> Js.Unsafe.any -> t

  val on
    : string
    -> ('e Dom.event Js.t -> unit)
    -> t

  val class_    : string -> t
  val classes   : string list -> t
  val id        : string -> t
  val style     : (string * string) list -> t
  val style_css : string -> t

  val on_focus  : (Dom_html.event Js.t -> unit) -> t
  val on_blur   : (Dom_html.event Js.t -> unit) -> t

  (** [on_input] fires every time the input changes, e.g., whenever a key is pressed in
      the input field.  The current contents are returned as an OCaml string as a
      convenience *)
  val on_input  : (Dom_html.inputElement Js.t -> string -> unit) -> t

  (** [on_change] fires when the input is complete, e.g., when enter is pressed in the
      input field.  The current contents are returned as an OCaml string as a
      convenience *)
  val on_change : (Dom_html.inputElement Js.t -> string -> unit) -> t

  val on_click      : (Dom_html.mouseEvent Js.t -> unit) -> t
  val on_mousemove  : (Dom_html.mouseEvent Js.t -> unit) -> t
  val on_mouseup    : (Dom_html.mouseEvent Js.t -> unit) -> t
  val on_mousedown  : (Dom_html.mouseEvent Js.t -> unit) -> t
  val on_mouseenter : (Dom_html.mouseEvent Js.t -> unit) -> t
  val on_mouseleave : (Dom_html.mouseEvent Js.t -> unit) -> t
  val on_mouseover  : (Dom_html.mouseEvent Js.t -> unit) -> t
  val on_mouseout   : (Dom_html.mouseEvent Js.t -> unit) -> t

  val on_keyup    : (Dom_html.keyboardEvent Js.t -> unit) -> t
  val on_keypress : (Dom_html.keyboardEvent Js.t -> unit) -> t
  val on_keydown  : (Dom_html.keyboardEvent Js.t -> unit) -> t
end

