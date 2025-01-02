extends Area2D

@export var speed: float = 200
@export var projectile_scene: PackedScene
@export var shoot_cooldown: float = 1

var lmb_down: bool = false
var mouse_moved: bool = false
var mouse_position: Vector2

var shoot_timer: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lmb_down:
		#var direction = position.direction_to(mousePosition)
		#position += direction * speed * delta
		position = mouse_position
		if shoot_timer > shoot_cooldown:
			shoot()
			shoot_timer = 0
	shoot_timer += delta

func _input(event):
	# Local Variables

	# Main _input()
	# Checks which mouse buttons are pressed
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			lmb_down = true
		else:
			lmb_down = false
	
	# Updates mousePosition
	if event is InputEventMouseMotion:
		mouse_position = event.position

func shoot() -> void:
	# Local Variables
	var spawned_projectile = projectile_scene.instantiate()
	# Main _fire()
	spawned_projectile.global_position = global_position + Vector2(0, -20)
	
	get_tree().current_scene.add_child(spawned_projectile)
