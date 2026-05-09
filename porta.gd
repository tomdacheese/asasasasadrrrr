extends Node3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: CharacterBody3D = $"../player"

@onready var porta_area: Area3D = $"../PortaArea"

var ha_ineragito = false
func interact():
	if not ha_ineragito:
		animation_player.play("DoorPivotAction")
		player.disattiva_UI()
		porta_area.monitoring = false
