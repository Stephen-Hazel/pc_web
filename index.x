<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <meta name="viewport" content=
       "width=device-width initial-scale=1 user-scalable=yes">
 <meta name="robots"      content="follow, all">
 <meta name="keywords"    content="PianoCheetah, software, piano practice,">
 <meta name="description" content=
       "PianoCheetah - Add fun to your piano practice">
 <title>PianoCheetah - Add fun to your piano practice</title>
 <link href="https://PianoCheetah.app/favicon.ico" rel="Shortcut Icon" />
 <link href="css/mytheme.css"                 rel="stylesheet" />
 <link href="css/jquery.mobile.icons.css"     rel="stylesheet" />
 <link href="css/jquery.mobile.structure.css" rel="stylesheet" />
 <link href="css/style.css"                   rel="stylesheet" />
 <script src="js/jquery.js"           ></script>
 <script src="js/jquery.mobile_fix.js"></script>
 <script src="js/jquery.mobile.js"    ></script>
 <script src="js/jquery.jrumble.js"   ></script>
 <script src="js/home.js"             ></script>
 <script type="application/ld+json">
{
   "@context": "https://schema.org",
   "@type": "Organization",
   "url": "https://pianocheetah.app",
   "logo": "https://pianocheetah.app/img/logo.png"
}
 </script>
</head>
<body>
<div data-role="page">
 <div role="main" class="ui-content">

  <div id="hdr" class="ui-grid-b my-resp">
   <div class="ui-block-a">
    <a id="menubtn"
       href="#menu" data-rel="popup" class="ui-btn ui-btn-inline">HERE'S THE DANG menu</a>
    <a id="menuspc"
       href="#menu" data-rel="popup" class="ui-btn ui-btn-inline">HERE'S THE DANG menu</a>
   </div>

   <div class="ui-block-b"><img id="logo" src="img/logo.png"></div>

   <div class="ui-block-c">
    <a href="download/index.html" onClick=
       "ga('send','event','setup','download','x',{'nonInteraction':1});">
     <img id="dl" src="img/dl.png"></a>
   </div>
  </div>

  <div id="blurb">
   <h1>a <a href="linux/index.html">linux</a> app for pop piano n drum practice.</h1>
   It's made for Steve but you may wanna try it.<br><br>
     
   PianoCheetah will help you play your favorite songs.<br>
   Or a part in the song.<br>
   Or play it with your "feel" but way less notes.<br>
   Oh, and it's
   <a href="misc/eula.html"><img id="free" src="img/free.png"></a><br>
  </div>
<!--
  <div id="picker" class="ui-grid-a my-resp">
   <div class="ui-block-a">
    <a href="tutorial/index.html">      
     <h1>Tutorial Videos</h1>
     <img src="img/tutorial.png">
    </a>
   </div>
   <div class="ui-block-b">
    <a href="tutorial/screenshots.html">
     <h1>Screen Shots</h1>
     <img src="img/screenshot.png">
    </a>
   </div>
  </div>
-->
  <div id="foot1" class="ui-grid-b my-resp">
   <div class="ui-block-a">
    <a href="me/index.html"><img id="me" src="img/bot_me.png"></a>
   </div>

   <div class="ui-block-b">
    <div id="addr">
     <h2>Need some help?</h2>
     <strong>Email:</strong>
      <a href="mailto:stephen.hazel@gmail.com?Subject=PianoCheetah"
      >stephen.hazel@gmail.com</a><br>
    </div>
   </div>

   <div class="ui-block-c">
    <div id="contact">
     <h2>Keep In Touch</h2>
     <ul>
      <li><a rel="x" href="https://PianoCheetah.UserVoice.com">
           <img src="img/bot_uservoice.png">UserVoice - ideas</a></li>
      <li><a rel="x" href="https://FaceBook.com/PianoCheetah">
           <img src="img/bot_facebook.png" >FaceBook - blog</a></li>
     </ul>
    </div>
   </div>
  </div>

  <div id="foot2">
   <div id="ft2c">
    <a href="misc/privacy.html">Privacy Policy</a> |
    <a href="misc/eula.html">EULA</a> |
    <a href="misc/uninstall.html">Uninstalling</a>
   </div>
  </div>

 </div>

 <div id="menu" data-role="popup">
  <ul data-role="listview" data-icon="false">
   <li><a href="tutorial/index.html"      >tutorial n docs</a></li>
   <li><a href="piano/index.html"         >...which piano?</a></li>
   <li><a href="practice/index.html"      >...piano practice</a></li>
   <li><a href="midi/index.html"          >...MIDI for newbs</a></li>
   <li><a href="linux/index.html"         >bout linux</a></li>
   <li><a href="me/index.html"            >bout me</a></li>
   <li><a href="shazware/index.html"      >SHazWare</a></li>
  </ul>
 </div>

</div>
</body>
</html>
