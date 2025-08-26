@get external innerWidth: Dom.window => float = "innerWidth"
@get external innerHeight: Dom.window => float = "innerHeight"

@send external addEventListener: (Dom.window, string, unit => unit) => unit = "addEventListener"
@send external removeEventListener: (Dom.window, string, unit => unit) => unit = "removeEventListener"