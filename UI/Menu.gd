extends Control


func _ready():
	hide()

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		var Music = get_node_or_null("/root/Game/Music")
		if not visible:
			get_tree().paused = true
			if Music != null:
				Music.stream_paused = true
			show()
		else:
			get_tree().paused = false
			if Music != null:
				Music.stream_paused = false
			hide()

func _on_Continue_pressed():
	get_tree().paused = false
	var Music = get_node_or_null("/root/Game/Music")
	if Music != null:
		Music.stream_paused = false
	hide()


func _on_Restart_pressed():
	Global.reset()
	var _scene = get_tree().change_scene("res://Game.tscn")
	get_tree().paused = false


func _on_Quit_pressed():
	get_tree().quit()
