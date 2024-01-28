extends CharacterBase

@onready var player: Node2D = get_node("/root/Game/Player")

func _get_player_position() -> Vector2:
	return player.global_position


func _is_player_in_range() -> bool:
	var players_in_range = %ThrowingArea.get_overlapping_bodies()
	return players_in_range.size() >= 1


func _physics_process(_delta):
	if not _is_player_in_range() and health > 0:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * move_speed
		move_and_slide()
		%EnemyVisuals.play_run_animation()
		
func finished_falling_down():
	print("finished falling down!")
	queue_free()


func _process(_delta):
	super._process(_delta)
	if health <= 0:
		%EnemyVisuals.play_fall_down_animation()
	elif _is_player_in_range():
		throw_at(_get_player_position())
		%EnemyVisuals.play_idle_animation()
