open Canvas
open CanvasContext
type point = {x: float, y: float}

type size = {
  width: float,
  height: float,
}

type strokeStyle = {
  style: string,
  width: float,
}

type strokeProps = {
  strokeStyle?: strokeStyle
}

type bezierLine = {
  ...strokeProps,
  start: point,
  end: point,
  cp1: point,
  cp2: point,
}

type arc = {
  ...strokeProps,
  center: point,
  radius: float,
  startAngle: float,
  endAngle: float,
  fill?: string,
}

type circle = {
  ...strokeProps,
  center: point,
  radius: float,
  fill?: string
}

type arcTo = {
  ...strokeProps,
  p0: point,
  p1: point,
  p2: point,
  radius: float
}

type line = {
  ...strokeProps,
  p0: point,
  p1: point
}

let drawBezierLine = (ctx: canvasContext, line: bezierLine) => {
  ctx->beginPath
  ctx->moveTo(~x=line.start.x, ~y=line.start.y)
  ctx->bezierCurveTo(
    ~cp1x=line.cp1.x,
    ~cp1y=line.cp1.y,
    ~cp2x=line.cp2.x,
    ~cp2y=line.cp2.y,
    ~x=line.end.x,
    ~y=line.end.y,
  )
  switch line.strokeStyle {
  | Some({style, width}) => {
      ctx.lineWidth = width
      ctx.strokeStyle = style
    }
  | _ => ()
  }
  ctx->stroke
  ctx.lineWidth = 1.0
  ctx.strokeStyle = "black"
}

let drawArc = (ctx: canvasContext, arc: arc) => {
  ctx->beginPath
  ctx->CanvasContext.arc(
    ~x=arc.center.x,
    ~y=arc.center.y,
    ~startAngle=arc.startAngle,
    ~endAngle=arc.endAngle,
    ~radius=arc.radius,
  )

  switch arc.strokeStyle {
  | Some({style, width}) => {
      ctx.lineWidth = width
      ctx.strokeStyle = style
    }
  | _ => ()
  }

  switch arc.fill {
  | Some(fillStyle) => {
      ctx.fillStyle = fillStyle
      ctx->fill
    }
  | _ => ()
  }

  ctx->stroke
  ctx.lineWidth = 1.0
  ctx.strokeStyle = "black"
  ctx.fillStyle = "black"
}

let drawCircle = (ctx: canvasContext, circle: circle) => {
  ctx->drawArc({
    center: circle.center,
    startAngle: 0.0,
    endAngle: Math.Constants.pi *. 2.0,
    radius: circle.radius,
    strokeStyle: circle.strokeStyle->Option.getUnsafe,
    fill: circle.fill->Option.getUnsafe,
  })
}

let drawArcTo = (ctx: canvasContext, arcTo: arcTo) => {
  let {p0, p1, p2, radius} = arcTo
  ctx->CanvasContext.moveTo(~x=p0.x, ~y=p0.y)
  ctx->CanvasContext.arcTo(~x1=p1.x, ~y1=p1.y, ~x2=p2.x, ~y2=p2.y, ~radius=radius)
  switch arcTo.strokeStyle {
  | Some({style, width}) => {
      ctx.lineWidth = width
      ctx.strokeStyle = style
    }
  | _ => ()
  }
  ctx->stroke
  ctx.lineWidth = 1.0
  ctx.strokeStyle = "black"
  ctx.fillStyle = "black"
}

let drawLine = (ctx: canvasContext, line: line) => {
  let {p0, p1} = line
  ctx->CanvasContext.moveTo(~x=p0.x, ~y=p0.y)
  ctx->CanvasContext.lineTo(~x=p1.x, ~y=p1.y)
  switch line.strokeStyle {
  | Some({style, width}) => {
      ctx.lineWidth = width
      ctx.strokeStyle = style
    }
  | _ => ()
  }
  ctx->stroke
  ctx.lineWidth = 1.0
  ctx.strokeStyle = "black"
  ctx.fillStyle = "black"
}

type stroke =
| Arc(arc)
| ArcTo(arcTo)
| Circle(circle)
| Line(line)

let drawStrokes = (ctx: canvasContext) => (stroke: stroke) => {
  switch stroke {
  | Line(line) => drawLine(ctx, line)
  | ArcTo(arcTo) => drawArcTo(ctx, arcTo)
  | Arc(arc) => drawArc(ctx, arc)
  | Circle(circle) => drawCircle(ctx, circle)
  }
}
