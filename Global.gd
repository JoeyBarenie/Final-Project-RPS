extends Node

func _ready():
	pause_mode = PAUSE_MODE_PROCESS

func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		pause()

func pause():
	get_node("/root/Game/CanvasLayer/Pause").show()
	get_tree().paused = true

func unpause():
	get_node("/root/Game/CanvasLayer/Pause").hide()
	get_tree().paused = false

func quit():
	get_tree().quit()

func lose():
	var _temp = get_tree().change_scene("res://UI/Lose.tscn")
