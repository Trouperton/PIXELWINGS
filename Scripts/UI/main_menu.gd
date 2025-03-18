extends Control

@export var invisible_focus_style_box: StyleBox
@export var visible_focus_style_box: StyleBox

func _ready() -> void:
	get_tree().paused = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		pass
	else:
		pass
