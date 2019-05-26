#! /usr/bin/env gforth
\ basically b****fuck (give or take)
\ mem doesn't wrap, doesn't work with non-operation characters
\ you have to end it with an !
\ I could change it to work normally very simply, but I won't

warnings off
30000 constant BFCELLS
create #memory BFCELLS cells allot
       #memory BFCELLS cells erase

variable 'mp   0 'mp !
: 'pointer   'mp @ cells #memory + ;

: f   count [char] ] = if exit then rdrop recurse ;
: [   dup 1- swap   'pointer @ 0=   if drop f then ;
: ]   'pointer @ 0=   if nip else drop then ;
: <   -1 'mp +! ;
: >    1 'mp +! ;
: -   -1 'pointer +! ;
: +    1 'pointer +! ;
: ,   key 'pointer ! ;
: .   'pointer @ emit ;
: !   cr bye ;

: >token   here swap over c! 1 ;
: main     count >token evaluate rdrop recurse ;
s" ++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.!"
drop main
