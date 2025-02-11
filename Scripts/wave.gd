extends Node2D

## Despawns the wave node when the timer runs out
func _on_despawn_timer_timeout() -> void:
	# Local Variables
	#var all_child_nodes = get_children()
	#var reparent_to = get_parent()
	#
	## Main _on_despawn_timer_timeout()
	#all_child_nodes.erase($"Despawn Timer")
	#print(all_child_nodes)
	#for i in all_child_nodes:
		#i.reparent(reparent_to)
	#
	queue_free()
