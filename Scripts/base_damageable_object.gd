extends Area2D

@export var health: int = 100
@export var move_speed: float = 200
@export var primary_fire_projectile: PackedScene
@export var barrels: Array[Node2D]

var move_direction: Vector2

func shoot_primary() -> void:
	# Local Variables
	
	# Main shoot()
	for i in barrels:
		var spawned_projectile = primary_fire_projectile.instantiate()
		
		spawned_projectile.global_position = i.global_position
		spawned_projectile.global_rotation = i.global_rotation
		for group in get_groups():
			spawned_projectile.add_to_group(group)
		get_tree().current_scene.add_child(spawned_projectile)
