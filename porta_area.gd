extends Area3D
@onready var porta: Node3D = $"../porta"



func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.attiva_UI(porta)
		



func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.disattiva_UI()
