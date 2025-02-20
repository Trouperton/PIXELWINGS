extends Button

@export var is_the_first_selected_button: bool = false
@export var target_scene: PackedScene

func _ready() -> void:
	grab_focus()

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(target_scene)
