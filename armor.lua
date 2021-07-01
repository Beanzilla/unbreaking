-- From
-- 3d_armor

-- support for MT game translation.
local S = minetest.get_translator("unbreaking")

-- Support both Minetest Game and MineClone2
local mt_g = minetest.get_modpath("default") or nil
local mcl2 = minetest.get_modpath("mcl_core") or nil

if mcl2 then
    local mcl_armor = rawget(_G, "mcl_armor") or {} -- error("[unbreaking] Failed to obtain API from MineClone2! (Assets)")
    local mcl_armor2 = {
	    longdesc = S("This is a piece of equippable armor which reduces the amount of damage you receive."),
	    usage = S("To equip it, put it on the corresponding armor slot in your inventory menu."),
	    elements = { 
            head = { name = "helmet", description = "Helmet", durability = unbreaking_uses.6857, index = 2,},
		    torso = {name = "chestplate", description = "Chestplate", durability = 1.0, index = 3,},
		    legs = {name = "leggings", description = "Leggings", durability = unbreaking_uses.9375, index = 4,},
		    feet = {name = "boots", description = "Boots", durability = unbreaking_uses.8125, index = 5,}
	    },
	    player_view_range_factors = {},
    }
    function register_set2(def)
	    local modname = minetest.get_current_modname()
	    local S = minetest.get_translator(modname)
	    local descriptions = def.descriptions or {}
	    local groups = def.groups or {}
	    local on_equip_callbacks = def.on_equip_callbacks or {}
	    local on_unequip_callbacks = def.on_unequip_callbacks or {}
	    local on_break_callbacks = def.on_break_callbacks or {}
	    local textures = def.textures or {}
	    local previews = def.previews or {}
	    local durabilities = def.durabilities or {}
	    local element_groups = def.element_groups or {}

	    for name, element in pairs(mcl_armor2.elements) do
		    local itemname = element.name .. "_" .. def.name
		    local itemstring = modname .. ":" .. itemname

		    local groups = table.copy(groups)
		    groups["armor_" .. name] = 1
		    groups["combat_armor_" .. name] = 1
		    groups.armor = 1
		    groups.combat_armor = 1
		    groups.mcl_armor_points = def.points[name]
		    groups.mcl_armor_toughness = def.toughness
		    groups.mcl_armor_uses = unbreaking_uses
		    groups.enchantability = def.enchantability

		    for k, v in pairs(element_groups) do
			    groups[k] = v
		    end

		    minetest.register_tool(itemstring, {
			    description = S(def.description .. " " .. (descriptions[name] or element.description)),
			    _doc_items_longdesc = mcl_armor2.longdesc,
			    _doc_items_usagehelp = mcl_armor2.usage,
			    inventory_image = "mcl_armor_inv_" .. itemname .. ".png",
			    --_repair_material = def.repair_material or def.craft_material,
			    groups = groups,
			    sounds = {
				    _mcl_armor_equip = def.sound_equip or "mcl_armor_equip_" .. def.name,
				    _mcl_armor_unequip = def.sound_unequip or "mcl_armor_unequip_" .. def.name,
			    },
			    on_place = mcl_armor.equip_on_use,
			    on_secondary_use = mcl_armor.equip_on_use,
			    _on_equip = on_equip_callbacks[name] or def.on_equip,
			    _on_unequip = on_unequip_callbacks[name] or def.on_unequip,
			    _on_break = on_break_callbacks[name] or def.on_break,
			    _mcl_armor_element = name,
			    _mcl_armor_texture = textures[name] or "mcl_armor" .. "_" .. itemname .. ".png",
			    _mcl_armor_preview = previews[name] or "mcl_armor" .. "_" .. itemname .. "_preview.png",
		    })

		    if def.craft_material then
			    minetest.register_craft({
                    type = "shapeless",
				    output = itemstring,
				    recipe = {
                        "mcl_armor:"..itemname,
                        def.craft_material
                    },
			    })
		    end

		    if def.cook_material then
			    minetest.register_craft({
				    type = "cooking",
				    output = def.cook_material,
				    recipe = itemstring,
				    cooktime = 10,
			    })
		    end
	    end
    end
end

if mt_g then
    --local armor = armor:armor or error("[unbreaking] Failed to obtain API from 3d_armor!")
    -- Wood
    if armor.config.material_wood then
        armor:register_armor(":unbreaking:helmet_wood", {
	        description = S("Unbreakable Wood Helmet"),
	        inventory_image = "3d_armor_inv_helmet_wood.png",
	        groups = {armor_head=1, armor_heal=0, armor_use=unbreaking_uses, flammable=1},
	        armor_groups = {fleshy=5},
	        damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
        })
        armor:register_armor(":unbreaking:chestplate_wood", {
	        description = S("Unbreakable Wood Chestplate"),
	        inventory_image = "3d_armor_inv_chestplate_wood.png",
	        groups = {armor_torso=1, armor_heal=0, armor_use=unbreaking_uses, flammable=1},
	        armor_groups = {fleshy=10},
	        damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
        })
        armor:register_armor(":unbreaking:leggings_wood", {
	        description = S("Unbreakable Wood Leggings"),
	        inventory_image = "3d_armor_inv_leggings_wood.png",
	        groups = {armor_legs=1, armor_heal=0, armor_use=unbreaking_uses, flammable=1},
	        armor_groups = {fleshy=10},
	        damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
        })
        armor:register_armor(":unbreaking:boots_wood", {
	        description = S("Unbreakable Wood Boots"),
	        inventory_image = "3d_armor_inv_boots_wood.png",
	        armor_groups = {fleshy=5},
	        damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
	        groups = {armor_feet=1, armor_heal=0, armor_use=unbreaking_uses, flammable=1},
        })
    end
    -- Cactus
    if armor.config.material_cactus then
        armor:register_armor(":unbreaking:helmet_cactus", {
            description = S("Unbreakable Cactus Helmet"),
            inventory_image = "3d_armor_inv_helmet_cactus.png",
            groups = {armor_head=1, armor_heal=0, armor_use=unbreaking_uses},
            armor_groups = {fleshy=5},
            damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=1},
        })
        armor:register_armor(":unbreaking:chestplate_cactus", {
            description = S("Unbreakable Cactus Chestplate"),
            inventory_image = "3d_armor_inv_chestplate_cactus.png",
            groups = {armor_torso=1, armor_heal=0, armor_use=unbreaking_uses},
            armor_groups = {fleshy=10},
            damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=1},
        })
        armor:register_armor(":unbreakable:leggings_cactus", {
            description = S("Unbreakable Cactus Leggings"),
            inventory_image = "3d_armor_inv_leggings_cactus.png",
            groups = {armor_legs=1, armor_heal=0, armor_use=unbreaking_uses},
            armor_groups = {fleshy=10},
            damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=1},
        })
        armor:register_armor(":unbreakable:boots_cactus", {
            description = S("Unbreakable Cactus Boots"),
            inventory_image = "3d_armor_inv_boots_cactus.png",
            groups = {armor_feet=1, armor_heal=0, armor_use=unbreaking_uses},
            armor_groups = {fleshy=5},
            damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=1},
        })
    end
    -- Steel
    if armor.config.material_steel then
        armor:register_armor(":unbreaking:helmet_steel", {
	        description = S("Unbreakable Steel Helmet"),
	        inventory_image = "3d_armor_inv_helmet_steel.png",
	        groups = {armor_head=1, armor_heal=0, armor_use=unbreaking_uses,
		        physics_speed=-0.01, physics_gravity=0.01},
	        armor_groups = {fleshy=10},
	        damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
        })
        armor:register_armor(":unbreaking:chestplate_steel", {
	        description = S("Unbreakable Steel Chestplate"),
	        inventory_image = "3d_armor_inv_chestplate_steel.png",
	        groups = {armor_torso=1, armor_heal=0, armor_use=unbreaking_uses,
		        physics_speed=-0.04, physics_gravity=0.04},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
        })
        armor:register_armor(":unbreaking:leggings_steel", {
	        description = S("Unbreakable Steel Leggings"),
	        inventory_image = "3d_armor_inv_leggings_steel.png",
	        groups = {armor_legs=1, armor_heal=0, armor_use=unbreaking_uses,
		        physics_speed=-0.03, physics_gravity=0.03},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
        })
        armor:register_armor(":unbreaking:boots_steel", {
	        description = S("Unbreakable Steel Boots"),
	        inventory_image = "3d_armor_inv_boots_steel.png",
	        groups = {armor_feet=1, armor_heal=0, armor_use=unbreaking_uses,
		        physics_speed=-0.01, physics_gravity=0.01},
	        armor_groups = {fleshy=10},
	        damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
        })
    end
    -- Bronze
    if armor.config.material_bronze then
    	armor:register_armor(":unbreaking:helmet_bronze", {
	        description = S("Unbreakable Bronze Helmet"),
	        inventory_image = "3d_armor_inv_helmet_bronze.png",
	        groups = {armor_head=1, armor_heal=6, armor_use=unbreaking_uses,
		        physics_speed=-0.01, physics_gravity=0.01},
	        armor_groups = {fleshy=10},
	        damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
        })
        armor:register_armor(":unbreaking:chestplate_bronze", {
	        description = S("Unbreakable Bronze Chestplate"),
	        inventory_image = "3d_armor_inv_chestplate_bronze.png",
	        groups = {armor_torso=1, armor_heal=6, armor_use=unbreaking_uses,
		        physics_speed=-0.04, physics_gravity=0.04},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
        })
        armor:register_armor(":unbreaking:leggings_bronze", {
	        description = S("Unbreakable Bronze Leggings"),
	        inventory_image = "3d_armor_inv_leggings_bronze.png",
	        groups = {armor_legs=1, armor_heal=6, armor_use=unbreaking_uses,
		        physics_speed=-0.03, physics_gravity=0.03},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
        })
        armor:register_armor(":unbreaking:boots_bronze", {
	        description = S("Unbreakable Bronze Boots"),
	        inventory_image = "3d_armor_inv_boots_bronze.png",
	        groups = {armor_feet=1, armor_heal=6, armor_use=unbreaking_uses,
		        physics_speed=-0.01, physics_gravity=0.01},
	        armor_groups = {fleshy=10},
	        damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
        })
    end
    -- Diamond
    if armor.config.material_diamond then
        armor:register_armor(":unbreaking:helmet_diamond", {
	        description = S("Unbreakable Diamond Helmet"),
	        inventory_image = "3d_armor_inv_helmet_diamond.png",
	        groups = {armor_head=1, armor_heal=12, armor_use=unbreaking_uses},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
        })
        armor:register_armor(":unbreaking:chestplate_diamond", {
	        description = S("Unbreakable Diamond Chestplate"),
	        inventory_image = "3d_armor_inv_chestplate_diamond.png",
	        groups = {armor_torso=1, armor_heal=12, armor_use=unbreaking_uses},
	        armor_groups = {fleshy=20},
	        damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
        })
        armor:register_armor(":unbreaking:leggings_diamond", {
	        description = S("Unbreakable Diamond Leggings"),
	        inventory_image = "3d_armor_inv_leggings_diamond.png",
	        groups = {armor_legs=1, armor_heal=12, armor_use=unbreaking_uses},
	        armor_groups = {fleshy=20},
	        damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
        })
        armor:register_armor(":unbreaking:boots_diamond", {
	        description = S("Unbreakable Diamond Boots"),
	        inventory_image = "3d_armor_inv_boots_diamond.png",
	        groups = {armor_feet=1, armor_heal=12, armor_use=unbreaking_uses},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
        })
    end
    -- Gold
    if armor.config.material_gold then
        armor:register_armor(":unbreaking:helmet_gold", {
	        description = S("Unbreakable Gold Helmet"),
	        inventory_image = "3d_armor_inv_helmet_gold.png",
	        groups = {armor_head=1, armor_heal=6, armor_use=unbreaking_uses,
		        physics_speed=-0.02, physics_gravity=0.02},
	        armor_groups = {fleshy=10},
	        damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
        })
        armor:register_armor(":unbreaking:chestplate_gold", {
	        description = S("Unbreakable Gold Chestplate"),
	        inventory_image = "3d_armor_inv_chestplate_gold.png",
	        groups = {armor_torso=1, armor_heal=6, armor_use=unbreaking_uses,
		        physics_speed=-0.05, physics_gravity=0.05},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
        })
        armor:register_armor(":unbreaking:leggings_gold", {
	        description = S("Unbreakable Gold Leggings"),
	        inventory_image = "3d_armor_inv_leggings_gold.png",
	        groups = {armor_legs=1, armor_heal=6, armor_use=unbreaking_uses,
		        physics_speed=-0.04, physics_gravity=0.04},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
        })
        armor:register_armor(":unbreaking:boots_gold", {
	        description = S("Unbreakable Gold Boots"),
	        inventory_image = "3d_armor_inv_boots_gold.png",
	        groups = {armor_feet=1, armor_heal=6, armor_use=unbreaking_uses,
		        physics_speed=-0.02, physics_gravity=0.02},
	        armor_groups = {fleshy=10},
	        damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
        })
    end
    -- Mithril
    if armor.config.material_mithril then
        armor:register_armor(":unbreaking:helmet_mithril", {
	        description = S("Unbreakable Mithril Helmet"),
	        inventory_image = "3d_armor_inv_helmet_mithril.png",
	        groups = {armor_head=1, armor_heal=12, armor_use=unbreaking_uses},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=2, snappy=1, level=3},
        })
        armor:register_armor(":unbreaking:chestplate_mithril", {
	        description = S("Unbreakable Mithril Chestplate"),
	        inventory_image = "3d_armor_inv_chestplate_mithril.png",
	        groups = {armor_torso=1, armor_heal=12, armor_use=unbreaking_uses},
	        armor_groups = {fleshy=20},
	        damage_groups = {cracky=2, snappy=1, level=3},
        })
        armor:register_armor(":unbreaking:leggings_mithril", {
	        description = S("Unbreakable Mithril Leggings"),
	        inventory_image = "3d_armor_inv_leggings_mithril.png",
	        groups = {armor_legs=1, armor_heal=12, armor_use=unbreaking_uses},
	        armor_groups = {fleshy=20},
	        damage_groups = {cracky=2, snappy=1, level=3},
        })
        armor:register_armor(":unbreaking:boots_mithril", {
	        description = S("Unbreakable Mithril Boots"),
	        inventory_image = "3d_armor_inv_boots_mithril.png",
	        groups = {armor_feet=1, armor_heal=12, armor_use=unbreaking_uses},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=2, snappy=1, level=3},
        })
    end
    -- Crystal
    if armor.config.material_crystal then
        armor:register_armor(":unbreaking:helmet_crystal", {
	        description = S("Unbreakable Crystal Helmet"),
	        inventory_image = "3d_armor_inv_helmet_crystal.png",
	        groups = {armor_head=1, armor_heal=12, armor_use=unbreaking_uses, armor_fire=1},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=2, snappy=1, level=3},
        })
        armor:register_armor(":unbreaking:chestplate_crystal", {
	        description = S("Unbreakable Crystal Chestplate"),
	        inventory_image = "3d_armor_inv_chestplate_crystal.png",
	        groups = {armor_torso=1, armor_heal=12, armor_use=unbreaking_uses, armor_fire=1},
	        armor_groups = {fleshy=20},
	        damage_groups = {cracky=2, snappy=1, level=3},
        })
        armor:register_armor(":unbreaking:leggings_crystal", {
	        description = S("Unbreakable Crystal Leggings"),
	        inventory_image = "3d_armor_inv_leggings_crystal.png",
	        groups = {armor_legs=1, armor_heal=12, armor_use=unbreaking_uses, armor_fire=1},
	        armor_groups = {fleshy=20},
	        damage_groups = {cracky=2, snappy=1, level=3},
        })
        armor:register_armor(":unbreaking:boots_crystal", {
	        description = S("Unbreakable Crystal Boots"),
	        inventory_image = "3d_armor_inv_boots_crystal.png",
	        groups = {armor_feet=1, armor_heal=12, armor_use=unbreaking_uses, physics_speed=1,
			        physics_jump=0.5, armor_fire=1},
	        armor_groups = {fleshy=15},
	        damage_groups = {cracky=2, snappy=1, level=3},
        })
        minetest.log("action", "[unbreaking] 3d_armors Armor is now Unbreakable!")
    end
elseif mcl2 then
    local mcl_armor = rawget(_G, "mcl_armor") or {} --error("[unbreaking] Failed to obtain API from MineClone2!")
    -- This register function also makes the needed crafts so we don't need to do that later on.
    register_set2({
	    name = "leather",
	    description = "Unbreakable Leather",
	    descriptions = {
		    head = "Cap",
		    torso = "Tunic",
		    legs = "Pants",
	    },
	    durability = unbreaking_uses,
	    enchantability = 15,
	    points = {
		    head = 1,
		    torso = 3,
		    legs = 2,
		    feet = 1,
	    },
	    craft_material = "mcl_mobitems:leather",
    })
    register_set2({
	    name = "gold",
	    description = "Unbreakable Golden",
	    durability = unbreaking_uses,
	    enchantability = 25,
	    points = {
		    head = 2,
		    torso = 5,
		    legs = 3,
		    feet = 1,
	    },
	    craft_material = "mcl_core:gold_ingot",
	    cook_material = "mcl_core:gold_nugget",
	    sound_equip = "mcl_armor_equip_iron",
	    sound_unequip = "mcl_armor_unequip_iron",
    })
    register_set2({
	    name = "chain",
	    description = "Unbreakable Chain",
	    durability = unbreaking_uses,
	    enchantability = 12,
	    points = {
		    head = 2,
		    torso = 5,
		    legs = 4,
		    feet = 1,
	    },
	    repair_material = "mcl_core:iron_ingot",
	    cook_material = "mcl_core:iron_nugget",
    })
    register_set2({
	    name = "iron",
	    description = "Unbreakable Iron",
	    durability = unbreaking_uses,
	    enchantability = 9,
	    points = {
		    head = 2,
		    torso = 6,
		    legs = 5,
		    feet = 2,
	    },
	    craft_material = "mcl_core:iron_ingot",
	    cook_material = "mcl_core:iron_nugget",
    })
    register_set2({
	    name = "diamond",
	    description = "Unbreakable Diamond",
	    durability = unbreaking_uses,
	    enchantability = 10,
	    points = {
		    head = 3,
		    torso = 8,
		    legs = 6,
		    feet = 3,
	    },
	    toughness = 2,
	    craft_material = "mcl_core:diamond",
    })
    minetest.register_tool("unbreaking:elytra", {
	    description = S("Unbreakable Elytra"),
	    _doc_items_longdesc = mcl_armor.longdesc,
	    _doc_items_usagehelp = mcl_armor.usage,
	    inventory_image = "mcl_armor_inv_elytra.png",
	    groups = {armor = 1, non_combat_armor = 1, armor_torso = 1, non_combat_torso = 1, mcl_armor_uses = unbreaking_uses},
	    sounds = {
		    _mcl_armor_equip = "mcl_armor_equip_leather",
		    _mcl_armor_unequip = "mcl_armor_unequip_leather",
	    },
	    on_place = mcl_armor.equip_on_use,
	    on_secondary_use = mcl_armor.equip_on_use,
	    _mcl_armor_element = "torso",
	    _mcl_armor_texture = "mcl_armor_elytra.png"
    })
    minetest.log("action", "[unbreaking] MineClone2 Armor is now Unbreakable!")
end

-- Crafts
if mt_g then
    --local armor = rawget(_G, "3d_armor") or {} -- error("[unbreaking] Failed to obtain API from 3d_armor!")
    local materials = {
		wood = "group:wood",
		cactus = "default:cactus",
		steel = "default:steel_ingot",
		bronze = "default:bronze_ingot",
		diamond = "default:diamond",
		gold = "default:gold_ingot",
		mithril = "moreores:mithril_ingot",
		crystal = "ethereal:crystal_ingot",
	}
    for k, v in pairs(materials) do
        -- Ensure we only register crafts we should do (Not everything)
        minetest.register_craft({
            type = "shapeless",
            output = "unbreaking:helmet_"..k,
            recipe = {
                "3d_armor:helmet_"..k,
                v
            }
        })
        minetest.register_craft({
            type = "shapeless",
            output = "unbreaking:chestplate_"..k,
            recipe = {
                "3d_armor:chestplate_"..k,
                v
            }
        })
        minetest.register_craft({
            type = "shapeless",
            output = "unbreaking:leggings_"..k,
            recipe = {
                "3d_armor:leggings_"..k,
                v
            }
        })
        minetest.register_craft({
            type = "shapeless",
            output = "unbreaking:boots_"..k,
            recipe = {
                "3d_armor:boots_"..k,
                v
            }
        })
    end
end
