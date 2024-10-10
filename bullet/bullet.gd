extends Area2D

var speed = 600

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	translate(Vector2.UP * speed * delta)
	if position.y < -50:
		queue_free()
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.take_damage()
	if area.is_in_group("Coins"):
		area.queue_free()
	queue_free()
	pass # Replace with function body.
