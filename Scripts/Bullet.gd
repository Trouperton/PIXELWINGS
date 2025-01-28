extends Area2D

# Global Variables
@export var speed: int = 200
@export var damage: int = 10

# Class Functions

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Local Variables
	
	# Main _ready()
	#print(get_groups())
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Local Variables
	
	# Main _process()
	movement(delta)

func movement(delta: float) -> void:
	# Local Variables
	var direction : Vector2
	
	# Main movement()
	## This portion of the code calculates the movement direction vector
	## based on the rotation of the bullet object
	direction.x = cos((90 - rotation_degrees) * 3.14 / 180)
	direction.y = -(cos(rotation_degrees * 3.14 / 180))
	
	position += direction * speed * delta


func _on_despawn_timer_timeout() -> void:
	queue_free()
