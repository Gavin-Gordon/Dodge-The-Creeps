extends Node

@export var mob_scene: PackedScene
var score
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	pass # Replace with function body.

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	pass # Replace with function body.


func _on_score_timer_timeout():
	score += 1
	pass # Replace with function body.


func _on_mob_timer_timeout():
	# Creates a new instance of the mob scene
	var mob = mob_scene.instantiate()
	
	# Chooses a random location on Path2D
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	# Sets the mob direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI/2
	
	# Sets the mob location to a random position
	mob.position = mob_spawn_location.position
	
	# Adds some randomness to the direction
	direction = randf_range(-PI/4, PI/4)
	mob.rotation = direction
	
	# Chooses the velocity for the mob
	var velocity = Vector2(randf_range(150.0,250), 0)
	mob.linear_velocity = velocity.rotated(direction)
	
	#Spawn a child instance of the mob
	add_child(mob)
	
	pass # Replace with function body.
