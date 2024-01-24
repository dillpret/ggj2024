extends CharacterBody2D

@export var move_speed: float = 600
@export var throw_speed: float = 1000
@export var projectile: Resource

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * move_speed
	move_and_slide()
	
func get_pie_velocity() -> Vector2:
	var mouse_pos = get_global_mouse_position()
	var player_pos = global_position
	var angle_to_mouse = player_pos.angle_to_point(mouse_pos)
	var rotation_vector = Vector2.from_angle(angle_to_mouse)
	return rotation_vector.normalized() * throw_speed

func throw():
	var new_pie = projectile.instantiate()
	owner.add_child(new_pie)
	new_pie.transform = %ThrowPoint.global_transform
	new_pie.velocity = get_pie_velocity()

func _process(delta):
	if Input.is_action_just_pressed("throw_pie"):
		throw()
