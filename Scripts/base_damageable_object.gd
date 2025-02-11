extends Area2D

# Global Variables
@export var health: int = 100
@export var move_speed: float = 200
@export var primary_fire_projectile: PackedScene
@export var barrels: Array[Node2D]

var health_max: int
var move_direction: Vector2

# Class Functions

func _ready() -> void:
	health_max = health

func shoot_primary() -> void:
	# Local Variables
	
	# Main shoot()
	## Instantiates projectiles at each barrel of ship
	for instance in barrels:
		var spawned_projectile = primary_fire_projectile.instantiate()
		
		spawned_projectile.global_position = instance.global_position
		spawned_projectile.global_rotation = instance.global_rotation
		for group in get_groups():
			spawned_projectile.add_to_group(group)
		get_tree().current_scene.add_child(spawned_projectile)

func damage(damage_dealt: int):
	# Local Variables
	
	# Main damage()
	health -= damage_dealt
	if health < 1:
		despawn()

func despawn():
	# Local Variables
	
	# Main despawn()
	set_deferred("monitoring", false)
	visible = false
	$PrimaryFireCooldownTimer.stop()
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	# Local Variables
	
	# Main _on_area_entered()
	if area.is_in_group("Projectile") and not area.is_in_group(get_groups()[0]):
		damage(area.damage)
		area.despawn()
