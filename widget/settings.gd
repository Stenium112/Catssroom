extends Panel

@onready var window: Window = $".."
@onready var panel: Panel = $"."
@onready var header: Control = $Header
@onready var settings: VBoxContainer = $Settings
@onready var version: RichTextLabel = $Settings/Version
@onready var http_request: HTTPRequest = $Settings/Version/HTTPRequest


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panel.size.y = 100.0 + settings.size.y
	window.size = panel.size * panel.scale.x
	
	version.text = "Version : " + "[url=https://github.com/Stenium112/Catssroom/releases/tag/" + Global.version + "]" + Global.version + "[/url]"
	
	settings.re_adjust_child()
	
	http_request.request("https://api.github.com/repos/Stenium112/Catssroom/releases/latest")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left click"): window.start_drag()
	if settings.size.x != panel.size.x:
		panel.size.x = settings.size.x + 40
		window.size = panel.size * panel.scale.x
	

func _on_close_button_down() -> void:
	window.queue_free()

func _on_version_meta_clicked(meta: Variant) -> void:
	OS.shell_open(meta)

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = JSON.parse_string(body.get_string_from_utf8())
	var new_version: String = ""
	
	if response_code == 0:
		if json["name"] != Global.version:
			new_version = " | [color=red]New version available : [/color]" + "[url=" + json["html_url"] + "]" + json["name"] + "[/url]"
	version.text = str("Version : " + "[url=https://github.com/Stenium112/Catssroom/releases/tag/" + Global.version + "]" + Global.version + "[/url]" + new_version)
	
	settings.re_adjust_child()
