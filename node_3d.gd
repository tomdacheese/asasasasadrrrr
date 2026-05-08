extends Node3D
@onready var animation_player: AnimationPlayer = $provagiocounito/Camera3D/AnimationPlayer
@onready var camera_3d: Camera3D = $CharacterBody3D/Camera3D
@onready var camera_3d2: Camera3D = $provagiocounito/Camera3D
@onready var animation_player_2: AnimationPlayer = $provagiocounito/AnimationPlayer2

#sduahsuidhasuidhaushdui
#ahhdsafà

func _ready():
	animation_player_2.play("new_animation")
	await animation_player_2.animation_finished
	animation_player.play("alzata")
	await animation_player.animation_finished
	camera_3d2.current = false
	camera_3d.current = true
