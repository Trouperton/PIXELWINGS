extends Node2D

@export_category("Player")
@export var spawn_position: Vector2i = Vector2i(320, 220)
@export var player_ship: PackedScene
@export var player_spawn: Node2D

@export_category("Waves")
@export var waves_to_spawn: Array[PackedScene]
@export var times_between_waves: Array[float]

var hud_reference

var score: int = 0

var wave_timer: float = 0
var wave_counter: int = 0

func _ready() -> void:
	# Local Variables
	
	# Main _ready()
	if player_ship == null:
		printerr("[Scene Manager] player_ship is unnasigned")
	if waves_to_spawn.is_empty():
		printerr("[Scene Manager] waves_to_spawn is empty")
	if times_between_waves.is_empty():
		printerr("[Scene Manager] times_between_waves is empty")
	
	hud_reference = get_node("HUD")
	
	spawn_player()

func _process(delta: float) -> void:
	# Local Variables
	
	# Main _process()
	if wave_counter < waves_to_spawn.size():
		wave_timer += delta
		if wave_timer >= times_between_waves[wave_counter]:
			var wave_to_instantiate = waves_to_spawn[wave_counter].instantiate()
			
			print("spawning wave")
			
			wave_to_instantiate.position = Vector2(0, 0)
			
			add_child(wave_to_instantiate)
			
			wave_counter += 1
			wave_timer = 0

func spawn_player():
	# Local Variables
	var player_to_spawn = player_ship.instantiate()
	# Main spawn_player()
	player_to_spawn.position = player_spawn.position
	
	add_child(player_to_spawn)

func add_to_score(input_score: int) -> void:
	# Local Variables
	
	# Main add_to_score()
	score += input_score
	hud_reference.update_score_label(score)
