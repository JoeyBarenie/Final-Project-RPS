class_name Player
extends KinematicBody2D

export var gravity = 60

# Must be positive
export var slow_multiplier = 0.5

var velocity = Vector2.ZERO
var was_grounded = true
var pressed_jump = false
var is_slow = false

onready var states = $StateMachine
onready var Animations = $Animations
onready var Coyote = $Coyote
onready var JumpBuffer = $JumpBuffer

var coyote_default = 0.1
var jump_buffer_default = 0.1

func _ready():
	coyote_default = Coyote.wait_time
	jump_buffer_default = JumpBuffer.wait_time
	states.init(self)

func _unhandled_input(event):
	states.input(event)

func _physics_process(delta):
	if is_on_floor():
		was_grounded = true
	
	states.physics_process(delta)

func _input(_event):
	if Input.is_action_just_pressed("up"):
		pressed_jump = true
		JumpBuffer.start()
	if Input.is_action_pressed("slow"):
		slow()
	else:
		slow_exit()

func slow():
	is_slow = true
	Coyote.wait_time = 0.1 * slow_multiplier
	JumpBuffer.wait_time = 0.1 * slow_multiplier
	Engine.time_scale = slow_multiplier

func slow_exit():
	is_slow = false
	Coyote.wait_time = coyote_default
	JumpBuffer.wait_time = jump_buffer_default
	Engine.time_scale = 1

#No longer grounded when the timer ends
func _on_Coyote_timeout():
	was_grounded = false

#Jump's no longer pressed when the timer ends
func _on_JumpBuffer_timeout():
	pressed_jump = false

func move(speed):
	velocity.x = move_direction() * speed
	velocity.y += gravity
	if is_slow:
		velocity.x /= slow_multiplier
	velocity = move_and_slide(velocity, Vector2.UP)

func move_direction():
	if Input.is_action_pressed("left"):
		Animations.flip_h = true
		return -1
	elif Input.is_action_pressed("right"):
		Animations.flip_h = false
		return 1
	return 0
