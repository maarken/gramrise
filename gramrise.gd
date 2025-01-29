extends Node2D


	
	
func spawn_mob():
	var MOB_INFECTED_MOUSE = preload("res://mob_infected_mouse.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	MOB_INFECTED_MOUSE.global_position = %PathFollow2D.global_position
	add_child(MOB_INFECTED_MOUSE)


func _on_timer_timeout() -> void:
	spawn_mob()
