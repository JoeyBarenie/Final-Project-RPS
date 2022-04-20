extends BaseState

export var jump_strength = 1000
export var speed = 500
export var jump_cut = 0.5

func enter():
	player.Coyote.stop()
	player.JumpBuffer.stop()
	player.pressed_jump = false
	player.was_grounded = false
	player.velocity.y = -jump_strength
	if player.is_slow:
		player.velocity.y /= player.slow_multiplier * 1.5

func input(_event):
	if Input.is_action_just_released("up"):
		player.velocity.y *= jump_cut
	return State.Null

func physics_process(_delta):
	player.move(speed)
	
	# Spaghetti to stop double jumping
	player.was_grounded = false
	
	if player.velocity.y > 0:
		return State.Fall
	elif player.is_on_floor():
		if player.move_direction() != 0:
			return State.Walk
		return State.Idle
	
	return State.Null
