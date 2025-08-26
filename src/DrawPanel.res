external requestAnimationFrame: (float => unit) => int = "requestAnimationFrame"

open Draw
open Canvas
open CanvasContext
open HtmlCanvasElement

type strokes = dict<stroke>

type state = {
  canvas: option<htmlCanvasElement>,
  context: option<canvasContext>,
  strokes: strokes,
  uiStrokes: strokes
}

type action =
| Init(option<htmlCanvasElement>, option<canvasContext>)
| BeginPreview(point)
| UpdatePreview(point)
| CommitPreview

let reducer = (state, action) => {
  switch action {
  | Init(canvas, context) => {...state, canvas, context}
  | BeginPreview(point) =>
    let preview = Dict.fromArray([
      ("preview-start", Circle({
        center: point,
        radius: 4.0,
        fill: "blue",
        strokeStyle: {
          style: "blue",
          width: 1.0
        }
      })),
      ("preview-line", Line({
        p0: point,
        p1: point
      }))
    ])

    let uiStrokes = state.uiStrokes->Dict.copy
    uiStrokes->Dict.assign(preview)->ignore
    {...state, uiStrokes}
  | UpdatePreview(point) =>
    let previewLine = state.uiStrokes->Dict.get("preview-line")
    switch previewLine {
    | Some(Line(line)) =>
      let newLine = {...line, p1: point}
      let uiStrokes = state.uiStrokes->Dict.copy
      uiStrokes->Dict.set("preview-line", Line(newLine))
      {...state, uiStrokes}
    | _ => state
    }
  | CommitPreview =>
    Console.log("Line is being commited!!")
    let line = state.uiStrokes->Dict.get("preview-line")
    let id = Math.round(Math.random() *. 10000.0)
    line->Option.map(stroke => state.strokes->Dict.set(`line${id->Float.toString}`, stroke))->ignore

    let uiStrokes = Dict.make()

    {...state, uiStrokes}
  }
}

@react.component
let make = () => {
  let canvasRef = React.useRef(null)
  let (state, dispatch) = React.useReducer(
    reducer,
    {
      canvas: None,
      context: None,
      strokes: Dict.make(),
      uiStrokes: Dict.make()
    },
  )

  let drawFrame = (ctx: canvasContext) => {
    ctx.fillStyle = "white"
    ctx->fillRect(~x=0.0, ~y=0.0, ~w=window->DomWindow.innerWidth, ~h=window->DomWindow.innerHeight)
    Console.log(state.strokes)
    state.strokes->Dict.valuesToArray->Array.forEach(drawStrokes(ctx))
    state.uiStrokes->Dict.valuesToArray->Array.forEach(drawStrokes(ctx))
  }

  React.useEffect(() => {
    state.context->Option.map(ctx => drawFrame(ctx))->ignore
    None
  }, (state.context, state.strokes, state.uiStrokes))

  React.useEffect(() => {
    let canvas = canvasRef.current->Nullable.toOption
    let context = canvas->Option.map(c => c->getContext("2d"))

    dispatch(Init(canvas, context))

    None
  }, [])

  let handleMouseDown = (e: JsxEventU.Mouse.t) => {
    let point = {
      x: e->JsxEventU.Mouse.clientX->Int.toFloat,
      y: e->JsxEventU.Mouse.clientY->Int.toFloat
    }
    dispatch(BeginPreview(point))
  }

  let handleMouseMove = (e: JsxEventU.Mouse.t) => {
    let point = {
      x: e->JsxEventU.Mouse.clientX->Int.toFloat,
      y: e->JsxEventU.Mouse.clientY->Int.toFloat
    }
    dispatch(UpdatePreview(point))
  }
  
  let handleMouseUp = (_e: JsxEventU.Mouse.t) => {
    Console.log("MOUSE IS UP??!!")
    dispatch(CommitPreview)
  }

  <div>
  <canvas
    style={{
      width: "100%",
      height: "100%",
      border: "1px solid #000000",
    }}
    ref={ReactDOM.Ref.domRef(canvasRef)}
    width={window->DomWindow.innerWidth->Float.toString}
    height={window->DomWindow.innerHeight->Float.toString}
    onMouseDown={handleMouseDown}
    onMouseMove={handleMouseMove}
    onMouseUp={handleMouseUp}
  />
  </div>
}
