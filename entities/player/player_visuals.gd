extends Node2D

func play_run_animation():
	%AnimationPlayer.play("run")

func play_idle_animation():
	%AnimationPlayer.play("idle")

func play_fall_down_animation():
	%AnimationPlayer.play("fall_down")

func _on_animation_finished(anim_name: StringName):
	if anim_name == "fall_down" and owner.has_method("finished_falling_down"):
		owner.finished_falling_down()
