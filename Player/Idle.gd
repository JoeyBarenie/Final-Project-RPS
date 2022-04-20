extends BaseState

func input(_event):
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		return State.Walk
	return State.Null

func physics_process(_delta):
	player.velocity.y += player.gravity
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if player.pressed_jump:
		return State.Jump
	if !player.is_on_floor():
		return State.Fall
	return State.Null
