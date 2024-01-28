extends Area2D

const RANGE = 1200

@onready var camera: Camera2D = get_node("/root/Game/Player/Camera2D")

@export var velocity: Vector2
@export var damage: float = 10
@export var max_camera_shake_strength: float = 30
@export var camera_shake_fade: float = 5

var camera_shake_strength: float = 0

var initial_position: Vector2

func _physics_process(delta):
	global_position += velocity * delta

	if (global_position - initial_position).length() >= RANGE:
		queue_free()
		
	if camera_shake_strength > 0:
			camera_shake_strength = lerpf(camera_shake_strength, 0, camera_shake_fade * delta)
			
			camera.offset = random_offset()

func _init():
	initial_position = transform.origin

func _on_body_entered(body):
	if body.has_method("take_hit"):
		body.take_hit(damage)
		
		apply_camera_shake()
		
		const SPLAT = preload("res://entities/projectiles/splat.tscn")
		var new_splat = SPLAT.instantiate()
		get_parent().add_child(new_splat)
		new_splat.global_position = global_position

	queue_free()

func apply_camera_shake():
	camera_shake_strength = max_camera_shake_strength
	
func random_offset() -> Vector2:
	var random_shake_strength = randf_range(-camera_shake_strength, camera_shake_strength)
	return Vector2(random_shake_strength, random_shake_strength)
