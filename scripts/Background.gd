extends Sprite

func _ready():
	var window_size = OS.get_window_size()
	var texture_size = self.texture.get_size()
	var scale = Vector2(window_size.x / texture_size.x, window_size.y / texture_size.y)
	self.scale = scale
