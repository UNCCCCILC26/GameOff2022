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
		var l = parse_json(save_game.get_line())
		Global.load(l)
		save_game.close()

func _on_StartButton_pressed():
	pass # Replace with function body.

func _on_SaveButton_pressed():
	save_game.open(savePath, File.WRITE)
	save_game.store_line(Time.get_datetime_string_from_system())
	save_game.store_line(to_json(Global.save()))
	save_game.close()
	_ready()
