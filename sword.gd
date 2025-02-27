extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rotation_speed := 3
	self.rotate(delta*rotation_speed)



func _on_body_entered(body: Node2D) -> void:
	get_parent().add_score()
	body.set_physics_process(false)
	body.queue_free()
	
	
