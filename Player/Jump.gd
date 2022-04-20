extends BaseState

export var jump_strength = 1500
export var speed = 500

func enter():
	player.pressed_jump = false
	player.was_grounded = false
	player.Coyote.stop()
	player.JumpBuffer.stop()
	player.velocity.y = -jump_strength

func physics_process(delta):
	player.velocity.x = move() * speed
	player.velocity.y += player.gravity
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if player.velocity.y < 0:
		return State.Fall
	elif player.is_on_floor():
		if move() != 0:
			return State.Walk
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
