extends Area2D

const RANGE = 1200

@export var velocity: Vector2

var travelled_distance = 0
var initial_position: Vector2

func _physics_process(delta):
	transform.origin += velocity * delta
	
	if (transform.origin - initial_position).length() >= RANGE:
		queue_free()
		
func _init():
	initial_position = transform.origin

func _on_body_entered(body):
	if body.has_method("take_hit"):
		body.take_hit()
			
	queue_free()
	
