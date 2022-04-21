extends Area2D

export var next_level_name = "Level1"

func _on_Exit_body_entered(body):
	if body.name == "Player":
		var _temp = get_tree().change_scene("res://Levels/" + next_level_name + ".tscn")
