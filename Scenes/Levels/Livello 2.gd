extends Node2D

var extinguisher_area : Area2D
var time_start = 0
var time_now = 0
export var time_elapsed = 0
var paused = false

func _ready():
	extinguisher_area = $Fire_Estinguisher_Area
	extinguisher_area.connect("is_entered_extintor", self, "_on_extinguisher_is_entered")
	time_start = OS.get_unix_time()
	
func _on_extinguisher_is_entered():
	$CanvasLayer_Win/Popup_Win.show()
	$CanvasLayer_Win/Popup_Win/Label_Win.text = ("\nHAI VINTO!\nTempo impiegato per completare il livello: " + str(time_elapsed) + " secondi")
	print("arrivato")
	$Player.speed = 0


func _process(delta):
	time_now = OS.get_unix_time()
	time_elapsed = time_now - time_start
	$CanvasLayer/Label_FPS.text = str(Engine.get_frames_per_second()) + " FPS"
	#print(time_elapsed)


func _on_Area2D_body_entered(body):
	$CanvasLayer_Dead/Popup_Dead.show()
	$Player.speed = 0


func _on_Button_Dead_Esci2_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	get_tree().paused = false


func _on_Button_Dead_Ripirova_pressed():
	get_tree().change_scene("res://Scenes/Levels/Livello 2.tscn")
	get_tree().paused = false




func _on_Button_Win_Coll_pressed():
	get_tree().change_scene("res://Scenes/Menu/HUD_COLLECT.tscn")
	get_tree().paused = false


func _on_Button_Win_Esci_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	get_tree().paused = false