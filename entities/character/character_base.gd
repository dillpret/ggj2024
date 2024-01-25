class_name CharacterBase

extends CharacterBody2D

@export_group("Movement")
@export var move_speed: float = 600

@export_group("Pie Throwing")
@export var throw_speed: float = 1000
@export var projectile: Resource
@export var throw_cooldown: float = 0.5
@export var throw_point: Node2D

var current_throw_cooldown: float = throw_cooldown

func get_pie_velocity_to_target(target: Vector2) -> Vector2:
	var my_pos = global_position
	var angle_to_target = my_pos.angle_to_point(target)
	var rotation_vector = Vector2.from_angle(angle_to_target)
	return rotation_vector.normalized() * throw_speed

func throw_at(target: Vector2):
	if not can_throw():
		return
	var new_pie = projectile.instantiate()
	owner.add_child(new_pie)
	new_pie.transform = throw_point.global_transform
	new_pie.velocity = get_pie_velocity_to_target(target)
	new_pie.look_at(target)
	current_throw_cooldown = throw_cooldown

func _process(delta):
	if current_throw_cooldown > 0:
		current_throw_cooldown -= delta

func can_throw() -> bool:
	return current_throw_cooldown <= 0
