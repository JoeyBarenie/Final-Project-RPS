extends BaseState

export var speed = 500

func physics_process(_delta: float) -> int:
	player.move(speed)
	
	if player.pressed_jump:
		return State.Jump
	if !player.is_on_floor():
		return State.Fall
	elif player.move_direction() == 0:
		return State.Idle
	return State.Null
