extends Node

@onready var bg_music: AudioStreamPlayer = $bg_music
@onready var main_menu_music: AudioStreamPlayer = $main_menu_music


func play_menu_music():
	main_menu_music.play()
	
func play_game_music():
	bg_music.play()
