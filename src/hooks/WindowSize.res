let useWindowSize = () => {
  let initialState = (): Draw.size => { width: 0.0, height: 0.0}
  let (size, setSize) = React.useState(_ => initialState())

  React.useEffect(() => {
    let handleResize = () => {
      setSize(_ => {
        width: window->DomWindow.innerWidth,
        height: window->DomWindow.innerHeight
      })
    }

    window->DomWindow.addEventListener("resize", handleResize)

    handleResize()

    Some(() => window->DomWindow.removeEventListener("resize", handleResize))
  }, [])

  size
}