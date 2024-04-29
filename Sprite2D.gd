extends Sprite2D

var speed = 400
var angular_speed = PI
var auto_move = false

func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1

	rotation += angular_speed * direction * delta
	
	if Input.is_action_just_pressed("ui_down"):
		rotation += PI

	var velocity = Vector2.ZERO
	if auto_move or Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed

	position += velocity * delta
	
func _on_button_pressed():
	auto_move = not auto_move
