$(document).on('turbolinks:load', function() {
  Turbolinks.BrowserAdapter.prototype.showProgressBarAfterDelay = function() {
    return this.progressBarTimeout = setTimeout(this.showProgressBar, 10);
  };

  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
}).on("click", "tr[data-href] td", function(e) {
  var td = $(this);

  if (td.find(".btn").length === 0) {
    Turbolinks.visit(td.parents("tr:first").data("href"));
  }
}).on("click", "li[data-href], div[data-href]", function() {
  Turbolinks.visit($(this).data("href"));
})
