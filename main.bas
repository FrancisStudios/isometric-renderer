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

'BONUS CONTENT IMAGES
flower = _LoadImage("res/flower.png", 32)
air = _LoadImage("res/air.png", 32)

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

'WORLD SIZE
ROWS = 18
COLUMNS = 8

'Z-INDEX IS THE WORLD LAYERS
For ZIndex = 0 To 1 Step 1

    'INTERLACED RENDERING BECAUSE BLOCKS ARE SPACED WIERDLY
    HorizontalLayerNumber = 0
    VerticalLayerNumber = 0

    For VerticalLayer = Canvas.startY To Canvas.startY + TileHeight * ROWS Step TileHeight

        'SET / RESET LOCATION COUNTERS
        VerticalLayerNumber = VerticalLayerNumber + 1
        HorizontalLayerNumber = 0

        For HorizontalLayer = Canvas.startX To Canvas.startX + TileWidth * COLUMNS Step TileWidth

            'SET / RESET LOCATION COUNTERS
            HorizontalLayerNumber = HorizontalLayerNumber + 1

            XAddition = 0
            YAddition = -(VerticalLayerNumber * 45)
            LayerAdjustment = (ZIndex * 28)

            'INTERLACED RENDERING
            If VerticalLayerNumber Mod 2 = 0 Then
                XAddition = (TileWidth / 2)
            Else
                XAddition = 0
            End If

            'RENDER COORDINATE MATH
            RenderX = HorizontalLayer + XAddition
            RenderY = VerticalLayer + YAddition - LayerAdjustment

            'SECOND LAYER CONTENTS (BONUS CONTENT)
            Dim RenderIMG As Long
            If ZIndex = 1 And RenderX Mod 5 = 0 And RenderY Mod 3 = 0 Then
                RenderIMG = flower
            Else
                RenderIMG = air
            End If

            If ZIndex = 1 And RenderX Mod 3 = 0 And RenderY Mod 5 = 0 Then RenderIMG = tile.img


            If ZIndex = 0 Then RenderIMG = tile.img

            'RENDERING
            _PutImage (RenderX, RenderY), RenderIMG

        Next 'HORIZONTAL - X
    Next 'VERTICAL - Y
Next 'HEIGHT - Z

