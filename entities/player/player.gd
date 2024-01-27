extends CharacterBase

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * move_speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		%PlayerVisuals.play_run_animation()
	else:
		%PlayerVisuals.play_idle_animation()
		
		
func _on_die():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _process(_delta):
	super._process(_delta)
	if health <= 0:
		_on_die()
	if Input.is_action_pressed("throw_pie"):
		throw_at(get_global_mouse_position())
