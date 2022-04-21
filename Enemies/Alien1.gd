extends KinematicBody2D

export var speed = 300
export var jump_force = 200
export var gravity = 300
export var jump_threshold = 10
export var damage = 1
export var state = "Idle"
var old_state = "Null"
var velocity = Vector2.ZERO
var player = null
var follow = false

onready var Animations = $AnimatedSprite

func _physics_process(delta):
	if player != null and follow:
		change_state("Run", "Run")
		if player.global_position < global_position:
			velocity.x = -1
			Animations.flip_h = true
		else:
			velocity.x = 1
			Animations.flip_h = false
		velocity.x *= speed
		if player.global_position.y < global_position.y - jump_threshold:
			jump()
	else:
		change_state("Idle", "Idle")
	velocity.y += gravity * delta
	velocity.y = move_and_slide(velocity, Vector2.UP).y

func _on_Follow_body_entered(body):
	if body.name == "Player":
		if !follow:
			follow = true
			player = body
			$Growl.play()

func jump():
	if is_on_floor():
		velocity.y = -jump_force

func _on_HitBox_body_entered(body):
	if body.name == "Player":
		body.damage(damage)

func change_state(animation, new_state):
	if new_state != state:
		old_state = state
		new_state = state
		Animations.play(animation)
