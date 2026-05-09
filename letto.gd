extends Node3D
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var camera_3d: Camera3D = $Node3D/Camera3D
@onready var camera_3d_player: Camera3D = $player/Camera3D


func _ready() -> void:
	animation_player_2.play("new_animation")
	await animation_player_2.animation_finished
	await get_tree().create_timer(0.4).timeout
	animation_player.play("alzata")
	await animation_player.animation_finished
	camera_3d.current = false
	camera_3d_player.current = true
	
