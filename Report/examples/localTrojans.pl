#!/usr/bin/perl
package LaBrea::Tarpit::Report::localTrojans;
#
# version 1.21, updated 9-11-04, never complete :-)
#
# find a port by number, try tcp then udp
#
# port assignments can be found at
# http://www.iana.org/assignments/port-numbers
#
# unused trojan lists
# http://www.onctek.com/trojanports.html
#
# some new additionf from
# http://www.dshield.org

# FEEL FREE TO ADD TO BOTH OF THESE TROJAN LISTS
# PLEASE SEND UPDATES TO michael@bizsystems.com
# differences would be appreciated.

use vars qw( $trojans );

$trojans = {
# some well known ports not always in 'services'
  1108	=> 'ratio-adp',
  1115	=> 'ardus-trns',
  1182	=> 'Sobig.a (BigBoss) virus',
  1214	=> 'Kazaa',
  1257	=> 'Frenzy - Frenzy2000',
  1555	=> 'Sobig.e - RTSP Streaming Media Proxy',
  1745	=> 'Qhosts aka (aolfix.exe) trojan',
  1998	=> 'cisco X.25 service',
  2001	=> 'Sobig.e - Remote Control Service',
  2002	=> 'TransScout',
  2003	=> 'TransScout',
  2004	=> 'TransScout',
  2005	=> 'TransScout',
  2280	=> 'Sobig.e - SOCKS Proxy server',
  2281	=> 'Sobig.e - Telnet Proxy server',
  2282	=> 'Sobig.e - WWW Proxy server',
  2283	=> 'Sobig.e - FTP Proxy server',
  2284	=> 'Sobig.e - POP3 Proxy server',
  2285	=> 'Sobig.e - SMTP Server',
  3127	=> 'MyDoom_A',
  3128	=> 'MyDoom',
  3382	=> 'fujitsu-neat',
  3643	=> 'AudioJuggler',
  4480	=> 'proxy-plus',
  4489	=> 'Brown Orifice??',
  5190	=> 'Aol Instant Messenger',
  5191	=> 'Aol Instant Messenger',
  5192	=> 'Aol Instant Messenger',
  5193	=> 'Aol Instant Messenger',
  5433	=> 'postgreSQL, Stunnel',
  5490	=> 'LNVALARM Access',
  5554	=> 'Sasser Worm',
  6346	=> 'Gnutella',
  6588	=> 'AnalogX Proxy Server',
  6660	=> 'IRC Chat',
  6661	=> 'IRC Chat',
  6662	=> 'IRC Chat',
  6663	=> 'IRC Chat',
  6664	=> 'IRC Chat',
  6665	=> 'IRC Chat',
  6666	=> 'IRC Chat',
  6667	=> 'IRC Chat',
  6668	=> 'IRC Chat',
  6669	=> 'IRC Chat',
  7441	=> 'LNVALARM Access',
  8000	=> 'Shoutcast WWW Server Hack',
  8001	=> 'VCOM Tunnel',
  8002	=> 'Teradata ORDMBS',
  8180	=> 'Aplore/Aphex/Bloodhound worm',
  9100	=> 'Backdoor.Cabro',
  10080	=> 'alternate www, MyDoom',
  10168	=> 'Lovgates remote control',
  20168	=> 'Lovgates remote control',
  25867	=> 'Ring0 trojan',
  34816	=> 'Dirt, Backdoor.SubSari15 trojan',
  45295	=> 'Firebird DB trojan',
  43981	=> 'NewareIP',
# these trojans can be found at
# http://www.robertgraham.com/pubs/firewall-seen.html
  555	=> 'phAse zero',
  1243	=> 'Sub-7',
  2745	=> 'Bagle backdoor',
  3129	=> 'Masters Paradise',
  4755	=> 'Bagle-V backdoor',
  6670  => 'Deep Throat',
  6711	=> 'Sub-7',
  6969	=> 'GateCrasher',
  9898	=> 'Dabber Virus backdoor',
  21544	=> 'GirlFriend',
  12345	=> 'NetBus',
  23456	=> 'EvilFTP',
  27374	=> 'Sub-7',
  30100	=> 'NetSphere',
  31789	=> "Hack'aTack",
  31337	=> 'BackOrifice',
  50505	=> 'Sockets de Troie',
  65506	=> 'myDoom proxy',
};


my $builder = sub {
  my($port,@trjs) = @_;
  my $line = '';
  foreach(0..$#trjs) {
    $trjs[$_] =~ s/\s+([\..]+)/$1/;
    while ($trjs[$_] =~ /\s$/) { chop $trjs[$_] };
    if (length($trjs[$_]) + length($line) > 25) {
      if ($line) {
        $line .= ', more...';
      } elsif (length($trjs[$_]) < 37) {
	$line = $trjs[$_];
      } else {
	$line = substr($trjs[$_],0,34) . '...';
      }
      last;
    } else {
      $line .= ', ' if $line;
      $line .= $trjs[$_];
    }
  }
  return($line);
};


# overlay above with below in order

@_ = split('\n',q|
#
# my additions + user contributions
1026 MStask planner
1027 ICQ port trojan
1029 ICQ port trojan
1093 proofd
1094 rootd
1502 T.120
1533 LiveTutor
1718 Gatekeeper Discovery
1719 Gatekeeper RAS
1731 Audio Call Control
1900 MS UPnP
4128 RedShad, RCServer backdoor
4899 Radmin, JDeveloperPro
6129 Dameware
9666 RabbIT2
8004 IExchange https proxy
8005 IExchange https proxy
8081 Tomcat 4 proxy
9273 trojan Wingate 3.0
9274 trojan Wingate 3.0
9275 trojan Wingate 3.0
9276 trojan Wingate 3.0
9277 trojan Wingate 3.0
9278 trojan Wingate 3.0
17300 Milkit trojan
#
# this URL has links to many descriptions of hacks and ports that are
# not listed on it's port list page which are included below.
# ports from: http://www.networkice.com/Advice/Exploits/Ports/default.htm
# some trojans here, some well known ports
27 ETRN
29 msg-icp
31 msg-auth
33 dsp
38 RAP
49 TACACS, Login Host Protocol
50 RMCP, re-mail-ck
59 NFILE
63 whois++
66 sql*net
96 DIXIE
98 linuxconf
106 poppassd
124 SecureID
129 PWDGEN
133 statsrv
135 loc-srv/epmap
144 NewS
152 BFTP
153 SGMP
175 vmnet
180 SLmail admin
218 MPP
259 ESRO
264 FW1_topo
311 Apple WebAdmin
350 MATIP type A
351 MATIP type B
363 RSVP tunnel
366 ODMR (On-Demand Mail Relay)
387 AppleTalk Update-Based Routing Protocol
389 LDAP
407 Timbuktu
434 Mobile IP
443 ssl
444 snpp, Simple Network Paging Protocol
445 SMB
458 QuickTime TV/Conferencing
468 Photuris
500 ISAKMP, pluto
521 RIPng
522 ULS
531 IRC
543 KLogin, AppleShare over IP
545 QuickTime
548 AFP
554 Real Time Streaming Protocol
555 phAse Zero
563 NNTP over SSL
575 VEMMI
581 Bundle Discovery Protocol
593 MS-RPC
608 SIFT/UFT
626 Apple ASIA
631 IPP (Internet Printing Protocol)
635 mountd
636 sldap
642 EMSD
648 RRP (NSI Registry Registrar Protocol)
655 tinc
660 Apple MacOS Server Admin
666 Doom
674 ACAP
687 AppleShare IP Registry
700 buddyphone
705 AgentX for SNMP
901 swat, realsecure
993 s-imap
995 s-pop
1062 Veracity
1080 MyDoom
1085 WebObjects
1227 DNS2Go
1243 SubSeven
1338 Millennium Worm
1352 Lotus Notes
1381 Apple Network License Manager
1417 Timbuktu
1418 Timbuktu
1419 Timbuktu
1433 Microsoft SQL Server
1434 Microsoft SQL Monitor
1494 Citrix ICA Protocol
1503 T.120
1521 Oracle SQL
1525 prospero
1526 prospero
1527 tlisrv
1604 Citrix ICA, MS Terminal Server
1645 RADIUS Authentication
1646 RADIUS Accounting
1680 Carbon Copy
1701 L2TP/LSF
1717 Convoy
1720 H.323/Q.931
1723 PPTP control port
1755 Windows Media .asf
1758 TFTP multicast
1812 RADIUS server
1813 RADIUS accounting
1818 ETFTP
1973 DLSw DCAP/DRAP
1985 HSRP
1999 Cisco AUTH
2001 glimpse
2049 NFS
2064 distributed.net
2065 DLSw
2066 DLSw
2106 MZAP
2140 DeepThroat
2301 Compaq Insight Management Web Agents
2327 Netscape Conference
2336 Apple UG Control
2427 MGCP gateway
2504 WLBS
2535 MADCAP
2543 sip
2592 netrek
2727 MGCP call agent
2628 DICT
2998 ISS Real Secure Console Service Port
3000 Firstclass
3031 Apple AgentVU
3128 squid
3130 ICP
3150 DeepThroat
3264 ccmail
3283 Apple NetAssitant
3288 COPS
3305 ODETTE
3306 mySQL
3389 RDP Protocol (Terminal Server)
3521 netrek
4000 icq, command-n-conquer
4321 rwhois
4333 mSQL
4827 HTCP
5004 RTP
5005 RTP
5010 Yahoo! Messenger
5060 SIP
5190 AIM
5500 securid
5501 securidprop
5423 Apple VirtualUser
5631 PCAnywhere data
5632 PCAnywhere
5800 VNC
5801 VNC
5900 VNC
5901 VNC
6000 X Windows
6112 BattleNet, CDE
6502 Netscape Conference
6667 IRC
6670 VocalTec Internet Phone, DeepThroat
6699 napster
6776 Sub7
6970 RTP
7007 MSBD, Windows Media encoder
7070 RealServer/QuickTime
7778 Unreal
7648 CU-SeeMe
7649 CU-SeeMe
8010 WinGate 2.1
8080 HTTP
8181 HTTP
8383 IMail WWW
8875 napster
8888 napster
10008 cheese worm
11371 PGP 5 Keyserver
13223 PowWow
13224 PowWow
14237 Palm
14238 Palm
18888 LiquidAudio
21157 Activision
23213 PowWow
23214 PowWow
23456 EvilFTP
26000 Quake
27001 QuakeWorld
27010 Half-Life
27015 Half-Life
27960 QuakeIII
30029 AOL Admin
31337 Back Orifice
32777 rpc.walld
40193 Novell
41524 arcserve discovery
45000 Cisco NetRanger postofficed
32773 rpc.ttdbserverd
32776 rpc.spray
32779 rpc.cmsd
38036 timestep
|);

foreach(@_) {
  next unless $_ =~ /^(\d+)\s+(.*)$/;
  $trojans->{$1} = $2;
}

# trojans from 
# http://www.simovits.com/trojans/trojans.html
#
# this is the most comprehensive list of trojans
#
@_ = split(/\n/,q
|port 0 REx
port 1 (UDP) - Sockets des Troie
port 2 Death
port 5 yoyo
port 11 Skun
port 16 Skun
port 17 Skun
port 18 Skun
port 19 Skun
port 20 Amanda
port 21 ADM worm, Back Construction, Blade Runner, BlueFire, Bmail,Cattivik FTP Server, CC Invader, Dark FTP, Doly Trojan, FreddyK,Invisible FTP,KWM, MscanWorm, NerTe, NokNok, Pinochet, Ramen, Reverse Trojan, RTB 666,The Flu, WinCrash, Voyager Alpha Force
port 22 InCommand, Shaft, Skun
port 23 ADM worm, Aphex's Remote Packet Sniffer , AutoSpY, ButtMan, Fire HacKer, My Very Own trojan, Pest, RTB 666, Tiny Telnet Server - TTS,Truva Atl
port 25 Antigen, Barok, BSE, Email Password Sender , Gip, Laocoon, Magic Horse, MBT , Moscow Email trojan, Nimda, Shtirlitz, Stukach, Tapiras, WinPC
port 27 Assasin
port 28 Amanda
port 30 Agent 40421
port 31 Agent 40421, Masters Paradise, Skun
port 37 ADM worm
port 39 SubSARI
port 41 Deep Throat , Foreplay
port 44 Arctic
port 51 Fuck Lamers Backdoor
port 52 MuSka52, Skun
port 53 ADM worm, li0n, MscanWorm, MuSka52
port 54 MuSka52
port 66 AL-Bareki
port 69 BackGate Kit, Nimda, Pasana, Storm, Storm worm, Theef
port 69 (UDP) - Pasana
port 70 ADM worm
port 79 ADM worm, Firehotcker
port 80 711 trojan (Seven Eleven), AckCmd, BlueFire, Cafeini, Duddie, Executor, God Message, Intruzzo , Latinus, Lithium, MscanWorm, NerTe, Nimda, Noob, Optix Lite, Optix Pro , Power, Ramen, Remote Shell ,Reverse WWW Tunnel Backdoor, RingZero, RTB 666, Scalper, Screen Cutter , Seeker, Slapper, Web Server CT , WebDownloader
port 80 (UDP) - Penrox
port 81 Asylum
port 101 Skun
port 102 Delf, Skun
port 103 Skun
port 105 NerTe
port 107 Skun
port 109 ADM worm
port 110 ADM worm
port 111 ADM worm, MscanWorm
port 113 ADM worm, Alicia, Cyn, DataSpy Network X, Dosh, Gibbon, Taskman
port 120 Skun
port 121 Attack Bot, God Message, JammerKillah
port 123 Net Controller
port 137 Chode, Nimda
port 137 (UDP) - Bugbear, Msinit, Opaserv, Qaz
port 138 Chode, Nimda
port 139 Chode, Fire HacKer, Msinit, Nimda, Opaserv, Qaz
port 143 ADM worm
port 146 Infector
port 146 (UDP) - Infector
port 166 NokNok
port 170 A-trojan
port 171 A-trojan
port 200 CyberSpy
port 201 One Windows Trojan
port 202 One Windows Trojan, Skun
port 211 One Windows Trojan
port 212 One Windows Trojan
port 221 Snape
port 222 NeuroticKat, Snape
port 230 Skun
port 231 Skun
port 232 Skun
port 285 Delf
port 299 One Windows Trojan
port 334 Backage
port 335 Nautical
port 370 NeuroticKat
port 400 Argentino
port 401 One Windows Trojan
port 402 One Windows Trojan
port 411 Backage
port 420 Breach
port 443 Slapper
port 445 Nimda
port 455 Fatal Connections
port 511 T0rn Rootkit
port 513 ADM worm
port 514 ADM worm
port 515 MscanWorm, Ramen
port 520 (UDP) - A UDP backdoor
port 555 711 trojan (Seven Eleven), Phase Zero, Phase-0
port 564 Oracle
port 589 Assasin
port 600 SweetHeart
port 623 RTB 666
port 635 ADM worm
port 650 Assasin
port 661 NokNok
port 666 Attack FTP, Back Construction, BLA trojan, NokNok, Reverse Trojan, Shadow Phyre, Unicorn, yoyo
port 667 NokNok, SniperNet
port 668 Unicorn
port 669 DP trojan , SniperNet
port 680 RTB 666
port 692 GayOL
port 700 REx
port 777 Undetected
port 798 Oracle
port 808 WinHole
port 831 NeuroticKat
port 901 Net-Devil, Pest
port 902 Net-Devil, Pest
port 903 Net-Devil
port 911 Dark Shadow, Dark Shadow
port 956 Crat Pro
port 991 Snape
port 992 Snape
port 999 Deep Throat , Foreplay
port 1000 Der Sp�her / Der Spaeher, Direct Connection, GOTHIC Intruder ,Theef
port 1001 Der Sp�her / Der Spaeher, GOTHIC Intruder , Lula, One Windows Trojan, Theef
port 1005 Pest, Theef
port 1008 AutoSpY, li0n
port 1010 Doly Trojan
port 1011 Doly Trojan
port 1012 Doly Trojan
port 1015 Doly Trojan
port 1016 Doly Trojan
port 1020 Vampire
port 1024 Latinus, Lithium, NetSpy, Ptakks
port 1025 AcidkoR, BDDT, DataSpy Network X, Fraggle Rock , KiLo, MuSka52, NetSpy, Optix Pro , Paltalk, Ptakks, Real 2000, Remote Anything, Remote Explorer Y2K, Remote Storm, RemoteNC
port 1025 (UDP) - KiLo, Optix Pro , Ptakks, Real 2000, Remote Anything, Remote Explorer Y2K, Remote Storm, Yajing
port 1026 BDDT, Dark IRC, DataSpy Network X, Delta Remote Access , Dosh, Duddie, IRC Contact, Remote Explorer 2000, RUX The TIc.K
port 1026 (UDP) - Remote Explorer 2000
port 1027 Clandestine, DataSpy Network X, KiLo, UandMe
port 1028 DataSpy Network X, Dosh, Gibbon, KiLo, KWM, Litmus, Paltalk, SubSARI
port 1028 (UDP) - KiLo, SubSARI
port 1029 Clandestine, KWM, Litmus, SubSARI
port 1029 (UDP) - SubSARI
port 1030 Gibbon, KWM
port 1031 KWM, Little Witch, Xanadu, Xot
port 1031 (UDP) - Xot
port 1032 Akosch4, Dosh, KWM
port 1032 (UDP) - Akosch4
port 1033 Dosh, KWM, Little Witch, Net Advance
port 1034 KWM
port 1035 Dosh, KWM, RemoteNC, Truva Atl
port 1036 KWM
port 1037 Arctic , Dosh, KWM, MoSucker
port 1039 Dosh
port 1041 Dosh, RemoteNC
port 1042 BLA trojan
port 1042 (UDP) - BLA trojan
port 1043 Dosh
port 1044 Ptakks
port 1044 (UDP) - Ptakks
port 1047 RemoteNC
port 1049 Delf, The Hobbit Daemon
port 1052 Fire HacKer, Slapper, The Hobbit Daemon
port 1053 The Thief
port 1054 AckCmd, RemoteNC
port 1080 SubSeven 2.2, WinHole, MyDoom
port 1081 WinHole
port 1082 WinHole
port 1083 WinHole
port 1092 Hvl RAT
port 1095 Blood Fest Evolution, Hvl RAT, Remote Administration Tool - RAT
port 1097 Blood Fest Evolution, Hvl RAT, Remote Administration Tool - RAT
port 1098 Blood Fest Evolution, Hvl RAT, Remote Administration Tool - RAT
port 1099 Blood Fest Evolution, Hvl RAT, Remote Administration Tool - RAT
port 1104 (UDP) - RexxRave
port 1111 Daodan, Ultors Trojan
port 1111 (UDP) - Daodan
port 1115 Lurker, Protoss
port 1116 Lurker
port 1116 (UDP) - Lurker
port 1122 Last 2000, Singularity
port 1122 (UDP) - Last 2000, Singularity
port 1133 SweetHeart
port 1150 Orion
port 1151 Orion
port 1160 BlackRat
port 1166 CrazzyNet
port 1167 CrazzyNet
port 1170 Psyber Stream Server , Voice
port 1180 Unin68
port 1183 Cyn, SweetHeart
port 1183 (UDP) - Cyn, SweetHeart
port 1200 (UDP) - NoBackO
port 1201 (UDP) - NoBackO
port 1207 SoftWAR
port 1208 Infector
port 1212 Kaos
port 1215 Force
port 1218 Force
port 1219 Force
port 1221 Fuck Lamers Backdoor
port 1222 Fuck Lamers Backdoor
port 1234 KiLo, Ultors Trojan
port 1243 BackDoor-G, SubSeven , Tiles
port 1245 VooDoo Doll
port 1255 Scarab
port 1256 Project nEXT, RexxRave
port 1272 The Matrix
port 1313 NETrojan
port 1314 Daodan
port 1349 BO dll
port 1369 SubSeven 2.2
port 1386 Dagger
port 1415 Last 2000, Singularity
port 1433 Voyager Alpha Force
port 1441 Remote Storm
port 1492 FTP99CMP
port 1524 Trinoo
port 1560 Big Gluck, Duddie
port 1561 (UDP) - MuSka52
port 1600 Direct Connection
port 1601 Direct Connection
port 1602 Direct Connection
port 1703 Exploiter
port 1711 yoyo
port 1772 NetControle
port 1772 (UDP) - NetControle
port 1777 Scarab
port 1826 Glacier
port 1833 TCC
port 1834 TCC
port 1835 TCC
port 1836 TCC
port 1837 TCC
port 1905 Delta Remote Access
port 1911 Arctic
port 1966 Fake FTP
port 1967 For Your Eyes Only , WM FTP Server
port 1978 (UDP) - Slapper
port 1981 Bowl, Shockrave
port 1983 Q-taz
port 1984 Intruzzo , Q-taz
port 1985 Black Diver, Q-taz
port 1985 (UDP) - Black Diver
port 1986 Akosch4
port 1991 PitFall
port 1999 Back Door, SubSeven , TransScout
port 2000 A-trojan, Der Sp�her / Der Spaeher, Fear, Force, GOTHIC Intruder , Last 2000, Real 2000, Remote Explorer 2000, Remote Explorer Y2K, Senna Spy Trojan Generator, Singularity
port 2000 (UDP) - GOTHIC Intruder , Real 2000, Remote Explorer 2000, Remote Explorer Y2K
port 2001 Der Sp�her / Der Spaeher, Duddie, Glacier, Protoss, Senna Spy Trojan Generator, Singularity, Trojan Cow
port 2001 (UDP) - Scalper
port 2002 Duddie, Senna Spy Trojan Generator, Sensive
port 2002 (UDP) - Slapper
port 2004 Duddie
port 2005 Duddie
port 2023 Ripper Pro
port 2060 Protoss
port 2080 WinHole
port 2101 SweetHeart
port 2115 Bugs
port 2130 (UDP) - Mini BackLash
port 2140 The Invasor
port 2140 (UDP) - Deep Throat , Foreplay , The Invasor
port 2149 Deep Throat
port 2150 R0xr4t
port 2156 Oracle
port 2222 SweetHeart, Way
port 2222 (UDP) - SweetHeart, Way
port 2281 Nautical
port 2283 Hvl RAT
port 2300 Storm
port 2311 Studio 54
port 2330 IRC Contact
port 2331 IRC Contact
port 2332 IRC Contact, Silent Spy
port 2333 IRC Contact
port 2334 IRC Contact, Power
port 2335 IRC Contact
port 2336 IRC Contact
port 2337 IRC Contact, The Hobbit Daemon
port 2338 IRC Contact
port 2339 IRC Contact, Voice Spy
port 2339 (UDP) - Voice Spy
port 2343 Asylum
port 2345 Doly Trojan
port 2407 yoyo
port 2418 Intruzzo
port 2555 li0n, T0rn Rootkit
port 2565 Striker trojan
port 2583 WinCrash
port 2589 Dagger
port 2600 Digital RootBeer
port 2702 Black Diver
port 2702 (UDP) - Black Diver
port 2772 SubSeven
port 2773 SubSeven , SubSeven 2.1 Gold
port 2774 SubSeven , SubSeven 2.1 Gold
port 2800 Theef
port 2929 Konik
port 2983 Breach
port 2989 (UDP) - Remote Administration Tool - RAT
port 3000 InetSpy, Remote Shut, Theef
port 3006 Clandestine
port 3024 WinCrash
port 3031 MicroSpy
port 3119 Delta Remote Access
port 3128 MyDoom, RingZero, Reverse Tunnel
port 3129 Masters Paradise
port 3131 SubSARI
port 3150 Deep Throat , The Invasor, The Invasor
port 3150 (UDP) - Deep Throat , Foreplay , Mini BackLash
port 3215 XHX
port 3215 (UDP) - XHX
port 3292 Xposure
port 3295 Xposure
port 3333 Daodan
port 3333 (UDP) - Daodan
port 3410 Optix Pro
port 3417 Xposure
port 3418 Xposure
port 3456 Fear, Force, Terror trojan
port 3459 Eclipse 2000, Sanctuary
port 3505 AutoSpY
port 3700 Portal of Doom
port 3721 Whirlpool
port 3723 Mantis
port 3777 PsychWard
port 3791 Total Solar Eclypse
port 3800 Total Solar Eclypse
port 3801 Total Solar Eclypse
port 3945 Delta Remote Access
port 3996 Remote Anything
port 3996 (UDP) - Remote Anything
port 3997 Remote Anything
port 3999 Remote Anything
port 4000 Remote Anything, SkyDance
port 4092 WinCrash
port 4128 RedShad
port 4128 (UDP) - RedShad
port 4156 (UDP) - Slapper
port 4201 War trojan
port 4210 Netkey
port 4211 Netkey
port 4225 Silent Spy
port 4242 Virtual Hacking Machine - VHM
port 4315 Power
port 4321 BoBo
port 4414 AL-Bareki
port 4442 Oracle
port 4444 CrackDown, Oracle, Prosiak, Swift Remote
port 4445 Oracle
port 4447 Oracle
port 4449 Oracle
port 4451 Oracle
port 4488 Event Horizon
port 4567 File Nail
port 4653 Cero
port 4666 Mneah
port 4700 Theef
port 4836 Power
port 5000 Back Door Setup, Bubbel, Ra1d, Sockets des Troie
port 5001 Back Door Setup, Sockets des Troie
port 5002 Shaft
port 5005 Aladino
port 5011 Peanut Brittle
port 5025 WM Remote KeyLogger
port 5031 Net Metropolitan
port 5032 Net Metropolitan
port 5050 R0xr4t
port 5135 Bmail
port 5150 Pizza
port 5151 Optix Lite
port 5152 Laphex
port 5155 Oracle
port 5221 NOSecure
port 5250 Pizza
port 5321 Firehotcker
port 5333 Backage
port 5350 Pizza
port 5377 Iani
port 5400 Back Construction, Blade Runner, Digital Spy
port 5401 Back Construction, Blade Runner, Digital Spy , Mneah
port 5402 Back Construction, Blade Runner, Digital Spy , Mneah
port 5418 DarkSky
port 5419 DarkSky
port 5419 (UDP) - DarkSky
port 5430 Net Advance
port 5450 Pizza
port 5503 Remote Shell
port 5534 The Flu
port 5550 Pizza
port 5555 Daodan, NoXcape
port 5555 (UDP) - Daodan
port 5556 BO Facil
port 5557 BO Facil
port 5569 Robo-Hack
port 5650 Pizza
port 5669 SpArTa
port 5679 Nautical
port 5695 Assasin
port 5696 Assasin
port 5697 Assasin
port 5742 WinCrash
port 5802 Y3K RAT
port 5873 SubSeven 2.2
port 5880 Y3K RAT
port 5882 Y3K RAT
port 5882 (UDP) - Y3K RAT
port 5888 Y3K RAT
port 5888 (UDP) - Y3K RAT
port 5889 Y3K RAT
port 5933 NOSecure
port 6000 Aladino, NetBus , The Thing
port 6006 Bad Blood
port 6267 DarkSky
port 6400 The Thing
port 6521 Oracle
port 6526 Glacier
port 6556 AutoSpY
port 6661 Weia-Meia
port 6666 AL-Bareki, KiLo, SpArTa
port 6666 (UDP) - KiLo
port 6667 Acropolis, BlackRat, Dark FTP, Dark IRC, DataSpy Network X, Gunsan, InCommand, Kaitex, KiLo, Laocoon, Net-Devil, Reverse Trojan, ScheduleAgent, SlackBot, SubSeven , Subseven 2.1.4 DefCon 8, Trinity, Y3K RAT, yoyo
port 6667 (UDP) - KiLo
port 6669 Host Control, Vampire, Voyager Alpha Force
port 6670 BackWeb Server, Deep Throat , Foreplay , WinNuke eXtreame
port 6697 Force
port 6711 BackDoor-G, Duddie, KiLo, Little Witch, Netkey, Spadeace, SubSARI, SubSeven , SweetHeart, UandMe, Way, VP Killer
port 6712 Funny trojan, KiLo, Spadeace, SubSeven
port 6713 KiLo, SubSeven
port 6714 KiLo
port 6715 KiLo
port 6718 KiLo
port 6723 Mstream
port 6766 KiLo
port 6766 (UDP) - KiLo
port 6767 KiLo, Pasana, UandMe
port 6767 (UDP) - KiLo, UandMe
port 6771 Deep Throat , Foreplay
port 6776 2000 Cracks, BackDoor-G, SubSeven , VP Killer
port 6838 (UDP) - Mstream
port 6891 Force
port 6912 Shit Heep
port 6969 2000 Cracks, BlitzNet, Dark IRC, GateCrasher, Kid Terror, Laphex, Net Controller, SpArTa, Vagr Nocker
port 6970 GateCrasher
port 7000 Aladino, Gunsan, Remote Grab, SubSeven , SubSeven 2.1 Gold, Theef
port 7001 Freak88, Freak2k
port 7007 Silent Spy
port 7020 Basic Hell
port 7030 Basic Hell
port 7119 Massaker
port 7215 SubSeven , SubSeven 2.1 Gold
port 7274 AutoSpY
port 7290 NOSecure
port 7291 NOSecure
port 7300 NetSpy
port 7301 NetSpy
port 7306 NetSpy
port 7307 NetSpy, Remote Process Monitor
port 7308 NetSpy, X Spy
port 7312 Yajing
port 7410 Phoenix II
port 7424 Host Control
port 7424 (UDP) - Host Control
port 7597 Qaz
port 7626 Glacier
port 7648 XHX
port 7673 Neoturk
port 7676 Neoturk
port 7677 Neoturk
port 7718 Glacier
port 7722 KiLo
port 7777 God Message
port 7788 Last 2000, Last 2000, Singularity
port 7788 (UDP) - Singularity
port 7789 Back Door Setup
port 7800 Paltalk
port 7826 Oblivion
port 7850 Paltalk
port 7878 Paltalk
port 7879 Paltalk
port 7979 Vagr Nocker
port 7983 (UDP) - Mstream
port 8011 Way
port 8012 Ptakks
port 8012 (UDP) - Ptakks
port 8080 Reverse WWW Tunnel Backdoor , RingZero, Screen Cutter
port 8090 Aphex's Remote Packet Sniffer
port 8090 (UDP) - Aphex's Remote Packet Sniffer
port 8097 Kryptonic Ghost Command Pro
port 8100 Back streets
port 8110 DLP
port 8111 DLP
port 8127 9_119, Chonker
port 8127 (UDP) - 9_119, Chonker
port 8130 9_119, Chonker, DLP
port 8131 DLP
port 8301 DLP
port 8302 DLP
port 8311 SweetHeart
port 8322 DLP
port 8329 DLP
port 8488 (UDP) - KiLo
port 8489 KiLo
port 8489 (UDP) - KiLo
port 8685 Unin68
port 8732 Kryptonic Ghost Command Pro
port 8734 AutoSpY
port 8787 Back Orifice 2000
port 8811 Fear
port 8812 FraggleRock Lite
port 8821 Alicia
port 8848 Whirlpool
port 8864 Whirlpool
port 8888 Dark IRC
port 9000 Netministrator
port 9090 Aphex's Remote Packet Sniffer
port 9117 Massaker
port 9148 Nautical
port 9301 DLP
port 9325 (UDP) - Mstream
port 9329 DLP
port 9400 InCommand
port 9401 InCommand
port 9536 Lula
port 9561 Crat Pro
port 9563 Crat Pro
port 9870 Remote Computer Control Center
port 9872 Portal of Doom
port 9873 Portal of Doom
port 9874 Portal of Doom
port 9875 Portal of Doom
port 9876 Rux
port 9877 Small Big Brother
port 9878 Small Big Brother, TransScout
port 9879 Small Big Brother
port 9919 Kryptonic Ghost Command Pro
port 9999 BlitzNet, Oracle, Spadeace
port 10000 Oracle, TCP Door, XHX
port 10000 (UDP) - XHX
port 10001 DTr, Lula
port 10002 Lula
port 10003 Lula
port 10008 li0n
port 10012 Amanda
port 10013 Amanda
port 10067 Portal of Doom
port 10067 (UDP) - Portal of Doom
port 10084 Syphillis
port 10084 (UDP) - Syphillis
port 10085 Syphillis
port 10086 Syphillis
port 10100 Control Total, GiFt trojan, Scalper
port 10100 (UDP) - Slapper
port 10167 Portal of Doom
port 10167 (UDP) - Portal of Doom
port 10498 (UDP) - Mstream
port 10520 Acid Shivers
port 10528 Host Control
port 10607 Coma
port 10666 (UDP) - Ambush
port 10887 BDDT
port 10889 BDDT
port 11000 DataRape, Senna Spy Trojan Generator
port 11011 Amanda
port 11050 Host Control
port 11051 Host Control
port 11111 Breach
port 11223 Progenic trojan, Secret Agent
port 11225 Cyn
port 11225 (UDP) - Cyn
port 11660 Back streets
port 11718 Kryptonic Ghost Command Pro
port 11831 DarkFace, DataRape, Latinus, Pest, Vagr Nocker
port 11977 Cool Remote Control
port 11978 Cool Remote Control
port 11980 Cool Remote Control
port 12000 Reverse Trojan
port 12310 PreCursor
port 12321 Protoss
port 12321 (UDP) - Protoss
port 12345 Ashley, BlueIce 2000, Mypic , NetBus , Pie Bill Gates, Q-taz, Sensive, Snape, Vagr Nocker, ValvNet , Whack Job
port 12345 (UDP) - BlueIce 2000
port 12346 NetBus
port 12348 BioNet
port 12349 BioNet, The Saint
port 12361 Whack-a-mole
port 12362 Whack-a-mole
port 12363 Whack-a-mole
port 12623 ButtMan
port 12623 (UDP) - ButtMan, DUN Control
port 12624 ButtMan, Power
port 12631 Whack Job
port 12684 Power
port 12754 Mstream
port 12904 Rocks
port 13000 Senna Spy Trojan Generator, Senna Spy Trojan Generator
port 13013 PsychWard
port 13014 PsychWard
port 13028 Back streets
port 13079 Kryptonic Ghost Command Pro
port 13370 SpArTa
port 13371 Optix Pro
port 13500 Theef
port 13753 Anal FTP
port 14194 CyberSpy
port 14285 Laocoon
port 14286 Laocoon
port 14287 Laocoon
port 14500 PC Invader
port 14501 PC Invader
port 14502 PC Invader
port 14503 PC Invader
port 15000 In Route to the Hell, R0xr4t
port 15092 Host Control
port 15104 Mstream
port 15206 KiLo
port 15207 KiLo
port 15210 (UDP) - UDP remote shell backdoor server
port 15382 SubZero
port 15432 Cyn
port 15485 KiLo
port 15486 KiLo
port 15486 (UDP) - KiLo
port 15500 In Route to the Hell
port 15512 Iani
port 15551 In Route to the Hell
port 15695 Kryptonic Ghost Command Pro
port 15845 (UDP) - KiLo
port 15852 Kryptonic Ghost Command Pro
port 16057 MoonPie
port 16484 MoSucker
port 16514 KiLo
port 16514 (UDP) - KiLo
port 16515 KiLo
port 16515 (UDP) - KiLo
port 16523 Back streets
port 16660 Stacheldraht
port 16712 KiLo
port 16761 Kryptonic Ghost Command Pro
port 16959 SubSeven , Subseven 2.1.4 DefCon 8
port 17166 Mosaic
port 17449 Kid Terror
port 17499 CrazzyNet
port 17500 CrazzyNet
port 17569 Infector
port 17593 AudioDoor
port 17777 Nephron
port 18753 (UDP) - Shaft
port 19191 BlueFire
port 19216 BackGate Kit
port 20000 Millenium, PSYcho Files, XHX
port 20001 Insect, Millenium, PSYcho Files
port 20002 AcidkoR, PSYcho Files
port 20005 MoSucker
port 20023 VP Killer
port 20034 NetBus 2.0 Pro, NetBus 2.0 Pro Hidden, Whack Job
port 20331 BLA trojan
port 20432 Shaft
port 20433 (UDP) - Shaft
port 21212 Sensive
port 21544 GirlFriend, Kid Terror
port 21554 Exploiter, FreddyK, Kid Terror, Schwindler, Sensive, Winsp00fer
port 21579 Breach
port 21957 Latinus
port 22115 Cyn
port 22222 Donald Dick, G.R.O.B., Prosiak, Ruler, RUX The TIc.K
port 22223 RUX The TIc.K
port 22456 Clandestine
port 22554 Schwindler
port 22783 Intruzzo
port 22784 Intruzzo
port 22785 Intruzzo
port 23000 Storm worm
port 23001 Storm worm
port 23005 NetTrash, Oxon
port 23006 NetTrash, Oxon
port 23023 Logged
port 23032 Amanda
port 23321 Konik
port 23432 Asylum
port 23456 Clandestine, Evil FTP, Vagr Nocker, Whack Job
port 23476 Donald Dick
port 23476 (UDP) - Donald Dick
port 23477 Donald Dick
port 23777 InetSpy
port 24000 Infector
port 24289 Latinus
port 25002 MOTD
port 25002 (UDP) - MOTD
port 25123 Goy'Z TroJan
port 25555 FreddyK
port 25685 MoonPie
port 25686 DarkFace, MoonPie
port 25799 FreddyK
port 25885 MOTD
port 25982 DarkFace, MoonPie
port 26274 (UDP) - Delta Source
port 26681 Voice Spy
port 27160 MoonPie
port 27184 Alvgus trojan 2000
port 27184 (UDP) - Alvgus trojan 2000
port 27373 Charge
port 27374 Bad Blood, Fake SubSeven, li0n, Ramen, Seeker, SubSeven, SubSeven 2.1 Gold, Subseven 2.1.4 DefCon 8, SubSeven 2.2, SubSeven Muie, The Saint
port 27379 Optix Lite
port 27444 (UDP) - Trinoo
port 27573 SubSeven
port 27665 Trinoo
port 28218 Oracle
port 28431 Hack�a�Tack
port 28678 Exploiter
port 29104 NETrojan, NetTrojan
port 29292 BackGate Kit
port 29559 AntiLamer BackDoor , DarkFace, DataRape, Ducktoy, Latinus, Pest, Vagr Nocker
port 29589 KiLo
port 29589 (UDP) - KiLo
port 29891 The Unexplained
port 29999 AntiLamer BackDoor
port 30000 DataRape, Infector
port 30001 Err0r32
port 30005 Litmus
port 30100 NetSphere
port 30101 NetSphere
port 30102 NetSphere
port 30103 NetSphere
port 30103 (UDP) - NetSphere
port 30133 NetSphere
port 30303 Sockets des Troie
port 30331 MuSka52
port 30464 Slapper
port 30700 Mantis
port 30947 Intruse
port 31320 Little Witch
port 31320 (UDP) - Little Witch
port 31335 Trinoo
port 31336 Butt Funnel
port 31337 ADM worm, Back Fire, Back Orifice (Lm), Back Orifice russian, BlitzNet, BO client, BO Facil, BO2, Freak88, Freak2k, NoBackO
port 31337 (UDP) - Back Orifice, Deep BO
port 31338 Back Orifice, Butt Funnel, NetSpy (DK)
port 31338 (UDP) - Deep BO, NetSpy (DK)
port 31339 Little Witch, NetSpy (DK), NetSpy (DK)
port 31339 (UDP) - Little Witch
port 31340 Little Witch
port 31340 (UDP) - Little Witch
port 31382 Lithium
port 31415 Lithium
port 31416 Lithium
port 31416 (UDP) - Lithium
port 31557 Xanadu
port 31745 BuschTrommel
port 31785 Hack�a�Tack
port 31787 Hack�a�Tack
port 31788 Hack�a�Tack
port 31789 Hack�a�Tack
port 31789 (UDP) - Hack�a�Tack
port 31790 Hack�a�Tack
port 31791 Hack�a�Tack
port 31791 (UDP) - Hack�a�Tack
port 31792 Hack�a�Tack
port 31887 BDDT
port 32000 BDDT
port 32001 Donald Dick
port 32100 Peanut Brittle, Project nEXT
port 32418 Acid Battery
port 32791 Acropolis, Rocks
port 33270 Trinity
port 33333 Prosiak
port 33545 G.R.O.B.
port 33567 li0n, T0rn Rootkit
port 33568 li0n, T0rn Rootkit
port 33577 Son of PsychWard
port 33777 Son of PsychWard
port 33911 Spirit 2000, Spirit 2001
port 34312 Delf
port 34313 Delf
port 34324 Big Gluck
port 34343 Osiris
port 34444 Donald Dick
port 34555 (UDP) - Trinoo (for Windows)
port 35000 Infector
port 35555 (UDP) - Trinoo (for Windows)
port 35600 SubSARI
port 36794 Bugbear
port 37237 Mantis
port 37651 Charge
port 38741 CyberSpy
port 38742 CyberSpy
port 40071 Ducktoy
port 40308 SubSARI
port 40412 The Spy
port 40421 Agent 40421, Masters Paradise
port 40422 Masters Paradise
port 40423 Masters Paradise
port 40425 Masters Paradise
port 40426 Masters Paradise
port 41337 Storm
port 41666 Remote Boot Tool , Remote Boot Tool
port 43720 (UDP) - KiLo
port 44014 Iani
port 44014 (UDP) - Iani
port 44444 Prosiak
port 44575 Exploiter
port 44767 School Bus
port 44767 (UDP) - School Bus
port 45092 BackGate Kit
port 45454 Osiris
port 45632 Little Witch
port 45673 Acropolis, Rocks
port 46666 Taskman
port 46666 (UDP) - Taskman
port 47017 T0rn Rootkit
port 47262 (UDP) - Delta Source
port 47698 KiLo
port 47785 KiLo
port 47785 (UDP) - KiLo
port 47891 AntiLamer BackDoor
port 48004 Fraggle Rock
port 48006 Fraggle Rock
port 48512 Arctic
port 49000 Fraggle Rock
port 49683 Fenster
port 49683 (UDP) - Fenster
port 49698 (UDP) - KiLo
port 50000 SubSARI
port 50021 Optix Pro
port 50130 Enterprise
port 50505 Sockets des Troie
port 50551 R0xr4t
port 50552 R0xr4t
port 50766 Schwindler
port 50829 KiLo
port 50829 (UDP) - KiLo
port 51234 Cyn
port 51966 Cafeini
port 52365 Way
port 52901 (UDP) - Omega
port 53001 Remote Windows Shutdown - RWS
port 54283 SubSeven , SubSeven 2.1 Gold
port 54320 Back Orifice 2000
port 54321 Back Orifice 2000, School Bus , yoyo
port 55165 File Manager trojan, File Manager trojan
port 55555 Shadow Phyre
port 55665 Latinus, Pinochet
port 55666 Latinus, Pinochet
port 56565 Osiris
port 57163 BlackRat
port 57341 NetRaider
port 57785 G.R.O.B.
port 58134 Charge
port 58339 Butt Funnel
port 59211 Ducktoy
port 60000 Deep Throat , Foreplay , Sockets des Troie
port 60001 Trinity
port 60008 li0n, T0rn Rootkit
port 60068 The Thing
port 60411 Connection
port 60551 R0xr4t
port 60552 R0xr4t
port 60666 Basic Hell
port 61115 Protoss
port 61337 Nota
port 61348 Bunker-Hill
port 61440 Orion
port 61603 Bunker-Hill
port 61746 KiLo
port 61746 (UDP) - KiLo
port 61747 KiLo
port 61747 (UDP) - KiLo
port 61748 (UDP) - KiLo
port 61979 Cool Remote Control
port 62011 Ducktoy
port 63485 Bunker-Hill
port 64101 Taskman
port 65000 Devil, Sockets des Troie, Stacheldraht
port 65289 yoyo
port 65421 Alicia
port 65422 Alicia
port 65432 The Traitor (= th3tr41t0r)
port 65432 (UDP) - The Traitor (= th3tr41t0r)
port 65530 Windows Mite
port 65535 RC1 trojan
|.
# add Sobig f varients from http://www.lurhq.com/Sobig-f.html
q
|port 2555 Sobig.f RTSP Streaming Media Proxy
port 3001 Sobig.f Remote Control Service
port 3380 Sobig.f SOCKS Proxy server
port 3381 Sobig.f Telnet Proxy server
port 3382 Sobig.f WWW Proxy server
port 3383 Sobig.f FTP Proxy server
port 3384 Sobig.f POP3 Proxy server
port 3385 Sobig.f SMTP Server
|);

foreach(@_) {
  $_ =~ /port\s+(\d+)\s+(.+)/;
  my $port = $1;
  my $trjs = $2;
  next if $trjs =~ /\(UDP\)/;
  my @trjs = split(",",$trjs);

  $trojans->{$port} = &$builder($port,@trjs);
}

#foreach(sort {$a <=> $b} keys %$trojans) {
#  print "port $_ => $trojans->{$_}\n";
#}


1;
