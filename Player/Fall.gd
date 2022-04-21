extends BaseState

export var speed = 500
export var fall_multiplier = 1.75

func enter():
	if player.was_grounded:
		player.Coyote.start()
	player.gravity *= fall_multiplier

func physics_process(_delta):
	player.move(speed)
	
	if player.pressed_jump and player.was_grounded:
		return State.Jump
	if player.is_on_floor():
		if player.move_direction() != 0:
			return State.Walk
		return State.Idle
	
	return State.Null

func exit():
	player.gravity /= fall_multiplier
