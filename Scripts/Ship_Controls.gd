extends Area2D

var lmbDown : bool = false
var mouseMoved : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	# Local Variables

	# Main _input()
	
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			lmbDown = true
		else:
			lmbDown = false
	if event is InputEventMouseMotion:
		mouseMoved = true
	else:
		mouseMoved = false
	
	if lmbDown and mouseMoved:
		position = event.position
		print("Moving Player")
