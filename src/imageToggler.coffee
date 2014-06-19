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

  Note: to find the siblings this plugin assumes that every image has a unique src attribute.

  options
  * activeClass: "imageToggler-bright"
  * dimmerClass: "imageToggler-dim"
  * event:        "click"
###

throw "Expected jQuery to have been loaded before this script."  if typeof jQuery isnt "function"
(($) ->

  uniqueSrcs = (imgs) ->
    srcs = []
    imgs.each ->
      src = $(this).attr("src")
      srcs.push src if srcs.indexOf src is -1
    return srcs.length is imgs.length

  # Main jQuery Collection method.
  $.fn.imageToggler = (options) ->
    opts = $.extend true, {}, $.fn.imageToggler.options
    @options = if typeof options is "object"
      $.extend(true, opts, options)
    else
      opts
    @each =>
      $this = $(@)
      $imgs = $this.find("a img")
      throw "Expected all img srcs to be unique" unless uniqueSrcs $imgs
      $imgs.on @options.event, (evt) =>
        evt.preventDefault()
        $target = $(evt.target)
        $link = $target.parent("a")
        quoteTargetSelector = $link.data "quote-target"
        $quoteTarget = @.find quoteTargetSelector
        quote = $link.data "quote"
        $quoteTarget.text quote
        $target.addClass(@options.activeClass).removeClass @options.dimmerClass
        # find siblings
        src = $target.attr("src")
        $siblings = $this.find("a img").not("a img[src='#{src}']")
        $siblings.addClass(@options.dimmerClass).removeClass @options.activeClass
        return
      return @ # because it's chainable.

  # defaults
  $.fn.imageToggler.options =
    activeClass: "imageToggler-bright"
    dimmerClass: "imageToggler-dim"
    event:        "click"
) jQuery
