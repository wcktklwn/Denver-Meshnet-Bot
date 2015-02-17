bind join - "#denvermeshnet *@*" meshnet:greet

proc meshnet:greet {nick mask hand chan} {
    global botnick
    if {$nick==$botnick} {return 0}
    if {![validuser [nick2hand $nick]]} {
       putquick "PRIVMSG $chan :Hello $nick, Welcome to Denver Meshnet! If you have any questions, please ask them in the channel and we will get to them as soon as possible!."
       return 0
    }
}

bind pub - !help meshnet:help

proc meshnet:help {nick host handle chan text} {
	if {$chan == #denvermeshnet} {
		putserv "NOTICE $nick :Hello $nick, Here are some of the commands I am trained on."
		putserv "NOTICE $nick :!contact - Contact Info"
		putserv "NOTICE $nick :!peer - How to get peered"
	}
}

bind pub - !contact meshnet:contact

proc meshnet:contact {nick host handle chan text} {
	if {$chan == #denvermeshnet} {
		putserv "NOTICE $nick :If you find that we are not responding fast enough in IRC, you can email my owner at: denvermeshnet@h4x0.red"
	}
}

bind pub - !peer meshnet:peer

proc meshnet:peer {nick host handle chan text} {
	if {$chan == #denvermeshnet} {
		putserv "NOTICE $nick :To get peered send me a secure email using 0x0763A3AF. I will need information similar to the following link:"
		putserv "NOTICE $nick :https://github.com/ProjectMeshnet/documentation/blob/master/faq/peering.md#what-information-should-i-provide-with-my-peering-credentials"
	}
}

putlog "Meshnet Script Loading..."