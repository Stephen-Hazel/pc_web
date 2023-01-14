/* sub.js - jquery init for sub page only */

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


$(function (){
   xLinks ();
});

