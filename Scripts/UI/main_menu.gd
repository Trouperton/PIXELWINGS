extends Control

@export var invisible_focus_style_box: StyleBox
@export var visible_focus_style_box: StyleBox

func _ready() -> void:
	# Local Variables
	
	# Main _ready()
	get_tree().paused = false

func _input(event: InputEvent) -> void:
	# Local Variables
	
	# Main _input()
	if event is InputEventMouseMotion:
		pass
	else:
		pass
