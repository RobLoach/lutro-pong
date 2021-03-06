Vector2D = require "Lutron/Math/Vector2D"

class Entity
  new: (x = 0, y = 0, width = 1, height = 1, state = nil) =>
    @position = Vector2D x, y
    @velocity = Vector2D!
    @acceleration = Vector2D!
    @size = Vector2D width, height
    @friction = Vector2D 1, 1
    @state = state

  load: =>
    -- Nothing to load

  draw: =>
    -- Nothing to draw

  update: (dt) =>
    @velocity.x += @acceleration.x * dt
    @velocity.y += @acceleration.y * dt
    @velocity.x *= @friction.x -- @todo Account for dt
    @velocity.y *= @friction.y
    @position.x += @velocity.x * dt
    @position.y += @velocity.y * dt

  left: (left = nil) =>
    if left == nil
      return @position.x
    else
      @position.x = left
      return left

  right: (right = nil) =>
    if right == nil
      return @position.x + @size.x
    else
      @position.x = right - @size.x
      return right

  top: (top = nil) =>
    if top == nil
      return @position.y
    else
      @position.y = top
      return top

  bottom: (bottom = nil) =>
    if bottom == nil
      return @position.y + @size.y
    else
      @position.y = bottom - @size.y
      return bottom

  centerX: (centerX = nil) =>
    if centerX == nil
      return @position.x + @size.x / 2
    else
      @position.x = centerX - @size.x / 2
      return centerX

  centerY: (centerY = nil) =>
    if centerY == nil
      return @position.y + @size.y / 2
    else
      @position.y = centerY - @size.y / 2
      return centerY

  collision: (entity) =>
    if @left! < entity\right!
      if @top! < entity\bottom!
        if @bottom! > entity\top!
          if @right! > entity\left!
            return true
    return false

  width: (width = nil) =>
    if width != nil
      @size.x = width
    return @size.x

  height: (height = nil) =>
    if height != nil
      @size.y = height
    return @size.y
