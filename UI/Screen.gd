extends Control


func _ready():
	pass


func _on_Play_button_down():
	var _temp = get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Quit_button_down():
	Global.quit()
