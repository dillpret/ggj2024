extends CharacterBase

@export var game_over_screen: Control

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * move_speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		%PlayerVisuals.play_run_animation()
	else:
		%PlayerVisuals.play_idle_animation()
		
		
func _on_die():
	game_over_screen.visible = true
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = true


func _process(_delta):
	super._process(_delta)
	if health <= 0:
		_on_die()
	if Input.is_action_pressed("throw_pie"):
		throw_at(get_global_mouse_position())
