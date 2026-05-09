extends CharacterBody3D

# --- Variabili per il movimento ---
const SPEED = 5.5
const JUMP_VELOCITY = 4.5

# --- Variabili per la visuale ---
@export var mouse_sensitivity := 0.003
@onready var camera: Camera3D = $Camera3D # Assicurati che il nodo Camera3D si chiami così
@onready var label: Label = $Label
var inter = null

func _ready():
	# Cattura il mouse e lo nasconde al centro della finestra
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	# Controlla se l'evento è un movimento del mouse
	if event is InputEventMouseMotion:
		# Ruota l'intero personaggio a sinistra/destra (asse Y)
		rotate_y(-event.relative.x * mouse_sensitivity)
		
		# Ruota solo la telecamera in alto/basso (asse X)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		
		# Limita la rotazione della telecamera per evitare che si ribalti (clamping)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _physics_process(delta: float) -> void:
	# Aggiungi la gravità
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Gestisci il salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Ottieni la direzione dell'input basata sulla rotazione del corpo
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	
func attiva_UI(oggetto):
	label.visible = true
	inter = oggetto
	
func disattiva_UI():
	label.visible = false
	inter = null
	
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("INTERACT"):
		if inter != null:
			inter.interact()
