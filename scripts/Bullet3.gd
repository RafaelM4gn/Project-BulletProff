extends Area2D

var direction = Vector2.UP
var speed = 400
var health = 30
var damage = 30

func _process(delta: float) -> void:
	translate(direction.normalized() * speed * delta)


func _on_BulletVisibility_screen_exited():
	queue_free()
