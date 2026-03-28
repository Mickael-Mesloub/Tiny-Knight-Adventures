extends Control



var button_type = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioController.play_menu_music()

func _on_start_button_pressed() -> void:
	button_type = "start"
	$Fade_Transition.show()
	$Fade_Transition/Fade_timer.start()
	$Fade_Transition/AnimationPlayer.play("Fade_in")
	
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_fade_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_exit_button_pressed() -> void:
	$Fade_Transition.show()
	$Fade_Transition/Fade_timer.start()
	$Fade_Transition/AnimationPlayer.play("Fade_out")
	get_tree().quit()
