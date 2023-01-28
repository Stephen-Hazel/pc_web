#!/usr/bin/php
<?php
## t.php - quilt pianocheetah's subpages

function Got ($fn)  {return file_exists ($fn);}
function Get ($fn)  {return file_get_contents ($fn);}
function Put ($fn, $s)     {file_put_contents ($fn, $s);}

function LstDir ($p)
{  $lst = [];
   $naw = ['.', '..'];
   $d = dir ($p);
   while (($e = $d->read ()) !== false)
      if (is_dir ("$p/$e") && ! in_array ($e, $naw))  $lst [] = $e;
   return $lst;
}


   $TOP = "/home/sh/_/web/pc";
   $Hdr = Get ("$TOP/_/hdr.html");
   $Trl = Get ("$TOP/_/trl.html");

   $dy = date ('Y-m-d', time ());
   $SM =
"<?xml version='1.0' encoding='UTF-8'?>\n" .
"<urlset xmlns='https://www.sitemaps.org/schemas/sitemap/0.9'\n" .
" xmlns:xsi='https://www.w3.org/2001/XMLSchema-instance'\n" .
" xsi:schemaLocation='https://www.sitemaps.org/schemas/sitemap/0.9 " .
   "https://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd'>\n" .
" <url><loc>https://pianocheetah.app/</loc>" .
   "<changefreq>daily</changefreq><lastmod>$dy</lastmod></url>\n";
foreach (LstDir ($TOP) as $dr)  echo "$dr\n";

   foreach (LstDir ($TOP) as $dr) {
      $path = "$TOP/$dr";
echo "$path\n";
      if (! Got ("$path/_.txt"))  continue;      ## no quiltin here...:/

   ## load _.txt, _menu.txt
      $lst = Get ("$path/_.txt");
      $mnu = Get ("$path/_menu.txt");
      $pg = [];   $tt = [];
      foreach (explode ("\n", $lst) as $ln) {
         if (substr ($ln, 0, 1) == '#')  continue;    ## skip comments

         if ($ln == '')                  continue;

         if (substr ($ln, 0, 1) == '.')
            {$ttDir = substr ($ln, 1);   continue;}   ## title for dir?

         $p = strpos ($ln, ' ');
         if ($p === false)                  ## no title?
            $pg [] = $tt [] = $ln;
         else {
            $pg [] = substr ($ln, 0, $p);   ## page n title
            $tt [] = substr ($ln, $p+1);
         }
      }

   ## quilt pages of my subdir
      foreach ($pg as $pi => $p) {
      ## prep hdr for page:  substitute real titles
         $pHdr = $Hdr;
         $ptt  = $tt [$pi];
         if ((count($pg) > 1) && ($ttDir != ''))  $ptt = "$ttDir - $ptt";
         $pHdr = str_replace ("BLARGH", $ptt, $pHdr);
echo "  $pi) $p\n";

      ## dump in <br>s n junk
         $out = '';
         $li  = 0;
         $aLn = explode ("\n", Get ("$path/$p" . ".txt"));
         foreach ($aLn as $i => $ln) {
#echo "    $i '$ln'\n";
            if ((strlen ($ln) > 3) && (substr ($ln, 0, 3) == " - ")) {
               if ($li)  die ("   unterm'd li !!  (needs cr)  line $i\n");
               $out .= "<div class='bul'>";
               $ln = substr ($ln, 3);   $li = 1;
            }
            $out .= $ln;
            if (($ln == '') && $li)
               {$out .= "</div>";   $li = 0;}
            if ((($i+1) >= count($aLn)) ||
                (substr ($aLn [$i+1], 0, 1) != ' '))
               $out .= "<br>";
            $out .= "\n";
         }

      ## trail nav - link to next,home
         $out .= "\n\n";
         if ($pi+1 < count($pg))  $out .=
"<br><br><br><a id='next' class='ui-btn ui-btn-inline' " .
"href='" . $pg [$pi+1] . ".html'>next: &nbsp;" . $tt [$pi+1] .
"</a>&nbsp;&nbsp;";
         $out .=
## dun't werk  "<a id='menubtn' href='#menu' data-rel='popup' " .
##                "class='ui-btn ui-btn-inline'>menu</a>\n" .
"<a id='home' class='ui-btn ui-btn-inline' href='../index.html'>home</a>\n" .
"<br><br>\n";

         Put ("$path/$p" . ".html",
              "$pHdr\n\n" .
              "$out\n\n" .
              "$mnu\n\n" .
              "$Trl");
         $SM .=
" <url><loc>https://pianocheetah.app/$dr/$p" . ".html</loc>\n" .
"  <changefreq>daily</changefreq><lastmod>$dy</lastmod></url>\n";
      }
   }
   $SM .= "</urlset>\n";
   Put ("$TOP/sitemap.xml", $SM);
