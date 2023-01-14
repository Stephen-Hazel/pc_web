/* home.js - jquery init for home page only */

function jRum (id, ix, iy, irot)
{  jQuery('#'+id).jrumble ({x: ix, y: iy, rotation: irot});
   jQuery('#'+id).hover (
      function () { jQuery(this).trigger ('startRumble'); },
      function () { jQuery(this).trigger ('stopRumble' ); }
   );
}


function xLinks ()
// make all links with rel="x"  into target="_blank"
{  if (! document.getElementsByTagName)  return;  // old browser?
  var aLst = document.getElementsByTagName ("a");
   for (var i = 0; i < aLst.length; i++) {
     var an = aLst [i];
     var r  = an.getAttribute ("rel");
      if (r && (r == "x"))  {an.target = "_blank";}
   }
}


$.event.special.hoverintent = {
 setup: function() {
    $(this).bind  ("mouseover", jQuery.event.special.hoverintent.handler);
 },
 teardown: function() {
    $(this).unbind("mouseover", jQuery.event.special.hoverintent.handler);
 },
 handler: function(event) {
   var currentX, currentY, timeout,
       args = arguments,
       target = $(event.target),
       previousX = event.pageX,
       previousY = event.pageY;
    function track (event)  {currentX = event.pageX;
                             currentY = event.pageY;};
    function clear() {
       target.unbind ("mousemove", track)
             .unbind ("mouseout", clear);
       clearTimeout (timeout);
    }
    function handler() {
      var prop,
          orig = event;
       if ((Math.abs (previousX - currentX) +
            Math.abs (previousY - currentY)) < 7) {
          clear ();
          event = $.Event ("hoverintent");
          for (prop in orig)  if (! (prop in event))  event [prop] = orig[prop];
       // Prevent accessing the original event since the new event
       // is fired asynchronously and the old event is no longer
       // usable (#6028)
          delete event.originalEvent;
          target.trigger (event);
       }
       else {
          previousX = currentX;
          previousY = currentY;
          timeout = setTimeout (handler, 100);
       }
    }
    timeout = setTimeout (handler, 100);
    target.bind ({ mousemove: track, mouseout: clear });
 }
};


$(function (){
// $('#menubtn').button ({event: "click hoverintent"});
   xLinks ();
   jRum ('logo', 10, 10, 4);
   jRum ('dl',    0,  8, 0);
   jRum ('free',  2,  0, 0);
});

