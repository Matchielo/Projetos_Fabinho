@set PATH=..;%PATH%
asm -sym -li=ST72311N4.lsr ST72311N4
asm -sym -li=demo1.lsr demo1
asm -sym -li=demo2.lsr demo2
asm -sym -li=demo3.lsr demo3
lyn @demo.rsp
obsend demo,f,demo.s19,s
abslist ST72311N4.lsr -o ST72311N4.lst -fmt srec -exe demo.s19 -map demo.map
abslist demo1.lsr -o demo1.lst -fmt srec -exe demo.s19 -map demo.map
abslist demo2.lsr -o demo2.lst -fmt srec -exe demo.s19 -map demo.map
abslist demo3.lsr -o demo3.lst -fmt srec -exe demo.s19 -map demo.map
