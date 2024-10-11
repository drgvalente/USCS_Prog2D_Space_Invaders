extends Area2D

var speed = 5
var bullet_prefab = preload("res://bullet/bullet.tscn")
@onready var muzzle: Marker2D = $muzzle

var hp = 5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#muzzle = $muzzle
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_LEFT):
		#translate(Vector2(-speed, 0))
		#translate(Vector2(-1, 0) * speed)
		translate(Vector2.LEFT * speed)
	
	if Input.is_key_pressed(KEY_RIGHT):
		#translate(Vector2(speed, 0))
		#translate(Vector2(1, 0) * speed)
		translate(Vector2.RIGHT * speed)
		
	if Input.is_action_just_pressed("shoot"):
		var b = bullet_prefab.instantiate()
		owner.add_child(b)
		b.position = muzzle.global_position
	pass

func take_damage(dmg):
	hp -= dmg
	if hp <= 0:
		GameManager.player_dead()
		queue_free()
	
		

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Coins"):
		GameManager.gold_change(area.worth)
		area.queue_free()
	pass # Replace with function body.
