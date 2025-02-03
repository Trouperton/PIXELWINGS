extends Node2D

@export_category("Formation Type")
@export var spawns_waves: bool = false
@export var time_between_waves: float = 1
@export var waves_of_ships: int = 1
@export var ships_shoot: bool = true
@export var ship_to_spawn: PackedScene

@export_category("Movement Pattern")
@export var seconds_to_finish_curve: float = 1
@export var loop_curve: bool = true
@export var path_curve: Curve

var child_ships: Array[Node]
var reparent_node: Node
var wave_counter: int = 0
var wave_spawn_positions: Array[Vector2]
var wave_spawn_rotations: Array[float]

func _ready() -> void:
	# Local Variables
	
	# Main _ready()
	print("F ready")
	reparent_node = get_parent()
	get_children_except($"Deploy Timer")
	if spawns_waves:
		$"Deploy Timer".one_shot = false
		$"Deploy Timer".wait_time = time_between_waves
		for i in child_ships:
			wave_spawn_positions.append(i.global_position)
			wave_spawn_rotations.append(i.global_rotation_degrees)



func _on_deploy_timer_timeout() -> void:
	# Local Variables
	
	# Main _on_deploy_timer_timeout()
	if child_ships.is_empty():
		#child_ships = get_children()
		#child_ships.erase($"Deploy Timer")
		for i in wave_spawn_positions.size():
			var spawned_ship = ship_to_spawn.instantiate()
			
			add_child(spawned_ship)
			spawned_ship.global_position = wave_spawn_positions[i]
			spawned_ship.global_rotation_degrees = wave_spawn_rotations[i]
		get_children_except($"Deploy Timer")
	
	deploy_ships_from_formation()
	wave_counter += 1
	#for i in child_ships:
		#i.seconds_to_finish_curve = seconds_to_finish_curve
		#i.loop_curve = loop_curve
		#i.path_curve = path_curve
	#
	#for i in child_ships:
		#i.reparent(reparent_node)
	if not spawns_waves or wave_counter >= waves_of_ships:
		queue_free()

## Gets all the children of the node and removes the target node from the array
func get_children_except(target_node) -> void:
	# Local Variables
	
	# Main get_children_except()
	child_ships = get_children()
	child_ships.erase(target_node)

## Assigns variables intended for the ships from the formation node to the child
## ships and then reparents them to the parent of the formation.
## Also clears the child_ships array.
func deploy_ships_from_formation() -> void:
	# Local Variables
	
	# Main deploy_ships_from_formation()
	for i in child_ships:
		i.seconds_to_finish_curve = seconds_to_finish_curve
		i.loop_curve = loop_curve
		i.path_curve = path_curve
		i.get_node("PrimaryFireCooldownTimer").paused = !ships_shoot
		i.reparent(reparent_node)
	child_ships.clear()
