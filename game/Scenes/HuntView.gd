extends Camera2D

var screenSize = Vector2(1024,600)
var mapSize = Vector2(1300,700)
var mapOffset = Vector2((mapSize.x-screenSize.x)/2,(mapSize.y-screenSize.y)/2)
var edgeScale = 0.8
var cameraHomePosition = position

var gap = Vector2(mapSize.x-screenSize.x,mapSize.y-screenSize.y)

func _ready():
	print(cameraHomePosition)

func _process(_delta):
	var mousePos = get_viewport().get_mouse_position()
	var distancePercentage = Vector2((gap.x - mousePos.x)/(screenSize.x-(screenSize.x*edgeScale)),(gap.y - mousePos.y)/(screenSize.y-(screenSize.y*edgeScale)))
	if(distancePercentage.x < 0):
		distancePercentage.x = 0
	if(distancePercentage.y < 0):
		distancePercentage.y = 0
	print(mousePos)
	
	if(mousePos.x >= screenSize.x * edgeScale and mousePos.x <= screenSize.x):
		position.x = cameraHomePosition.x + (mapOffset.x * ((mousePos.x-screenSize.x*edgeScale)/(mapOffset.x*2)))
	elif (distancePercentage.x > 0 and distancePercentage.x < 1):
		position.x = -1*((gap.x/2)*distancePercentage.x)
	elif(distancePercentage.x > 1):
		position.x = -1*(gap.x/2)
	else:
		position.x = cameraHomePosition.x
	
	if (mousePos.y <= screenSize.y - (screenSize.y * edgeScale) and mousePos.y >= 0):
		position.y = -1*(gap.y*distancePercentage.y)
	else:
		position.y = cameraHomePosition.y
