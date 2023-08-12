# extends "res://weapons/weapon_stats/weapon_stats.gd"
extends ItemDescription

# Brief overview of what the changes in this file do...
# Expands weapon stats

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MYMOD_LOG = "JohnTheTactician-DetailedWeaponStats" # ! Change `MODNAME` to your actual mod's name
const MOD_DIR = "JohnTheTactician-DetailedWeaponStats/" # name of the folder that this file is in

# func _init():
# 	ModLoaderMod.new().call_deferred("install_script_extension", "res://mods-unpacked/JohnTheTactician-DetailedWeaponStats/extensions/weapons/weapon_stats/weapon_stats.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	# ModLoaderMod.new().call_deferred("install_script_extension", MOD_DIR + "extensions/weapons/weapon_stats/weapon_stats.gd")
	# ModLoaderMod.new().call_deferred("install_script_extension('res://mods-unpacked/JohnTheTactician-DetailedWeaponStats/extensions/weapons/weapon_stats/weapon_stats.gd')")
	# Utils.call_deferred("install_script_extension", MOD_DIR + "extensions/weapons/weapon_stats/weapon_stats.gd")
	ModLoaderLog.info("Inside of _ready() of extended weapon_stats.gd", MYMOD_LOG)
	# ModLoaderMod.install_script_extension("res://mods-unpacked/JohnTheTactician-DetailedWeaponStats/extensions/weapons/weapon_stats/weapon_stats.gd")
	ModLoaderLog.info("before call deferral of _ready() of extended weapon_stats.gd", MYMOD_LOG)
	# ModLoaderMod.new().call_deferred("install_script_extension", "res://mods-unpacked/JohnTheTactician-DetailedWeaponStats/extensions/weapons/weapon_stats/weapon_stats.gd")
	ModLoaderLog.info("after call deferral of _ready() of extended weapon_stats.gd", MYMOD_LOG)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_item(item_data)->void :
	.set_item(item_data)
	###todo and test
	if item_data is WeaponData:
		# var dps_array = calculate_dps(get_effect_damage())
		# ## todo 加上文本，DPS 和DPS （计入暴击）
		# var text = ""
		# text += "\n" + item.stats.col_a + tr("DPS_WITHOUT_CRIT") + item.stats.col_b + str(dps_array.front())
		# if dps_array.size() > 1:
		# 	text += "\n" + item.stats.col_a + tr("DPS_WITH_CRIT") + item.stats.col_b + str(dps_array.back())
		# get_weapon_stats().bbcode_text += text

		var weapstats = get_weapon_stats()
		
		var weapstats2 = weapstats if expand_indefinitely else _weapon_stats_scrolled
		weapstats2.set_text("testy")


# func get_text(base_stats:Resource)->String:
	# ModLoaderLog.info("inside of get_text of extended weapon_stats.gd", MYMOD_LOG)
	# var text = ""
	
	# text += Text.text("DAMAGE_FORMATTED", [col_a + tr("STAT_DAMAGE") + col_b, get_damage_text(base_stats)])
	
	# var critString = "\n" + Text.text("CRITICAL_FORMATTED", [col_a + tr("CRITICAL") + col_b, get_crit_damage_text(base_stats), get_crit_chance_text(base_stats)])  + col_b

	# # ModLoaderLog.info("final crit string", critString)
	# text += critString

	# text += "\n" + Text.text("STAT_FORMATTED", [col_a + tr("COOLDOWN") + col_b, get_cooldown_text(base_stats)])

	
	# text += get_knockback_text(base_stats)
	# text += get_range_text(base_stats)
	# text += get_bouncing_text(base_stats)
	# text += get_piercing_text(base_stats)
	# text += get_lifesteal_text(base_stats)
	# text += get_additional_cooldown_text(base_stats)
	# text += get_deal_dmg_on_return_text()
	# text += get_alternate_attack_type_text()
	
	# return text

# func get_crit_chance_text(base_stats:Resource)->String:
# 	# var original = .get_crit_chance_text(base_stats)
# 	var a = get_col_a(crit_chance, base_stats.crit_chance)
# 	var original = a + str(max(crit_chance * 100.0, 0)) + col_b
	
# 	var modified = original if crit_chance == base_stats.crit_chance else original+"%)" + init_a + "(" + str(max(base_stats.crit_chance * 100.0, 0))

# 	# ModLoaderLog.info("original crit string", original)
# 	# ModLoaderLog.info("modded crit string", modified)
	
# 	return modified

# func get_cooldown_text(base_stats:Resource, multiplier:float = 1.0)->String:
# 	var original = .get_cooldown_text(base_stats, multiplier)

# 	var cd = get_cooldown_value(base_stats)
# 	var base_cd = get_base_cooldown_value(base_stats)
# 	var a = get_col_a( - cd, - base_cd)
# 	# return a + str(stepify(cd * multiplier, 0.01)) + "s" + col_b

# 	var modified = original if cd == base_cd else a + str(stepify(cd * multiplier, 0.01)) + "s" + col_b + init_a + str(stepify(base_cd * multiplier, 0.01)) + "s"  + col_b
# 	# ModLoaderLog.info("modded cooldown string", modified)

# 	return modified
