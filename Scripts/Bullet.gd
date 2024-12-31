extends Area2D

@export var speed : int = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Local Variables
	
	# Main _process()
	Movement(delta)

func Movement(delta: float) -> void:
	# Local Variables
	var direction : Vector2
	
	# Main Movement()
	## This portion of the code calculates the movement direction vector
	## based on the rotation of the bullet object
	direction.x = cos((90 - rotation_degrees) * 3.14 / 180)
	direction.y = -(cos(rotation_degrees * 3.14 / 180))
	
	position += direction * speed * delta
