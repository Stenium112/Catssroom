extends Node

var config: ConfigFile = ConfigFile.new()
var path_to_config: String = "user://config.cfg"



func _ready() -> void:
	var error: Error = load_config()
	if error != OK:
		print("Failed to load config with error : " + str(error))


func load_config() -> Error:
	var error: Error = config.load(path_to_config)
	
	if error != OK:
		print("Config file failed to load via : " + path_to_config + ", and returned : " + str(error))
		print("Trying to create config.conf at : " + path_to_config)
		error = default_config() # Write the config if load failed
		if error != OK:
			print("Config file failed to create file at : " + path_to_config + ", and returned : " + str(error))
			print("Giving up, you will not be able to save the config file")
			return error
		
		print("Created config.cfg at : " + path_to_config)
		return error
	return error # Here, this is not needed but it's required for the compiler

func default_config() -> Error:
	var language: String = OS.get_locale_language()
	if language != "fr": language = "en"
	
	# Add here for set your value
	config.set_value("Miscellaneous", "Language", language)
	config.set_value("Miscellaneous", "MaxFPS", 60)
	
	var error: Error = config.save(path_to_config)
	return error

func apply_config() -> void:
	TranslationServer.set_locale(config.get_value("Miscellaneous", "Miscellaneous", "en"))
	print(TranslationServer.)
	Engine.max_fps = config.get_value("Miscellaneous", "MaxFPS", 60)
	# Add here for applying some things of th config


# Use config.save(config.path_to_config) to save, and add error etc...
