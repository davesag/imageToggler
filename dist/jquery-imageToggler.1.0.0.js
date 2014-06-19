/*!
 * A jQuery plugin for toggling images written in Coffeescript - v1.0.0 - 2014-06-19
 * https://github.com/davesag/imageToggler
 * Copyright (c) 2014 Dave Sag; Licensed MIT
 */
(function() {
  if (typeof jQuery !== "function") {
    throw "Expected jQuery to have been loaded before this script.";
  }

  (function($) {
    var uniqueSrcs;
    uniqueSrcs = function(imgs) {
      var srcs;
      srcs = [];
      imgs.each(function() {
        var src;
        src = $(this).attr("src");
        if (srcs.indexOf(src === -1)) {
          return srcs.push(src);
        }
      });
      return srcs.length === imgs.length;
    };
    $.fn.imageToggler = function(options) {
      var opts;
      opts = $.extend(true, {}, $.fn.imageToggler.options);
      this.options = typeof options === "object" ? $.extend(true, opts, options) : opts;
      return this.each((function(_this) {
        return function() {
          var $imgs, $this;
          $this = $(_this);
          $imgs = $this.find("a img");
          if (!uniqueSrcs($imgs)) {
            throw "Expected all img srcs to be unique";
          }
          $imgs.on(_this.options.event, function(evt) {
            var $link, $quoteTarget, $siblings, $target, quote, quoteTargetSelector, src;
            evt.preventDefault();
            $target = $(evt.target);
            $link = $target.parent("a");
            quoteTargetSelector = $link.data("quote-target");
            $quoteTarget = _this.find(quoteTargetSelector);
            quote = $link.data("quote");
            $quoteTarget.text(quote);
            $target.addClass(_this.options.activeClass).removeClass(_this.options.dimmerClass);
            src = $target.attr("src");
            $siblings = $this.find("a img").not("a img[src='" + src + "']");
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
