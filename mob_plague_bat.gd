extends CharacterBody2D


var mob_1_speed = 80.0
@onready var player=get_node("/root/Gramrise/Player")


func _physics_process(_delta):
	var direction=global_position.direction_to(player.global_position)
	velocity=direction*mob_1_speed
	move_and_slide()
