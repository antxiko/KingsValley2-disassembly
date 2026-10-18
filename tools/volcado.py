#!/usr/bin/env python3
"""Volcado compacto de las rutinas de un banco, para comentarlas a mano.

Una linea por rutina: direccion (3 cifras) e instruccion, con * si ya lleva
comentario. Herramienta de mano: no escribe nada.

Uso: volcado.py <banco> <desde> <hasta> [--c]   (hexadecimal)
     --c: con el principio de cada comentario
"""
import sys,re,glob
VER='--c' in sys.argv; b=int(sys.argv[1]); desde=int(sys.argv[2],16); hasta=int(sys.argv[3],16)
out=[]; 
import fuentes
for ln in open(fuentes.listado(b),encoding='utf-8'):
    m=re.match(r'^([A-Za-z_]\w*):',ln)
    if m: lab=m.group(1); out.append(('L',lab)); continue
    m=re.match(r'^\t([a-z][^\t;]*?)\s*;([0-9a-f]{4})(.*)$',ln)
    if m and not ln.startswith('\tdef'):
        a=int(m.group(2),16)
        if desde<=a<hasta:
            c=m.group(3).strip()
            out.append(('I',a,m.group(1).strip(),('{'+c[1:].strip()[:38]+'}' if VER else '*') if c.startswith(';') else ''))
    elif ln.startswith('\tdef'):
        m=re.search(r';\s*([0-9a-f]{4})',ln)
        if m and desde<=int(m.group(1),16)<hasta: out.append(('D',int(m.group(1),16)))
s=[];pend=None
for o in out:
    if o[0]=='L': pend=o[1]
    elif o[0]=='I':
        if pend: s.append('\n'+pend+':'); pend=None
        s.append('%03X %s%s'%(o[1]&0xFFF,o[2],o[3]))
    else:
        if pend: pend=None
        s.append('[datos %04X]'%o[1])
print(' | '.join(s).replace(' | \n','\n'))
