extends CharacterBody2D


var score = 0

#var velocity = Vector2.ZERO
var max_speed = 200.0
var accel = 1500.0
var friction = 600.0

var health = 100.0
signal health_depleted

#Initiate Healthbar
func _ready() -> void:
	$ProgressBar.value = health
	
func add_score():
	score += 1
	$Score.value = score
	
func _physics_process(delta):
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * max_speed, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()

	if velocity.length()>0.0:
		%player_sprite.play("walk")
	else:
		%player_sprite.play("idle")
		
		
	const damage_rate = 10.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= damage_rate * overlapping_mobs.size() * delta
		$ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
		
