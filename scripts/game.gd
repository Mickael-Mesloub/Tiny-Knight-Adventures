extends Node2D

func _ready() -> void:
	$Fade_Transition/AnimationPlayer.play("Fade_out")
	AudioController.main_menu_music.stop()
	AudioController.play_game_music()
