extends Camera2D


func _physics_process(_delta):
	var player = get_node_or_null("/root/Levels/Player_Container/Player")
	if player != null:
		position = player.position
