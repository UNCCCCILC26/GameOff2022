extends Control

onready var player = $VideoPlayer

var VideoPath: String = "res://Assets/Videos/"
var Videos: Array
var CurrentVideo: int = 0

export(int, "intro") var cutscene = 0
export(PackedScene) var SceneSwitch
export var cutsceneName = "introCutscene"

func _ready():
	getChannels()
	print(Videos)
	player.stream = load(Videos[cutscene])
	player.play()
	
func _enter_tree():
	skipIfNeeded()

func getChannels():
	var Dir = Directory.new()
	if Dir.open(VideoPath) == OK:
		Dir.list_dir_begin(true, true)
		var FileName = Dir.get_next()
		while FileName != "":
			Videos.append(VideoPath + FileName)
			FileName = Dir.get_next()
	else:
		print("An Error occured While Trying to Access: ", VideoPath)

func moveOn():
	Global.progress[cutsceneName] = true
	var root = get_tree().get_root()
	var current_scene = root.get_children()
	for c in current_scene:
		if(c.name != "Global"):
			c.queue_free()
	current_scene = SceneSwitch.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

func _on_VideoPlayer_finished():
	moveOn()

func _on_Skip_pressed():
	moveOn()

func skipIfNeeded():
	if Global.progress[cutsceneName]:
		moveOn()
