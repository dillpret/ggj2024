extends Node2D

@export var enemy: Resource
	
func spawn_enemy():
	var new_enemy = enemy.instantiate()
	
	%PathFollow2D.progress_ratio = randf()
	
	add_sibling(new_enemy)
	
	new_enemy.owner = get_parent()
	new_enemy.global_position = %PathFollow2D.global_position

func _on_timer_timeout():
	spawn_enemy()
