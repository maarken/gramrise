extends Node2D

func _ready() -> void:
	%GameOver.visible = false
	
	
func spawn_mob():
	var MOB_INFECTED_MOUSE = preload("res://mob_infected_mouse.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	MOB_INFECTED_MOUSE.global_position = %PathFollow2D.global_position
	add_child(MOB_INFECTED_MOUSE)


func _on_timer_timeout() -> void:
	spawn_mob()


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_continue_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
