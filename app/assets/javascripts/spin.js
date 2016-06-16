$.fn.spin = function(opts) {
      this.each(function() {
        var $this = $(this),
          spinner = $this.data('spinner');
        if (spinner) spinner.stop();
        if (opts !== false) {
          opts = $.extend({color: $this.css('color')}, opts);
          spinner = new Spinner(opts).spin(this);
          $this.data('spinner', spinner);
        }
      });
      return this;
    };
    $(function() {
      $(".spinner-link").click(function(e) {
        e.preventDefault();
        $(this).hide();
        var opts = {
          lines: 12, // The number of lines to draw
          length: 7, // The length of each line
          width: 5, // The line thickness
          radius: 10, // The radius of the inner circle
          color: '#fff', // #rbg or #rrggbb
          speed: 1, // Rounds per second
          trail: 66, // Afterglow percentage
          shadow: true // Whether to render a shadow
        };
        $("#spin").show().spin(opts);
        
        
      });
    });