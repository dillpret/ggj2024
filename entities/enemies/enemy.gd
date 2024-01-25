extends CharacterBody2D

@export var move_speed: float = 300

@onready var player = get_node("/root/Game/Player")

func  _physics_process(delta):
	var player_in_range = %ThrowingArea.get_overlapping_bodies()
	
	if player_in_range.size() != 1:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * move_speed
		move_and_slide()
		%EnemyVisuals.play_run_animation()
	else:
		%EnemyVisuals.play_idle_animation()
