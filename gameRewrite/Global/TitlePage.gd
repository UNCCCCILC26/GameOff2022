extends Control

var popup
var save_game = File.new()
var savePath = "user://savegame.save"

func _ready():
	popup = $LoadButton.get_popup()
	var s = getSaves() 
	popup.clear()
	if(int(s) == -1):
		popup.add_item("No Saves Avaliable", -1)
	else:
		popup.add_item(s, 1)
		popup.connect("id_pressed", self, "_on_item_pressed")

func getSaves():
	if not save_game.file_exists(savePath):
		return -1
	else:
		save_game.open(savePath, File.READ)
		var saveTime = save_game.get_line()
		save_game.close()
		return saveTime

func _on_item_pressed(ID):
	if(ID == 1):
		save_game.open(savePath, File.READ)
		save_game.get_line()
		Global.load(parse_json(save_game.get_line()))
		save_game.close()

func _on_StartButton_pressed():
	if(get_tree().current_scene.name != "Title"):
		var scene = load("res://Global/Cutscene.tscn")
		var instance = scene.instance()
		match(Global.currentScene):
			0: 
				instance.SceneSwitch = load("res://Resturaunt/Resteraunt.tscn")
			1:
				instance.SceneSwitch = load("res://Shop/Shop.tscn")
			2:
				instance.SceneSwitch = load("res://Hunting/Hunting.tscn")
			_:
				instance.SceneSwitch = load("res://Resturaunt/Resteraunt.tscn")
		instance.cutscene = 0
		instance.cutsceneName = "introCutscene"
		var root = get_tree().get_root()
		var current_scene = root.get_children()
		for c in current_scene:
			if(c.name != "Global"):
				c.queue_free()
		get_tree().get_root().add_child(instance)
		get_tree().set_current_scene(instance)
	else:
		queue_free()


func _on_SaveButton_pressed():
	save_game.open(savePath, File.WRITE)
	save_game.store_line(Time.get_datetime_string_from_system())
	save_game.store_line(to_json(Global.save()))
	save_game.close()
	_ready()
