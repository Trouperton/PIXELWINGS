extends Node2D

@export var clouds_scenes: Array[PackedScene]
@export var cloud_speed: float
@export var spawn_interval_min: float = 1
@export var spawn_interval_max: float = 3

var spawn_timer: float = 0
var spawn_interval: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	spawn_interval = randf_range(spawn_interval_min, spawn_interval_max)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_timer += delta
	
	if spawn_timer > spawn_interval:
		var cloud_to_spawn = clouds_scenes[randi_range(0, clouds_scenes.size() - 1)].instantiate()
		
		cloud_to_spawn.position = Vector2(randf_range(0, 640), -50)
		cloud_to_spawn.speed = cloud_speed
		
		add_child(cloud_to_spawn)
		
		spawn_timer = 0
		spawn_interval = randf_range(spawn_interval_min, spawn_interval_max)
		
		print(get_child_count())
