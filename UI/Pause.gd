extends Control

func _on_Continue_button_down():
	Global.unpause()

func _on_Quit_button_down():
	Global.quit()
