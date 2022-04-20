extends BaseState

export var speed = 500

func physics_process(delta: float) -> int:
	player.velocity.y += player.gravity
	player.velocity.x = move() * speed
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if player.pressed_jump:
		return State.Jump
	if !player.is_on_floor():
		return State.Fall
	elif move() == 0:
		return State.Idle
	return State.Null

func move():
	if Input.is_action_pressed("left"):
		player.Animations.flip_h = true
		return -1
	elif Input.is_action_pressed("right"):
		player.Animations.flip_h = false
		return 1
	return 0
