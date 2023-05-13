extends Node2D

var positions = [-120, -60, 0, 60, 120]
var current_position = 2
var y = 180
var player_speed = 0.1

onready var tween = $Tween
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# tests

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(positions[current_position], y)

func move_left():
	#check if player is not moving
	if tween.is_active():
		return
	elif current_position > 0:
		current_position -= 1
		tween.interpolate_property(self, "position", self.position, Vector2(positions[current_position], y), player_speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func move_right():
	if tween.is_active():
		return
	elif current_position < positions.size() - 1:
		current_position += 1
		tween.interpolate_property(self, "position", self.position, Vector2(positions[current_position], y), player_speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
#func _process(delta):
#	pass

func _process(_delta):
	if Input.is_action_just_pressed("move_left"):
		move_left()
	if Input.is_action_just_pressed("move_right"):
		move_right()
