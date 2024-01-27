extends Node2D

func play_run_animation():
	%AnimationPlayer.play("run")

func play_idle_animation():
	%AnimationPlayer.play("idle")

func play_fall_down_animation():
	%AnimationPlayer.play("fall_down")
