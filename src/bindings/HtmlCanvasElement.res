open Canvas
@send external getContext: (htmlCanvasElement, string) => canvasContext = "getContext"

@get external width: htmlCanvasElement => int = "width"
@get external height: htmlCanvasElement => int = "height"