"use strict";

(function jalcineMain() {

  var jalcine = (function jalcine() {
    // TODO: This is dirty.
    var self = new Object();
    self.init = function jalcineInit() { };
    return self;
  })();

  $(window).load(function windowOnLoad() {
    jalcine.init();
  });

})();
