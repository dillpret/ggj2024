extends CharacterBase

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * move_speed
	move_and_slide()


func _process(_delta):
	super._process(_delta)
	if Input.is_action_pressed("throw_pie"):
		throw_at(get_global_mouse_position())
