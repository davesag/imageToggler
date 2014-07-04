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

  Additionally the activeClass (defined below) is applied to the closest parent div above the targeted image,
  and the dimmerClass is allied to all sibling divs.

  options
  * activeClass: "imageToggler-bright"
  * dimmerClass: "imageToggler-dim"
  * event:        "click"
  * hideOthers:   false

  By default, the other sibling targets are not hidden when a new one is clicked
  on. If you want them to be hidden set `hideOthers` to **true**
###

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
      $imgs = $this.find("a img")
      $imgs.on @options.event, (evt) =>
        evt.preventDefault()
        $target = $(evt.target)
        $link = $target.parent("a")
        quoteTargetSelector = $link.data "quote-target"
        $quoteTarget = @.find quoteTargetSelector
        quote = $link.data "quote"
        $quoteTarget.text quote
        $div = $target.closest("div")
        if @options.hideOthers
          $(quoteTargetSelector).show()
          $div.siblings("div").each (index, sibling) ->
            elem = $(sibling).find("[data-quote-target]")
            quoteTargetSelector = elem.attr("data-quote-target")
            quoteTarget = $(sibling).find quoteTargetSelector
            quoteTarget.hide()
          $div.show()
        else
          $div.parent().children("div").removeClass "#{@options.dimmerClass} #{@options.activeClass}"
          $div.addClass @options.activeClass
          $div.siblings("div").addClass @options.dimmerClass
        return
      return @ # because it's chainable.

  # defaults
  $.fn.imageToggler.options =
    activeClass: "imageToggler-bright"
    dimmerClass: "imageToggler-dim"
    event:        "click"
) jQuery
