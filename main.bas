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
    startX As Integer
    startY As Integer
End Type


'INIT DRAWING AREA CANVAS
Dim Canvas As DrawingArea
Canvas.startX = 100
Canvas.startY = 100

'REMOVE MAGIC NUMBERS
TileWidth = 64
TileHeight = 64

'INTERLACED RENDERING BECAUSE BLOCKS ARE SPACED WIERDLY
HorizontalLayerNumber = 0
VerticalLayerNumber = 0

For VerticalLayer = Canvas.startY To Canvas.startY + TileHeight * 5 Step TileHeight

    'SET / RESET LOCATION COUNTERS
    VerticalLayerNumber = VerticalLayerNumber + 1
    HorizontalLayerNumber = 0

    For HorizontalLayer = Canvas.startX To Canvas.startX + TileWidth * 8 Step TileWidth

        'SET / RESET LOCATION COUNTERS
        HorizontalLayerNumber = HorizontalLayerNumber + 1

        XAddition = 0
        YAddition = -(VerticalLayerNumber * 45)

        'INTERLACED RENDERING
        If VerticalLayerNumber Mod 2 = 0 Then
            XAddition = (TileWidth / 2)
        Else
            XAddition = 0
        End If

        RenderX = HorizontalLayer + XAddition
        RenderY = VerticalLayer + YAddition

        _PutImage (RenderX, RenderY), tile.img


    Next

Next

