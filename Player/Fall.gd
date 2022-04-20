extends BaseState

export var speed = 500

func enter():
	if player.was_grounded:
		player.Coyote.start()

func physics_process(delta):
	player.velocity.x = move() * speed
	player.velocity.y += player.gravity
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if player.pressed_jump and player.was_grounded:
		return State.Jump
	if player.is_on_floor():
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
