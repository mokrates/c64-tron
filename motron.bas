

;motron ==0801==
    5 rem *******************************
    6 rem       tron ** by mo
    8 rem *******************************
   10 poke 53281,0 : rem hintergrund schwarz
   11 input"name player1";aplayer$
   12 input"name player2";bplayer$
   13 awins%=0
   14 bwins%=0
   20 print"{clr}"
   30 for i =0to  9 : print : next
   40 for i =0to 16 : print " ";: next
   50 msg$="press fire on joy"
   60 print "tron" : print
   70 for i = 0 to (40-len(msg$))/2:print" ";:next
   75 print msg$
   76 for i =0to7:print:next
   77 printaplayer$,awins%,bplayer$,bwins%
   80 gosub 20010
  100 print"{clr}"
  450 poke 53281,0 : rem hintergrund schwarz
  460 afarbe%=6 : bfarbe%=8
  500 ax%=10:ay%=10:bx%=30:by%=15
  550 ja%=247 : jb%=123 : va%=252:vb%=124
  600 na%=peek(56321):nb%=peek(56320)
  650 if na%<>255 and(na%andva%)=va% then ja%=na%
  655 if nb%<>127 and(nb%andvb%)=vb% then jb%=nb%
  700 if ja%=254 then ay%=ay%-1 : va%=243
  800 if jb%=126 then by%=by%-1 : vb%=115
  900 if ja%=251 then ax%=ax%-1 : va%=252
 1000 if jb%=123 then bx%=bx%-1 : vb%=124
 1100 if ja%=247 then ax%=ax%+1 : va%=252
 1200 if jb%=119 then bx%=bx%+1 : vb%=124
 1300 if ja%=253 then ay%=ay%+1 : va%=243
 1400 if jb%=125 then by%=by%+1 : vb%=115
 1500 if ax%<0 or ax%>39 or ay%<0 or ay%>24 then winner$=bplayer$ : goto 10000
 1600 if bx%<0 or bx%>39 or by%<0 or by%>24 then winner$=aplayer$ : goto 10000
 1700 if peek(1024+ay%*40+ax%) = 160 then winner$=bplayer$ : goto 10000
 1800 if peek(1024+by%*40+bx%) = 160 then winner$=aplayer$ : goto 10000
 1900 poke 1024+ay%*40+ax%, 160 : poke 55296+ay%*40+ax%,afarbe%
 2000 poke 1024+by%*40+bx%, 160 : poke 55296+by%*40+bx%,bfarbe%
 2100 goto 600
 10000 if winner$=aplayer$ then poke 53280,afarbe% : awins%=awins%+1:goto 10020
 10010 bwins%=bwins%+1: poke 53280,bfarbe%
 10020 gosub 20010
 10030 goto 20
 20010 if peek(56321) <> 239 and peek(56320)<>111 then goto 20010
 20020 if peek(56321) =  239 or  peek(65320)= 111 then goto 20020
 20030 return

