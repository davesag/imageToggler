###
  The imageToggler plugin is applied to a collection of containers that, in turn contain
  an image, and assocated text.  This is typically in the form of a Boostrap Media object,
  but does not have to be.

  It works in an analagous manner to the boostrap .popover method, in that it looks
  within the link for data attributes.

  

  options


###

throw "Expected jQuery to have been loaded before this script."  if typeof jQuery isnt "function"
(($) ->

  # Main jQuery Collection method.
  $.fn.imageToggler = (options) ->
    opts = $.extend true, {}, $.fn.imageToggler.options
    @options = if typeof options is "object"
      $.extend(true, opts, options)
    else
      opts
    @each ->
      $this = $(@)
  
      
  
      return @ # because it's chainable.

  # defaults
  $.fn.imageToggler.options =
    whatever: true
) jQuery
