extends Control

func _on_visibility_changed() -> void:
	# Local Variables
	
	# Main _on_visibility_changed()
	if visible:
		## Grabs focus to the retry button when the game over screen shows up
		$"Panel/VBoxContainer/Retry Button".grab_focus()
		
		## Updates the score label for the game over scene according to the scene manager's stored score
		$"Panel/VBoxContainer/Score Label".text = "Score: " + str(get_tree().root.get_child(0).score)
		get_tree().paused = true

func _on_retry_button_pressed() -> void:
	# Local Variable
	
	# Main _on_retry_button_pressed()
	get_tree().reload_current_scene()


func _on_main_menu_button_pressed() -> void:
	# Local Variable
	
	# Main _on_main_menu_button_pressed()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
