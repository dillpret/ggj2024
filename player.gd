extends CharacterBody2D

const SPEED = 600
const PLAYER_PIE = preload("res://player_pie.tscn")
@export var throw_speed: float = 1000

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()

func throw():
	var new_pie = PLAYER_PIE.instantiate()
	var mouse_pos = get_global_mouse_position()
	var player_pos = global_position
	var angle_to_mouse = player_pos.angle_to_point(mouse_pos)
	var rotation_vector = Vector2.from_angle(angle_to_mouse)
	owner.add_child(new_pie)
	new_pie.transform = %ThrowPoint.global_transform
	new_pie.velocity = rotation_vector.normalized() * throw_speed

func _process(delta):
	if Input.is_action_just_pressed("throw_pie"):
		throw()
