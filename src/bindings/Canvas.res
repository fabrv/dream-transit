type canvasLineCap =
  | @as("butt") Butt
  | @as("round") Round
  | @as("square") Square

type canvasLineJoin =
  | @as("bevel") Bevel
  | @as("miter") Miter
  | @as("round") Round

type canvasTextAlign =
  | @as("center") Center
  | @as("end") End
  | @as("left") Left
  | @as("right") Right
  | @as("start") Start

type canvasTextBaseline =
  | @as("alphabetic") Alphabetic
  | @as("bottom") Bottom
  | @as("hanging") Hanging
  | @as("ideographic") Ideographic
  | @as("middle") Middle
  | @as("top") Top

type canvasDirection =
  | @as("inherit") Inherit
  | @as("ltr") Ltr
  | @as("rtl") Rtl

type canvasFontKerning =
  | @as("auto") Auto
  | @as("none") None
  | @as("normal") Normal

type canvasFontStretch =
  | @as("condensed") Condensed
  | @as("expanded") Expanded
  | @as("extra-condensed") ExtraCondensed
  | @as("extra-expanded") ExtraExpanded
  | @as("normal") Normal
  | @as("semi-condensed") SemiCondensed
  | @as("semi-expanded") SemiExpanded
  | @as("ultra-condensed") UltraCondensed
  | @as("ultra-expanded") UltraExpanded

type canvasFontVariantCaps =
  | @as("all-petite-caps") AllPetiteCaps
  | @as("all-small-caps") AllSmallCaps
  | @as("normal") Normal
  | @as("petite-caps") PetiteCaps
  | @as("small-caps") SmallCaps
  | @as("titling-caps") TitlingCaps
  | @as("unicase") Unicase

type canvasTextRendering =
  | @as("auto") Auto
  | @as("geometricPrecision") GeometricPrecision
  | @as("optimizeLegibility") OptimizeLegibility
  | @as("optimizeSpeed") OptimizeSpeed

type canvasFillRule =
  | @as("evenodd") Evenodd
  | @as("nonzero") Nonzero

type htmlCanvasElement = Dom.element

type canvasContext = {
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/canvas)
    */
  canvas: htmlCanvasElement,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/globalAlpha)
    */
  mutable globalAlpha: float,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/imageSmoothingEnabled)
    */
  mutable imageSmoothingEnabled: bool,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/strokeStyle)
    */
  mutable strokeStyle: string,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/fillStyle)
    */
  mutable fillStyle: string,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/shadowOffsetX)
    */
  mutable shadowOffsetX: float,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/shadowOffsetY)
    */
  mutable shadowOffsetY: float,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/shadowBlur)
    */
  mutable shadowBlur: float,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/shadowColor)
    */
  mutable shadowColor: string,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/filter)
    */
  mutable filter: string,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/lineWidth)
    */
  mutable lineWidth: float,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/lineCap)
    */
  mutable lineCap: canvasLineCap,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/lineJoin)
    */
  mutable lineJoin: canvasLineCap,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/miterLimit)
    */
  mutable miterLimit: float,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/lineDashOffset)
    */
  mutable lineDashOffset: float,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/font)
    */
  mutable font: string,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/textAlign)
    */
  mutable textAlign: canvasTextAlign,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/textBaseline)
    */
  mutable textBaseline: canvasTextBaseline,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/direction)
    */
  mutable direction: canvasDirection,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/letterSpacing)
    */
  mutable letterSpacing: string,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/fontKerning)
    */
  mutable fontKerning: canvasFontKerning,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/fontStretch)
    */
  mutable fontStretch: canvasFontStretch,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/fontVariantCaps)
    */
  mutable fontVariantCaps: canvasFontVariantCaps,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/textRendering)
    */
  mutable textRendering: canvasTextRendering,
  /**
    [Read more on MDN](https://developer.mozilla.org/docs/Web/API/CanvasRenderingContext2D/wordSpacing)
    */
  mutable wordSpacing: string,
}
