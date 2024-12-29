extends Area2D

var lmbDown : bool = false
var mouseMoved : bool = false
var mousePosition : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lmbDown:
		position = mousePosition

func _input(event):
	# Local Variables

	# Main _input()
	# Checks which mouse buttons are pressed
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			lmbDown = true
		else:
			lmbDown = false
	
	# Updates mousePosition
	if event is InputEventMouseMotion:
		mousePosition = event.position
