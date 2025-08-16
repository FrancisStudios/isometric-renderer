# Isometric Rendering 🧊

My Idea is to experiment with isometric rendering. I want to make a game using isometric tiles (or cubes) but I have never experimented with that sort of rendering style, so I figured that I'll try out myself in a simple rendering project. 

### 1) Interlaced rendering. 

I figured out that I have to do interlaced rendering to make the block align well.

**Without interlaced rendering**
![image](./docs/non-interlaced.png)

**With interlaced rendering**
![image](./docs/interlaced-with-no-y-correction.png)

I archieved this result by shifting every second line with the half of the width of the standard block (32 pixels)

```basic
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
        YAddition = 0

        'INTERLACED RENDERING
        If VerticalLayerNumber Mod 2 = 0 Then
            XAddition = 0
        Else
            XAddition = 0
        End If

        RenderX = HorizontalLayer + XAddition
        RenderY = VerticalLayer + YAddition

        _PutImage (RenderX, RenderY), tile.img


    Next
```

### 2) Y-correction

It looks all good, when we ajdust every second layer of blocks by `x + 32` or `x + (blockWidht / 2)` but there is an excess vertical spacing between the lines that we do not want to see, so I experimented with y corrections in the same control-flow where the X-correction takes place.

I found a magic number (as a result of experimentation) to be 45 - so now every two lines match up perfeclty.

```basic
        'INTERLACED RENDERING
        If VerticalLayerNumber Mod 2 = 0 Then
            XAddition = (TileWidth / 2)
            YAddition = -45 'This is the magic number 
        Else
            XAddition = 0
            YAddition = 0
        End If

        RenderX = HorizontalLayer + XAddition
        RenderY = VerticalLayer + YAddition

        _PutImage (RenderX, RenderY), tile.img
```

Now the result looks like so

![image](./docs/interlaced-with-y-correction-1.png)

