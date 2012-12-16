@Clutter = imports.gi.Clutter
@St = imports.gi.St
@Lang = imports.lang

changeRectanglePosition = ->
  [sizex, sizey] = stage.get_size()
  newx = Math.floor(Math.random() * sizex)
  newy = Math.floor(Math.random() * sizey)
  actorRectangle.set_position newx, newy
  timeline = new Clutter.Timeline(duration: 500)
  alpha = new Clutter.Alpha(
    timeline: timeline
    mode: Clutter.AnimationMode.EASE_OUT_ELASTIC
  )
  behaviourScale = new Clutter.BehaviourScale(
    alpha: alpha
    x_scale_start: 1.0
    y_scale_start: 1.0
    x_scale_end: 0.5
    y_scale_end: 0.5
  )
  behaviourScale.apply actorRectangle
  timeline.start()

Clutter.init null
stage = new Clutter.Stage()
stage.connect "destroy", Clutter.main_quit
stage.title = "Test"
stage.set_background_color new Clutter.Color(
  red: 10
  blue: 10
  green: 10
  alpha: 255
)
stage.set_fullscreen true
actorRectangle = new Clutter.Actor()
actorRectangle.set_size 100, 100
actorRectangle.set_position 100, 100
actorRectangle.set_background_color new Clutter.Color(
  red: 100
  blue: 100
  green: 100
  alpha: 255
)
actorRectangle.set_reactive true
actorRectangle.connect "enter-event", changeRectanglePosition
stage.add_actor actorRectangle
stage.show()
Clutter.main()