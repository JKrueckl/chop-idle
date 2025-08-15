extends Node2D

var velocity = Vector2(0, 50 + randf() * 50)
var angular_velocity = randf_range(-1, 1)

func _ready():
    set_process(true)

func _process(delta):
    position += velocity * delta
    rotation += angular_velocity * delta
    if position.y > get_viewport_rect().size.y + 32:
        queue_free()
    check_cursor_impact()

func check_cursor_impact():
    var mouse_pos = get_viewport().get_mouse_position()
    if (position - mouse_pos).length() < 32:
        velocity.y = -abs(velocity.y) * 0.5
        angular_velocity = randf_range(-2, 2)
