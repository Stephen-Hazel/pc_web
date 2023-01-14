$(document).bind ('mobileinit', function () {
// $.mobile.changePage.defaults.changeHash = false;
   $.mobile.ajaxEnabled          = false;        // don't hijack links !!
   $.mobile.pushStateEnabled     = false;
   $.mobile.hashListeningEnabled = false;
});
