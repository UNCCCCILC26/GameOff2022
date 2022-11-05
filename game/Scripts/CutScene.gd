extends Node2D

onready var TV = $VideoPlayer

var ChannelPath = "res://Assets/Videos/"
var Channels: Array
var CurrentChannel: int = 0

var Power: bool = false

export(int, "intro") var cutscene = 0
export(PackedScene) var SceneSwitch

# Called when the node enters the scene tree for the first time.
func _ready():
	GetChannels()
	print(Channels)
	TV.stream = load(Channels[cutscene])
	TV.play()


func GetChannels():
	var Dir = Directory.new()
	if Dir.open(ChannelPath) == OK:
		Dir.list_dir_begin(true,true)
		var FileName = Dir.get_next()
		while FileName != "":
			Channels.append(ChannelPath+FileName)
			FileName = Dir.get_next()
	else:
		print("An Error Occured While Trying to Access: ", ChannelPath)

func moveOn():
	var root = get_tree().get_root()
	var current_scene = root.get_children()
	for c in current_scene:
		c.queue_free()
	current_scene = SceneSwitch.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
	

func _on_VideoPlayer_finished():
	moveOn()


func _on_Skip_pressed():
	moveOn() # Replace with function body.
