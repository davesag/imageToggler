/*!
 * A jQuery plugin for toggling images written in Coffeescript - v1.0.0 - 2014-06-20
 * https://github.com/davesag/imageToggler
 * Copyright (c) 2014 Dave Sag; Licensed MIT
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
          var $imgs, $this;
          $this = $(_this);
          $imgs = $this.find("a img");
          $imgs.on(_this.options.event, function(evt) {
            var $link, $quoteTarget, $siblings, $target, quote, quoteTargetSelector;
            evt.preventDefault();
            $target = $(evt.target);
            $link = $target.parent("a");
            quoteTargetSelector = $link.data("quote-target");
            $quoteTarget = _this.find(quoteTargetSelector);
            quote = $link.data("quote");
            $quoteTarget.text(quote);
            $imgs.removeClass("" + _this.options.dimmerClass + " " + _this.options.activeClass);
            $target.addClass(_this.options.activeClass);
            $siblings = $this.find("a img").not("." + _this.options.activeClass);
            $siblings.addClass(_this.options.dimmerClass);
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
