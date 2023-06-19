extends Area2D

var direction = Vector2.DOWN
var speed = 400

func _process(delta: float) -> void:
	translate(direction.normalized() * speed * delta)

func _on_TrashVisibility_screen_exited():
	queue_free()
