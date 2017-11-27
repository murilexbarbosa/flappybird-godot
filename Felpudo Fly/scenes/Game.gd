extends Node2D

onready var felpudo = get_node("Felpudo")
onready var timereplay = get_node("TimeToReplay")
onready var label = get_node("Node2D/Control/Label")

var pontos = 0
var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	pass
	
func kill():
	get_node("SomHit").play()
	felpudo.apply_impulse(Vector2(0,0),Vector2(-1000,0))
	get_node("BackAmin").stop()
	estado = PERDENDO
	timereplay.start()
	
func _on_TimeToReplay_timeout():
	get_tree().reload_current_scene()
	
func pontuar():
	get_node("SomScore").play()
	pontos += 1
	label.set_text(str(pontos))
