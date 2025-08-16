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

'THIS FOR GAME RENDERING AREA
Type DrawingArea
    startx As Integer
    starty As Integer
End Type


'INIT DRAWING AREA CANVAS
Dim Canvas As DrawingArea
Canvas.startx = 100
Canvas.starty = 100

'REMOVE MAGIC NUMBERS
TileWidth = 64
TileHeight = 64

For HorizontalLayer = Canvas.starty To Canvas.starty + TileHeight * 8 Step TileHeight

    For VerticalLayer = Canvas.startx To Canvas.startx + TileWidth * 5 Step TileWidth
        _PutImage (HorizontalLayer, VerticalLayer), tile.img
    Next

Next

