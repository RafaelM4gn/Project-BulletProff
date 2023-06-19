extends Area2D

var direction = Vector2.DOWN
var speed = 400
var hitted = false

func _process(delta: float) -> void:
	translate(direction.normalized() * speed * delta)
	if hitted == true:
		queue_free()

func _on_BulletVisibility_screen_exited():
	queue_free()


func _on_EnemyBulletHitbox_body_entered(body):
	hitted = true
