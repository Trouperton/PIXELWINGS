extends Node2D

@export var seconds_to_finish_curve: float = 1
@export var loop_curve: bool = true
@export var path_curve: Curve

var ships: Array[Node]
var formation_reparent_node: Node

func _ready() -> void:
	print(ships)
	ships = get_children()
	ships.erase($"Despawn Timer")
	formation_reparent_node = get_parent()
	print(formation_reparent_node)
	print(ships)
	for instance in ships:
		instance.seconds_to_finish_curve = seconds_to_finish_curve
		instance.loop_curve = loop_curve
		instance.path_curve = path_curve
