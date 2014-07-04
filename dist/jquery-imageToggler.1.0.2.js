/*!
 * A jQuery plugin for toggling images written in Coffeescript - v1.0.2 - 2014-07-04
 * https://github.com/davesag/imageToggler
 * Copyright (c) 2014 Dave Sag; Licensed MIT
 */
(function() {
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
          if (_this.options.hideOthers) {
            $imgs.each(function(index, img) {
              var qt;
              qt = $(img).parent("a").data("quote-target");
              return $(qt).hide();
            });
          }
          $imgs.on(_this.options.event, function(evt) {
            var $div, $link, $quoteTarget, $target, quote, quoteTargetSelector;
            evt.preventDefault();
            $target = $(evt.target);
            $link = $target.parent("a");
            quoteTargetSelector = $link.data("quote-target");
            $quoteTarget = _this.find(quoteTargetSelector);
            quote = $link.data("quote");
            $quoteTarget.text(quote);
            $div = $target.closest("div");
            if (_this.options.hideOthers) {
              $(quoteTargetSelector).show();
              $div.siblings("div").each(function(index, sibling) {
                var elem, quoteTarget;
                elem = $(sibling).find("[data-quote-target]");
                quoteTargetSelector = elem.attr("data-quote-target");
                quoteTarget = $(sibling).find(quoteTargetSelector);
                return quoteTarget.hide();
              });
              $div.show();
            } else {
              $div.parent().children("div").removeClass("" + _this.options.dimmerClass + " " + _this.options.activeClass);
              $div.addClass(_this.options.activeClass);
              $div.siblings("div").addClass(_this.options.dimmerClass);
            }
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
