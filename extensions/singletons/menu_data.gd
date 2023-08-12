extends "res://singletons/menu_data.gd"

func _init():
    var modloader = ModLoaderMod.new()
    var logger = ModLoaderLog.new()
    logger.info("installing now", "weapon details mod")
    modloader.install_script_extension("res://mods-unpacked/JohnTheTactician-DetailedWeaponStats/extensions/weapons/weapon_stats/weapon_stats.gd")
    logger.info("installing finished", "weapon details mod")
