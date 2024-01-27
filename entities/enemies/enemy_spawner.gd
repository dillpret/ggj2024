extends Area2D

@export var enemy: Resource

@onready var radius = $CollisionShape2D.get_shape().radius
	
func spawn_enemy():
	var new_enemy = enemy.instantiate()
	var degrees = randf_range(0, 360)
	var position_on_circle = Vector2(radius * cos(deg_to_rad(degrees)), radius * sin(deg_to_rad(degrees)))
	
	add_child(new_enemy)
	
	new_enemy.owner = self
	new_enemy.global_position = position_on_circle

func _on_timer_timeout():
	spawn_enemy()
