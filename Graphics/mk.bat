cd Compressed
copy ..\..\..\Graphics\Background*.*
copy ..\..\..\Graphics\*.spr

..\..\..\..\Tools\BitBuster\pack Background*.*
..\..\..\..\Tools\BitBuster\pack *.spr

del *.col
del *.pat
del *.scn
del *.spr

cd ..

..\..\..\Tools\BinToAsm Compressed\Background1.col.pck Background1Col.s
..\..\..\Tools\BinToAsm Compressed\Background1.pat.pck Background1Pat.s
..\..\..\Tools\BinToAsm Compressed\Background1.scn.pck Background1Scn.s
..\..\..\Tools\BinToAsm Compressed\Background2.col.pck Background2Col.s
..\..\..\Tools\BinToAsm Compressed\Background2.pat.pck Background2Pat.s
..\..\..\Tools\BinToAsm Compressed\Background2.scn.pck Background2Scn.s
..\..\..\Tools\BinToAsm Compressed\Background3.col.pck Background3Col.s
..\..\..\Tools\BinToAsm Compressed\Background3.pat.pck Background3Pat.s
..\..\..\Tools\BinToAsm Compressed\Background3.scn.pck Background3Scn.s
..\..\..\Tools\BinToAsm Compressed\Sprites.spr.pck Sprites.s

del /Q *.obj
del /Q *.lst
