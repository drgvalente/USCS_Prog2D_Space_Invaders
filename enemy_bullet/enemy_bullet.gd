extends Area2D

var speed = 400
var damage = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	translate(Vector2.DOWN * speed * delta)
	if position.y > 700:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		area.take_damage(damage)
		queue_free()
	pass # Replace with function body.
