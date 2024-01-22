extends CharacterBody2D

const SPEED = 600

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()

func throw():
	const PLAYER_PIE = preload("res://player_pie.tscn")
	var new_pie = PLAYER_PIE.instantiate()
	new_pie.global_position = %ThrowPoint.global_position
	new_pie.global_scale = Vector2(1,1)
	#new_pie.global_rotation = %ThrowPoint
	%ThrowPoint.add_child(new_pie)

func _process(delta):
	if Input.is_action_pressed("throw_pie"):
		throw()
