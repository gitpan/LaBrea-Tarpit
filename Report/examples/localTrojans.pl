#!/usr/bin/perl
package LaBrea::Tarpit::Report::localTrojans;
#
# version 1.06, updated 5-22-02, never complete :-)
#
# find a port by number, try tcp then upd
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
  6346	=> 'Gnutella',
  8000	=> 'Shoutcast WWW Server Hack',
  10080	=> 'alternate www',
# these trojans can be found at
# http://www.robertgraham.com/pubs/firewall-seen.html
  555	=> 'phAse zero',
  1115	=> 'ardus-trns',
  1243	=> 'Sub-7',
  3129	=> 'Masters Paradise',
  6670  => 'Deep Throat',
  6711	=> 'Sub-7',
  6969	=> 'GateCrasher',
  21544	=> 'GirlFriend',
  12345	=> 'NetBus',
  23456	=> 'EvilFTP',
  27374	=> 'Sub-7',
  30100	=> 'NetSphere',
  31789	=> "Hack'aTack",
  31337	=> 'BackOrifice',
  43981	=> 'NewareIP',
  50505	=> 'Sockets de Troie',
};

# overlay above with below in order

@_ = split('\n',q|
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
999
1062 Veracity
1080 SOCKS
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
5843
6000 X Windows
6112 BattleNet
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
13224
 PowWow
14000
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
# these trojans can be found at
#  http://www.simovits.com/nyheter9902.html
1 (UDP) - Sockets des Troie 
2 Death 
15 B2 
20 Senna Spy FTP server 
21 over a dozen known trojans
22 Adore sshd, Shaft 
23 various known trojans
25 over 2 dozen known trojans
30 Agent 40421 
31 Agent 31, Paradise
39 SubSARI 
41 Deep Throat, Foreplay 
44 Arctic 
48 DRAT 
50 DRAT 
53 ADM worm, Lion 
58 DMSetup 
59 DMSetup 
69 BackGate 
79 CDK, Firehotcker 
80 over 2 dozen known trojans
81 RemoConChubo 
99 various known trojans
110 ProMail trojan 
113 various known trojans
119 Happy99 
121 various known trojans
123 Net Controller 
133 Farnaz 
137 Chode 
137 (UDP) - Msinit, Qaz 
138 Chode 
139 various known trojans
142 NetTaxi 
146 Infector 
146 (UDP) - Infector 
166 NokNok 
170 A-trojan 
334 Backage 
411 Backage 
420 Breach, Incognito 
421 TCP Wrappers trojan 
455 Fatal Connections 
456 Hackers Paradise 
511 T0rn Rootkit 
513 Grlogin 
514 RPC Backdoor 
515 lpdw0rm, Ramen 
531 Net666, Rasmin 
555 various known trojans
600 Sadmind 
605 Secret Service 
661 NokNok 
666 over a dozen known trojans
667 SniperNet 
668 th3r1pp3rz (= Therippers) 
669 DP trojan 
692 GayOL 
777 AimSpy, Undetected 
808 WinHole 
911 Dark Shadow, Dark Shadow 
999 various known trojans
1000 various known trojans
1001 various known trojans
1005 Theef 
1008 Lion 
1010 Doly Trojan 
1011 Doly Trojan 
1012 Doly Trojan 
1015 Doly Trojan 
1016 Doly Trojan 
1020 Vampire 
1024 Jade, Latinus, NetSpy
Tool - RAT [no 2] 
1025 various known trojans
1031 Xanadu 
1035 Multidropper 
1042 BLA trojan 
1042 (UDP) - BLA trojan 
1045 Rasmin 
1049 /sbin/initd 
1050 MiniCommand 
1053 The Thief 
1054 AckCmd 
1080 SubSeven 2.2, WinHole 
1081 WinHole 
1082 WinHole 
1083 WinHole 
1090 Xtreme 
1095 RAT
1097 RAT
1098 RAT
1099 Blood Fest Evolution, RAT 
1104 (UDP) - RexxRave 
1150 Orion 
1151 Orion 
1170 various known trojans
1174 DaCryptic 
1180 Unin68 
1200 (UDP) - NoBackO 
1201 (UDP) - NoBackO 
1207 SoftWAR 
1208 Infector 
1212 Kaos 
1234 SubSeven, Ultors Trojan 
1243 BackDoor-G, SubSeven
1245 VooDoo Doll 
1255 Scarab 
1256 Project nEXT, RexxRave 
1269 Matrix 
1272 The Matrix 
1313 NETrojan 
1337 Shadyshell 
1338 Millennium Worm 
1349 Bo dll 
1386 Dagger 
1394 GoFriller 
1441 Remote Storm 
1492 FTP99CMP 
1524 Trinoo 
1568 Remote Hack 
1600 Direct Connection, Shivka-Burka 
1703 Exploiter 
1777 Scarab 
1807 SpySender 
1826 Glacier 
1966 Fake FTP 
1967 FYEO, WM FTP Server 
1969 OpC BO 
1981 Bowl, Shockrave 
1991 PitFall 
1999 Back Door, SubSeven, TransScout 
2000 Der Spaeher, Insane, Last
2000, Remote Explorer, Senna Spy
2001 Der Spaeher, Trojan Cow 
2023 Ripper Pro 
2080 WinHole 
2115 Bugs 
2130 (UDP) - Mini Backlash 
2140 The Invasor 
2140 (UDP) - Deep Throat, Foreplay 
2155 Illusion Mailer 
2255 Nirvana 
2283 Hvl RAT 
2300 Xplorer 
2311 Studio 54 
2330 IRC Contact 
2331 IRC Contact 
2332 IRC Contact 
2333 IRC Contact 
2334 IRC Contact 
2335 IRC Contact 
2336 IRC Contact 
2337 IRC Contact 
2338 IRC Contact 
2339 IRC Contact, Voice Spy 
2339 (UDP) - Voice Spy 
2345 Doly Trojan 
2400 Portd 
2555 Lion, T0rn Rootkit 
2565 Striker trojan 
2583 WinCrash 
2589 Dagger 
2600 Digital RootBeer 
2702 Black Diver 
2716 The Prayer 
2773 SubSeven, SubSeven 2.1 Gold 
2774 SubSeven, SubSeven 2.1 Gold 
2801 Phineas Phucker 
2929 Konik 
2989 (UDP) - RAT 
3000 InetSpy, Remote Shut 
3024 WinCrash 
3031 Microspy 
3128 Reverse WWW Tunnel, RingZero 
3129 Masters Paradise 
3131 SubSARI 
3150 The Invasor 
3150 Deep Throat, Foreplay, Mini
3456 Terror trojan 
3459 Eclipse 2000, Sanctuary 
3700 Portal of Doom 
3777 PsychWard 
3791 Total Solar Eclypse 
3801 Total Solar Eclypse 
4000 Connect-Back, SkyDance 
4092 WinCrash 
4201 War trojan 
4242 Virtual Hacking Machine
4321 BoBo 
4444 CrackDown, Prosiak, Swift
4488 Event Horizon 
4523 Celine 
4545 Internal Revise 
4567 File Nail 
4590 ICQ Trojan 
4653 Cero 
4666 Mneah 
4950 ICQ Trogen (Lm) 
5000 various known trojans
5001 Back Door, Sockets des Troie 
5002 cd00r, Linux Rootkit IV, Shaft 
5005 Aladino 
5010 Solo 
5011 One of the Last Trojans
5025 WM Remote KeyLogger 
5031 Net Metropolitan 
5032 Net Metropolitan 
5321 Firehotcker 
5333 Backage, NetDemon 
5343 WC Remote Administration Tool 
5400 Back Cons, Blade Runner 
5401 Back Const, Blade Runner, Mneah 
5402 Back Const, Blade Runner, Mneah 
5512 Illusion Mailer 
5534 The Flu 
5550 Xtcp 
5555 ServeMe 
5556 BO Facil 
5557 BO Facil 
5569 Robo-Hack 
5637 PC Crasher 
5638 PC Crasher 
5742 WinCrash 
5760 Portmap Linux Exploit 
5802 Y3K RAT 
5873 SubSeven 2.2 
5880 Y3K RAT 
5882 Y3K RAT 
5882 (UDP) - Y3K RAT 
5888 Y3K RAT 
5888 (UDP) - Y3K RAT 
5889 Y3K RAT 
6000 The Thing 
6006 Bad Blood 
6272 Secret Service 
6400 The Thing 
6661 TEMan, Weia-Meia 
6666 Dark Connection Inside, NetBus
6667 over a dozen known trojans
6669 Host Control, Vampire 
6670 various known trojans
6711 BackDoor-G, SubSARI, Sub-7, VPK
6712 Funny trojan, SubSeven 
6713 SubSeven 
6723 Mstream 
6767 UandMe 
6771 Deep Throat, Foreplay 
6776 2000 Cracks, BackDoor-G, Sub-7, VPK
6838 (UDP) - Mstream 
6883 Delta Source DarkStar (??) 
6912 Shit Heep 
6939 Indoctrination 
6969 various known trojans
6970 GateCrasher 
7000 various known trojans
7001 Freak88, Freak2k, NetSnooper Gold 
7158 Lohoboyshik 
7215 SubSeven, SubSeven 2.1 Gold 
7300 NetMonitor 
7301 NetMonitor 
7306 NetMonitor 
7307 NetMonitor, Remote Process Monitor 
7308 NetMonitor, X Spy 
7424 Host Control 
7424 (UDP) - Host Control 
7597 Qaz 
7626 Binghe, Glacier, Hyne 
7718 Glacier 
7777 God Message, The Thing, Tini 
7789 Back Door Setup, ICKiller, Mozilla 
7826 Oblivion 
7891 The ReVeNgEr 
7983 Mstream 
8080 various known trojans
8685 Unin68 
8787 Back Orifice 2000 
8812 FraggleRock Lite 
8988 BacHack 
8989 Rcon, Recon, Xcon 
9000 Netministrator 
9325 (UDP) - Mstream 
9400 InCommand 
9870 Remote Computer Control Center 
9872 Portal of Doom 
9873 Portal of Doom 
9874 Portal of Doom 
9875 Portal of Doom 
9876 Cyber Attacker, Rux 
9878 TransScout 
9989 Ini-Killer 
9999 The Prayer 
10000 OpwinTRojan 
10005 OpwinTRojan 
10008 Cheese worm, Lion 
10067 (UDP) - Portal of Doom 
10085 Syphillis 
10086 Syphillis 
10100 Control Total, GiFt trojan 
10101 BrainSpy, Silencer 
10167 (UDP) - Portal of Doom 
10520 Acid Shivers 
10528 Host Control 
10607 Coma 
10666 (UDP) - Ambush 
11000 Senna Spy Trojan Generator 
11050 Host Control 
11051 Host Control 
11223 Progenic trojan, Secret Agent 
11831 Latinus 
12076 Gjamer 
12223 Hack´99 KeyLogger 
12310 PreCursor 
12345 over 2 dozen known trojans
12346 Fat Bitch, GabanBus, NetBus, X-bill 
12348 BioNet 
12349 BioNet, Webhead 
12361 Whack-a-mole 
12362 Whack-a-mole 
12363 Whack-a-mole 
12623 (UDP) - DUN Control 
12624 ButtMan 
12631 Whack Job 
12754 Mstream 
13000 Senna Spy Trojan Generator
13010 BitchController, Hacker Brasil
13013 PsychWard 
13014 PsychWard 
13223 Hack´99 KeyLogger 
13473 Chupacabra 
14500 PC Invader 
14501 PC Invader 
14502 PC Invader 
14503 PC Invader 
15000 NetDemon 
15092 Host Control 
15104 Mstream 
15382 SubZero 
15858 CDK 
16484 Mosucker 
16660 Stacheldraht 
16772 ICQ Revenge 
16959 SubSeven
16969 Priority 
17166 Mosaic 
17300 Kuang2 the virus 
17449 Kid Terror 
17499 CrazzyNet 
17500 CrazzyNet 
17569 Infector 
17593 AudioDoor 
17777 Nephron 
18667 Knark 
18753 (UDP) - Shaft 
19864 ICQ Revenge 
20000 Millenium 
20001 Insect, Millenium
20002 AcidkoR 
20005 Mosucker 
20023 VP Killer 
20034 various known trojans
20203 Chupacabra 
20331 BLA trojan 
20432 Shaft 
20433 (UDP) - Shaft 
21544 GirlFriend, Kid Terror, Matrix 
21554 various known trojans
21579 Breach 
21957 Latinus 
22222 Donald Dick, Prosiak, Ruler, RUX
23005 NetTrash, Olive, Oxon 
23006 NetTrash 
23023 Logged 
23032 Amanda 
23321 Konik 
23432 Asylum 
23456 Evil FTP, Ugly FTP, Whack Job 
23476 Donald Dick 
23476 (UDP) - Donald Dick 
23477 Donald Dick 
23777 InetSpy 
24000 Infector 
24289 Latinus 
25123 Goy'Z TroJan 
25555 FreddyK 
25685 MoonPie 
25686 MoonPie 
25982 MoonPie 
26274 (UDP) - Delta Source 
26681 Voice Spy 
27160 MoonPie 
27374 over a dozen known trojans
27444 (UDP) - Trinoo 
27573 SubSeven 
27665 Trinoo 
28431 Hack´a´Tack 
28678 Exploiter 
29104 NetTrojan 
29292 BackGate 
29369 ovasOn 
29559 Latinus 
29891 The Unexplained 
30000 Infector 
30001 ErrOr32 
30003 Lamers Death 
30005 Backdoor JZ 
30029 AOL trojan 
30100 NetSphere 
30101 NetSphere 
30102 NetSphere 
30103 NetSphere 
30103 (UDP) - NetSphere 
30133 NetSphere 
30303 Sockets des Troie 
30700 Mantis 
30947 Intruse 
30999 Kuang2 
31221 Knark 
31335 Trinoo 
31336 Bo Whack, Butt Funnel 
31337 over 2 dozen known trojans
31337 (UDP) - Back Orifice, Deep BO 
31338 Back Orifice, Butt Funnel, NetSpy
31338 (UDP) - Deep BO, NetSpy (DK) 
31339 NetSpy (DK), NetSpy (DK) 
31557 Xanadu 
31666 BOWhack 
31745 BuschTrommel 
31785 Hack´a´Tack 
31787 Hack´a´Tack 
31788 Hack´a´Tack 
31789 (UDP) - Hack´a´Tack 
31790 Hack´a´Tack 
31791 (UDP) - Hack´a´Tack 
31792 Hack´a´Tack 
32001 Donald Dick 
32100 Peanut Brittle, Project nEXT 
32418 Acid Battery 
32791 Acropolis 
33270 Trinity 
33333 Blakharaz, Prosiak 
33567 Lion, T0rn Rootkit 
33568 Lion, T0rn Rootkit 
33577 Son of PsychWard 
33777 Son of PsychWard 
33911 Spirit 2000, Spirit 2001 
34324 Big Gluck, TN 
34444 Donald Dick 
34555 (UDP) - Trinoo (for Windows) 
35555 (UDP) - Trinoo (for Windows) 
37237 Mantis 
37266 The Killer Trojan 
37651 Yet Another Trojan - YAT 
38741 CyberSpy 
39507 Busters 
40412 The Spy 
40421 Agent 40421, Masters Paradise 
40422 Masters Paradise 
40423 Masters Paradise 
40425 Masters Paradise 
40426 Masters Paradise 
41337 Storm 
41666 Remote Boot Tool - RBT
44444 Prosiak 
44575 Exploiter 
44767 (UDP) - School Bus 
45559 Maniac rootkit 
45673 Acropolis 
47017 T0rn Rootkit 
47262 (UDP) - Delta Source 
48004 Fraggle Rock 
48006 Fraggle Rock 
49000 Fraggle Rock 
49301 OnLine KeyLogger 
50000 SubSARI 
50130 Enterprise 
50505 Sockets des Troie 
50766 Fore, Schwindler 
51966 Cafeini 
52317 Acid Battery 2000 
53001 Remote Windows Shutdown - RWS 
54283 SubSeven, SubSeven 2.1 Gold 
54320 Back Orifice 2000 
54321 Back Orifice 2000, School Bus 
55165 File Manager trojan, WM Trojan Generator
55166 WM Trojan Generator 
57341 NetRaider 
58339 Butt Funnel 
60000 Deep Throat, Foreplay, Sockets des Troie 
60001 Trinity 
60008 Lion, T0rn Rootkit 
60068 Xzip 6000068 
60411 Connection 
61348 Bunker-Hill 
61466 TeleCommando 
61603 Bunker-Hill 
63485 Bunker-Hill 
64101 Taskman 
65000 Devil, Sockets des Troie, Stacheldraht 
65390 Eclypse 
65421 Jade 
65432 The Traitor (= th3tr41t0r) 
65432 (UDP) - The Traitor (= th3tr41t0r) 
65530 Windows Mite 
65534 /sbin/initd 
65535 Adore worm, RC1 trojan, Sins 
|);

foreach(@_) {
  next unless $_ =~ /^(\d+)\s+(.*)$/;
  $trojans->{$1} = $2;
}
1;
