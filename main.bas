'EXPERIMENTING WITH BASIC ISOMETRIC TILE RENDERING
'WHY AM I CODING IN BASIC IN 2025 NO ONE KNOWS XD!

Screen _NewImage(800, 600, 32)

_Title "Isometric World | by Francis"

'ALL WE NEED FOR ISOMETRIC SPRITING I GUESS
Type IsometricSprite
    img As Long
    x As Integer
    y As Integer
End Type


Dim tile As IsometricSprite

tile.img = _LoadImage("res/base-block.png", 32)
title.x = 10
title.y = 10

_PutImage (tile.x, tile.y), tile.img

