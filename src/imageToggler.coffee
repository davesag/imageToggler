###
  The imageToggler plugin is applied to a collection of containers that, in turn contain
  an image, and assocated text.  This is typically in the form of a Boostrap Media object,
  but does not have to be.

  It works in an analagous manner to the boostrap .popover method, in that it looks
  within the link for data attributes.

  To use it, target the plugin at a container which holds a series of clickable links.
  The links need to date the following data attributes

  data-quote="some simple text"
  data-quote-target="#some-selector"

  When the link is clicked the quote text will be injected into the quote-target as using the jquery.text() method.

  Additionally the activeClass (defined below) is applied to the targeted image,
  and the dimmerClass is allied to all sibling images.

  options
  * activeClass: "imageToggler-bright"
  * dimmerClass: "imageToggler-dim"
  * event:        "click"
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
    @each =>
      $this = $(@)
      $links = $this.find("a").has "img"
      $links.on @options.event, (evt) =>
        evt.preventDefault()
        $target = $(evt.target)
        quoteTargetSelector = $target.data "quote-target"
        $quoteTarget = @.find quoteTargetSelector
        quote = $target.data "quote"
        $quoteTarget.text quote
        $target.addClass(@options.activeClass).removeClass @options.dimmerClass
        # find siblings
        $siblings = $this.find("a").has("img").not("a:eq(#{$target.index()})")
        $siblings.addClass(@options.dimmerClass).removeClass @options.activeClass
        return
      return @ # because it's chainable.

  # defaults
  $.fn.imageToggler.options =
    activeClass: "imageToggler-bright"
    dimmerClass: "imageToggler-dim"
    event:        "click"
) jQuery
