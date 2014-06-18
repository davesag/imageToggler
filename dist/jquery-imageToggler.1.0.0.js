/*!
 * A jQuery plugin for toggling images written in Coffeescript - v1.0.0 - 2014-06-18
 * https://github.com/maxwellforest/imageToggler
 * Copyright (c) 2014 Dave Sag; Licensed Proprietary to Maxwell Forest
 */
(function() {
  if (typeof jQuery !== "function") {
    throw "Expected jQuery to have been loaded before this script.";
  }

  (function($) {
    $.fn.imageToggler = function(options) {
      var opts;
      opts = $.extend(true, {}, $.fn.imageToggler.options);
      this.options = typeof options === "object" ? $.extend(true, opts, options) : opts;
      return this.each((function(_this) {
        return function() {
          var $links, $this;
          $this = $(_this);
          $links = $this.find("a").has("img");
          $links.on(_this.options.event, function(evt) {
            var $quoteTarget, $siblings, $target, quote, quoteTargetSelector;
            evt.preventDefault();
            $target = $(evt.target);
            quoteTargetSelector = $target.data("quote-target");
            $quoteTarget = _this.find(quoteTargetSelector);
            quote = $target.data("quote");
            $quoteTarget.text(quote);
            $target.addClass(_this.options.activeClass).removeClass(_this.options.dimmerClass);
            $siblings = $this.find("a").has("img").not("a:eq(" + ($target.index()) + ")");
            $siblings.addClass(_this.options.dimmerClass).removeClass(_this.options.activeClass);
          });
          return _this;
        };
      })(this));
    };
    return $.fn.imageToggler.options = {
      activeClass: "imageToggler-bright",
      dimmerClass: "imageToggler-dim",
      event: "click"
    };
  })(jQuery);

}).call(this);
