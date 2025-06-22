local flame_turret = data.raw["fluid-turret"]["flamethrower-turret"]
local flame_stream = data.raw["stream"]["flamethrower-fire-stream"]

local flame_turret_damage_modifier = settings.startup["flame_damage_modifier"].value
flame_turret.attack_parameters.damage_modifier = flame_turret_damage_modifier

local flame_turret_consumption_modifier = settings.startup["flame_consumption_modifier"].value
flame_turret.attack_parameters.fluid_consumption = flame_turret_consumption_modifier / 5

local flame_turret_arc = settings.startup["flame_arc"].value
flame_turret.attack_parameters.turn_range = flame_turret_arc / 360

local flame_turret_range = settings.startup["flame_range"].value
flame_turret.attack_parameters.range = flame_turret_range

local flame_turret_range_minimum = settings.startup["flame_range_min"].value
flame_turret.attack_parameters.min_range = flame_turret_range_minimum

local flame_turret_stream_buff_boolean = settings.startup["flame_stream_buff_boolean"].value
if flame_turret_stream_buff_boolean then
    local flame_turret_leading_modifier = 2
    local flame_stream_speed_modifier = 1.5
    flame_turret.attack_parameters.lead_target_for_projectile_speed = 0.225 * flame_turret_leading_modifier
    flame_stream.particle_vertical_acceleration = flame_stream.particle_vertical_acceleration * flame_stream_speed_modifier
    flame_stream.particle_horizontal_speed = flame_stream.particle_horizontal_speed * flame_stream_speed_modifier
    flame_stream.particle_horizontal_speed_deviation = flame_stream.particle_horizontal_speed_deviation * flame_stream_speed_modifier
    end

local flame_turret_heavy_oil_buff = settings.startup["flame_heavy_oil_buff"].value
local flame_turret_light_oil_buff = settings.startup["flame_light_oil_buff"].value
flame_turret.attack_parameters.fluids = {
    {type = "crude-oil"},
    {type = "heavy-oil", damage_modifier = flame_turret_heavy_oil_buff},
    {type = "light-oil", damage_modifier = flame_turret_light_oil_buff}
}