extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_quit_button_pressed():
	get_tree().quit()


func _on_replay_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
