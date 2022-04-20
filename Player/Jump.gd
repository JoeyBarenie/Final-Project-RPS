extends BaseState

export var jump_strength = 1500
export var speed = 500

func enter():
	player.pressed_jump = false
	player.was_grounded = false
	player.Coyote.stop()
	player.JumpBuffer.stop()
	player.velocity.y = -jump_strength
	if player.is_slow:
		player.velocity.y /= player.slow_multiplier * 1.5

func physics_process(_delta):
	player.move(speed)
	
	if player.velocity.y < 0:
		return State.Fall
	elif player.is_on_floor():
		if player.move_direction() != 0:
			return State.Walk
		return State.Idle
	
	return State.Null
