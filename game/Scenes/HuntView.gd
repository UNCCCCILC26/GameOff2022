extends Camera2D

var screenSize = Vector2(1024,600)
var mapSize = Vector2(1300,700)
var mapOffset = Vector2((mapSize.x-screenSize.x)/2,(mapSize.y-screenSize.y)/2)
var edgeScale = 0.8
var cameraHomePosition = position

func _process(delta):
	var mousePos = get_viewport().get_mouse_position()
	if(mousePos.x >= screenSize.x * edgeScale and mousePos.x <= screenSize.x):
		position.x = cameraHomePosition.x + (mapOffset.x * ((mousePos.x-screenSize.x*edgeScale)/(mapOffset.x*2)))
	elif (mousePos.x <= screenSize.x - (screenSize.x * edgeScale) and mousePos.x >= 0):
		position.x = cameraHomePosition.x - (mapOffset.x * ((mapOffset.x*2)/(mousePos.x*edgeScale)))
	else:
		position.x = cameraHomePosition.x
