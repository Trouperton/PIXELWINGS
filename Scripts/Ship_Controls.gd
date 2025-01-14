extends Area2D

@export var speed: float = 200
@export var primary_fire_projectile_scene: PackedScene
@export var shoot_cooldown: float = 1
@export var Barrels: Array[Node2D]

var movement_direction: Vector2

var shoot_timer: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += movement_direction.normalized() * speed * delta
	shoot_timer += delta

func _input(event):
	# Local Variables
	
	# Main _input()
	if event is InputEventKey and event.is_pressed():
		# The following 4 if statements handle pressed down keyboard movement input
		if event.is_action_pressed("up"):
			movement_direction.y -= 1
		if event.is_action_pressed("down"):
			movement_direction.y += 1
		if event.is_action_pressed("left"):
			movement_direction.x -= 1
		if event.is_action_pressed("right"):
			movement_direction.x += 1
		
		if event.is_action_pressed("primary_fire"):
			$PrimaryFireCooldownTimer.start()
	elif event is InputEventKey and event.is_released():
		# The following 4 if statements handle released keyboard movement input
		if event.is_action_released("up"):
			movement_direction.y += 1
		if event.is_action_released("down"):
			movement_direction.y -= 1
		if event.is_action_released("left"):
			movement_direction.x += 1
		if event.is_action_released("right"):
			movement_direction.x -= 1
		if event.is_action_released("primary_fire"):
			$PrimaryFireCooldownTimer.stop()

func shoot() -> void:
	# Local Variables
	#var spawned_projectile = primary_fire_projectile_scene.instantiate()
	
	# Main shoot()
	for i in Barrels:
		var spawned_projectile = primary_fire_projectile_scene.instantiate()
		
		spawned_projectile.global_position = i.global_position
		spawned_projectile.add_to_group("Player")
		get_tree().current_scene.add_child(spawned_projectile)
	#spawned_projectile.global_position = global_position + Vector2(0, -20)
	
	#get_tree().current_scene.add_child(spawned_projectile)

func _on_primary_fire_cooldown_timer_timeout() -> void:
	shoot()
