extends Node2D

func _ready():
	%AnimationPlayer.play("get_splatted")
	%AudioStreamPlayer.play()
	await %AnimationPlayer.animation_finished
	queue_free()
