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

'INTERLACED RENDERING BECAUSE BLOCKS ARE SPACED WIERDLY
IsEvenLine = 0 'as false 1 = true (no booleans in basic)
IsEvenBlock = 0 'as false 1 = true

HorizontalLayerNumber = 0
VerticalLayerNumber = 0

For VerticalLayer = Canvas.starty To Canvas.starty + TileHeight * 5 Step TileHeight

    'SET / RESET LOCATION COUNTERS
    VerticalLayerNumber = VerticalLayerNumber + 1
    HorizontalLayerNumber = 0

    For HorizontalLayer = Canvas.startx To Canvas.startx + TileWidth * 8 Step TileWidth

        'SET / RESET LOCATION COUNTERS
        HorizontalLayerNumber = HorizontalLayerNumber + 1

        XAddition = 0
        YAddition = 0

        'INTERLACED RENDERING
        If VerticalLayerNumber Mod 2 = 0 Then
            XAddition = 32
        Else
            XAddition = 0
        End If

        RenderX = HorizontalLayer + XAddition
        RenderY = VerticalLayer + YAddition

        _PutImage (RenderX, RenderY), tile.img

        Sleep 1

    Next

Next

