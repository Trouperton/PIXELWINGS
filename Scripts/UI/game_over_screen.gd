extends Control

func _on_visibility_changed() -> void:
	if visible:
		$"Panel/VBoxContainer/Retry Button".grab_focus()
		$"Panel/VBoxContainer/Score Label".text = "Score: " + str(get_tree().root.get_child(0).score)
		get_tree().paused = true

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
