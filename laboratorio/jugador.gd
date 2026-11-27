extends CharacterBody2D

@export var velocidad_maxima: float = 280.0
@export var aceleracion: float = 250.0
@export var frenado: float = 1000.0
@export var gravedad: float = 950.0
@export var velocidad_salto: float = 300.0

@onready var salida: Vector2 = position

func _physics_process(delta: float) -> void:
	var direccion := Input.get_axis("ui_left", "ui_right")
	var cambio := aceleracion if direccion != 0.0 else frenado
	velocity.x = move_toward(velocity.x, direccion * velocidad_maxima, cambio * delta)

	if not is_on_floor():
		velocity.y += gravedad * delta
	elif Input.is_action_just_pressed("ui_accept"):
		velocity.y = -velocidad_salto

	move_and_slide()

	if position.y > 490.0:
		position = salida
		velocity = Vector2.ZERO
