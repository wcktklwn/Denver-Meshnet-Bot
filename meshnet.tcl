bind join - "#denvermeshnet *@*" meshnet:greet

proc meshnet:greet {nick mask hand chan} {
    global botnick
    if {$nick==$botnick} {return 0}
    if {![validuser [nick2hand $nick]]} {
       putquick "PRIVMSG $chan :Hello $nick, Welcome to Denver Meshnet! If you have any questions, please ask them in the channel and we will get to them as soon as possible!."
       return 0
    } else {
    	return 0
    }
}

bind pub - "?" meshnet:info

proc meshnet:info {nick host handle chan arg} {
	if {$chan == "#denvermeshnet"} {
		if {[lindex $arg 0] == "contact"} {
			putserv "NOTICE $nick :If you find that we are not responding fast enough in IRC, you can email my owner at: denvermeshnet@h4x0.red"
			return 0
		} elseif {[lindex $arg 0] == "peer"} {
			putserv "NOTICE $nick :To get peered send me a secure email using 0x0763A3AF. I will need information similar to the following link:"
			putserv "NOTICE $nick :https://github.com/ProjectMeshnet/documentation/blob/master/faq/peering.md#what-information-should-i-provide-with-my-peering-credentials"
			return 0
		} elseif {[lindex $arg 0] == "info"} {
			putserv "NOTICE $nick :Our objective is to create a versatile, decentralized network built on secure protocols for routing traffic over private mesh or public internetworks independent of a central supporting infrastructure."
			putserv "NOTICE $nick :To learn more about Project meshnet please visit: https://projectmeshnet.org"
			return 0
		} else {
			putserv "NOTICE $nick :Hello $nick, Here are some of the commands I am trained on."
			putserv "NOTICE $nick :? info    - Information on Project Meshnet."
			putserv "NOTICE $nick :? peer    - How to get peered."
			putserv "NOTICE $nick :? contact - Contact Info for questions."
			return 0
		}
	} else {
		return 0
	}
}

putlog "Meshnet Script Loading..."