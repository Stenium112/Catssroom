extends Panel

@onready var window: Window = $".."
@onready var panel: Panel = $"."
@onready var settings: VBoxContainer = $Settings
@onready var version: RichTextLabel = $Settings/Version
@onready var http_request: HTTPRequest = $Settings/Version/HTTPRequest

var mouse_in: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panel.size.y = 100.0 + settings.size.y
	window.size = panel.size * panel.scale.x
	
	version.text = tr("VERSION_TXT")
	
	settings.re_adjust_child()
	
	http_request.request("https://api.github.com/repos/Stenium112/Catssroom/releases/latest")

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("left click") and mouse_in:
		window.start_drag()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if settings.size.x != panel.size.x:
		panel.size = settings.size + Vector2(40, 140)
		window.size = panel.size * panel.scale.x
	

func _on_version_meta_clicked(meta: Variant) -> void:
	if Input.is_action_just_pressed("left click"):
		OS.shell_open(meta)

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = JSON.parse_string(body.get_string_from_utf8())
	var new_version: String = ""

	if result != 0:
		print("No internet for checking a new update ! / Github not available !")
		return

	if json == null:
		print("Json parse error")
		return
	
	if json is not Dictionary:
		print("Json not a dictionary : " + str(json))
	
	
	if !json.has("status"):
		if json["tag_name"] != Global.version:
			new_version = " | [color=red]New version available : [/color]" + "[color=blue][url=" + json["html_url"] + "]" + json["name"] + "[/url][/color]"
	else:
		print("Github release not available")
		return
	
	version.text = str(version.text + new_version)
	
	settings.re_adjust_child()


func _on_close_button_down() -> void:
	if Input.is_action_just_pressed("left click"):
		window.queue_free()


func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false
