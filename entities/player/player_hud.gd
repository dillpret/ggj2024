extends Control

@export var player: CharacterBase

func _process(delta):
	$HealthBar.value = player.health
