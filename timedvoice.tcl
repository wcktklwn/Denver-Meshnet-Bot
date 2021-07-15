# timevoice.tcl v1.0 by |am| on DALnet <tcl@amit.mu> - #dodo @ DALnet
# This is my second script and it's a mixture of slowvoice.tcl and allvoice.tcl from FireEgl and guppy 
# respectively. I needed to make such a script so that this time voice works only for channels specified.
# This script has been tested on an eggdrop1.6.10. So it should work fine on this version of eggdrop or 
# higher.If you find any bug on this script you can email me at the address given above or find me on 
# channel #dodo on DALnet (/server irc.dal.net) or #GigaIRC on GigaIRC (/server irc.gigairc.net)

### Features:
# This script will voice any user who joins a channel specified after a preset time.
# I made this script to prevent voice flooding or for moderated channels which needs 

### Options:
## What is the maximum time for a user to be voiced?
set sv(maxdelay) 99
set sv(delay) 300

## Which channel do you want this script to voice people? If you have more than one channel please leave 
## a space between the channels.(e.g "#chan1 #chan2")
set avchan "#defcon #denhac #denvermeshnet #radio"

### Begin Script:
bind join - * join:sv
proc join:sv {nick host hand chan} { global sv
   utimer $sv(delay) [list sv:voice $nick $host $hand $chan]
   #utimer [rand $sv(maxdelay)] [list sv:voice $nick $host $hand $chan]
}
proc sv:voice {nick host hand chan} {
   global avchan botnick
 if {$nick == $botnick} {return 0}
 if {$avchan == "" && [botisop $chan]} {
  pushmode $chan +v $nick
  return 0
 }
 set chan [string tolower $chan]
 foreach i [string tolower $avchan] {
  if {$i == $chan && [botisop $chan]} {
   pushmode $chan +v $nick
   return 0
  }
 }
}

foreach c "[channels]" { channel set "$c" -autovoice }
catch { unset $c }

putlog "timevoice.tcl v1.0 by |am| on DALnet <tcl@amit.mu> - Loaded"
