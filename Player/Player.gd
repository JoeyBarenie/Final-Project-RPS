class_name Player
extends KinematicBody2D

export var gravity = 100

var velocity = Vector2.ZERO
var was_grounded = true
var pressed_jump = false

onready var states = $StateMachine
onready var Animations = $Animations
onready var Coyote = $Coyote
onready var JumpBuffer = $JumpBuffer

func _ready():
	states.init(self)

func _unhandled_input(event):
	states.input(event)

func _physics_process(delta):
	if is_on_floor():
		was_grounded = true
	
	states.physics_process(delta)

func _input(event):
	if Input.is_action_just_pressed("up"):
		pressed_jump = true
		JumpBuffer.start()

func _on_Coyote_timeout():
	was_grounded = false

func _on_JumpBuffer_timeout():
	pressed_jump = false
