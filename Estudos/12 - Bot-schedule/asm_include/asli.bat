asm -sym -li=%1.lsr %1
lyn %1.obj,%1,;
obsend %1,f,%1.s19,s
abslist %1.lsr -o %1.lst -fmt srec -exe %1.s19 -map %1.map
