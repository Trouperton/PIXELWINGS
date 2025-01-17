extends "res://Scripts/base_damageable_object.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Local Variables
	
	# Main _ready()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Local Variables
	
	# Main _process()
	position += move_direction.normalized() * move_speed * delta

func _input(event):
	# Local Variables
	
	# Main _input()
	if event is InputEventKey and event.is_pressed():
		# The following 4 if statements handle pressed down keyboard movement input
		if event.is_action_pressed("up"):
			move_direction.y -= 1
		if event.is_action_pressed("down"):
			move_direction.y += 1
		if event.is_action_pressed("left"):
			move_direction.x -= 1
		if event.is_action_pressed("right"):
			move_direction.x += 1
		
		if event.is_action_pressed("primary_fire"):
			$PrimaryFireCooldownTimer.start()
	elif event is InputEventKey and event.is_released():
		# The following 4 if statements handle released keyboard movement input
		if event.is_action_released("up"):
			move_direction.y += 1
		if event.is_action_released("down"):
			move_direction.y -= 1
		if event.is_action_released("left"):
			move_direction.x += 1
		if event.is_action_released("right"):
			move_direction.x -= 1
		
		if event.is_action_released("primary_fire"):
			$PrimaryFireCooldownTimer.stop()

# This function triggers when the connected timer runs out
func _on_primary_fire_cooldown_timer_timeout() -> void:
	# Local Variables
	
	# Main _on_primary_fire_cooldown_timer_timeout()
	shoot_primary()
