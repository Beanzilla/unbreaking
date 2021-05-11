-- From
-- games/minetest_game/mods/default/tools.lua

-- support for MT game translation.
local S = minetest.get_translator("unbreaking")

-- Support both Minetest Game and MineClone2
local mt_g = minetest.get_modpath("default") or nil
local mcl2 = minetest.get_modpath("mcl_core") or nil

if not mt_g and not mcl2 then
    error("[unbreaking] Expected either Minetest Game or MineClone2 got neither!")
end

if mcl2 then
    pickaxe_longdesc = S("Pickaxes are mining tools to mine hard blocks, such as stone. A pickaxe can also be used as weapon, but it is rather inefficient.")
    axe_longdesc = S("An axe is your tool of choice to cut down trees, wood-based blocks and other blocks. Axes deal a lot of damage as well, but they are rather slow.")
    sword_longdesc = S("Swords are great in melee combat, as they are fast, deal high damage and can endure countless battles. Swords can also be used to cut down a few particular blocks, such as cobwebs.")
    shovel_longdesc = S("Shovels are tools for digging coarse blocks, such as dirt, sand and gravel. They can also be used to turn grass blocks to grass paths. Shovels can be used as weapons, but they are very weak.")
    shovel_use = S("To turn a grass block into a grass path, hold the shovel in your hand, then use (rightclick) the top or side of a grass block. This only works when there's air above the grass block.")
    shears_longdesc = S("Shears are tools to shear sheep and to mine a few block types. Shears are a special mining tool and can be used to obtain the original item from grass, leaves and similar blocks that require cutting.")
    shears_use = S("To shear sheep or carve faceless pumpkins, use the “place” key on them. Faces can only be carved at the side of faceless pumpkins. Mining works as usual, but the drops are different for a few blocks.")
    hoe_tt = S("Turns block into farmland")
    hoe_longdesc = S("Hoes are essential tools for growing crops. They are used to create farmland in order to plant seeds on it. Hoes can also be used as very weak weapons in a pinch.")
    hoe_usagehelp = S("Use the hoe on a cultivatable block (by rightclicking it) to turn it into farmland. Dirt, grass blocks and grass paths are cultivatable blocks. Using a hoe on coarse dirt turns it into dirt.")
    wield_scale = { x = 1.8, y = 1.8, z = 1 }
    minetest.log("action", "[unbreaking] Loaded MineClone2 assets.")
end

--
-- Picks
--
if unbreaking_pick then
	if mt_g then
	    minetest.register_tool("unbreaking:pick_wood", {
		    description = S("Unbreakable Wooden Pickaxe"),
		    inventory_image = "default_tool_woodpick.png",
		    tool_capabilities = {
			    full_punch_interval = 1.2,
			    max_drop_level=0,
			    groupcaps={
				    cracky = {times={[3]=1.60}, uses=0, maxlevel=1},
			    },
			    damage_groups = {fleshy=2},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {pickaxe = 1, flammable = 2}
	    })

	    minetest.register_tool("unbreaking:pick_stone", {
		    description = S("Unbreakable Stone Pickaxe"),
		    inventory_image = "default_tool_stonepick.png",
		    tool_capabilities = {
			    full_punch_interval = 1.3,
			    max_drop_level=0,
			    groupcaps={
				    cracky = {times={[2]=2.0, [3]=1.00}, uses=0, maxlevel=1},
			    },
			    damage_groups = {fleshy=3},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {pickaxe = 1}
	    })

	    minetest.register_tool("unbreaking:pick_bronze", {
		    description = S("Unbreakable Bronze Pickaxe"),
		    inventory_image = "default_tool_bronzepick.png",
		    tool_capabilities = {
			    full_punch_interval = 1.0,
			    max_drop_level=1,
			    groupcaps={
				    cracky = {times={[1]=4.50, [2]=1.80, [3]=0.90}, uses=0, maxlevel=2},
			    },
			    damage_groups = {fleshy=4},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {pickaxe = 1}
	    })

	    minetest.register_tool("unbreaking:pick_steel", {
		    description = S("Unbreakable Steel Pickaxe"),
		    inventory_image = "default_tool_steelpick.png",
		    tool_capabilities = {
			    full_punch_interval = 1.0,
			    max_drop_level=1,
			    groupcaps={
				    cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=0, maxlevel=2},
			    },
			    damage_groups = {fleshy=4},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {pickaxe = 1}
	    })

	    minetest.register_tool("unbreaking:pick_mese", {
		    description = S("Unbreakable Mese Pickaxe"),
		    inventory_image = "default_tool_mesepick.png",
		    tool_capabilities = {
			    full_punch_interval = 0.9,
			    max_drop_level=3,
			    groupcaps={
				    cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=0, maxlevel=3},
			    },
			    damage_groups = {fleshy=5},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {pickaxe = 1}
	    })

	    minetest.register_tool("unbreaking:pick_diamond", {
		    description = S("Unbreakable Diamond Pickaxe"),
		    inventory_image = "default_tool_diamondpick.png",
		    tool_capabilities = {
			    full_punch_interval = 0.9,
			    max_drop_level=3,
			    groupcaps={
				    cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=0, maxlevel=3},
			    },
			    damage_groups = {fleshy=5},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {pickaxe = 1}
	    })
        minetest.log("action", "[unbreaking] Default Pickaxes now Unbreakable!")
    elseif mcl2 then
        minetest.register_tool("unbreaking:pick_wood", {
	        description = S("Unbreakable Wooden Pickaxe"),
	        _doc_items_longdesc = pickaxe_longdesc,
	        _doc_items_hidden = false,
	        inventory_image = "default_tool_woodpick.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, pickaxe=1, dig_speed_class=2, enchantability=15 },
	        tool_capabilities = {
		        -- 1/1.2
		        full_punch_interval = 0.83333333,
		        max_drop_level=1,
		        damage_groups = {fleshy=2},
		        punch_attack_uses = 0,
	        },
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "group:wood",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        pickaxey = { speed = 2, level = 1, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:pick_stone", {
	        description = S("Unbreakable Stone Pickaxe"),
	        _doc_items_longdesc = pickaxe_longdesc,
	        inventory_image = "default_tool_stonepick.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, pickaxe=1, dig_speed_class=3, enchantability=5 },
	        tool_capabilities = {
		        -- 1/1.2
		        full_punch_interval = 0.83333333,
		        max_drop_level=3,
		        damage_groups = {fleshy=3},
		        punch_attack_uses = 0,
	        },
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:cobble",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        pickaxey = { speed = 4, level = 3, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:pick_iron", {
	        description = S("Unbreakable Iron Pickaxe"),
	        _doc_items_longdesc = pickaxe_longdesc,
	        inventory_image = "default_tool_steelpick.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, pickaxe=1, dig_speed_class=4, enchantability=14 },
	        tool_capabilities = {
		        -- 1/1.2
		        full_punch_interval = 0.83333333,
		        max_drop_level=4,
		        damage_groups = {fleshy=4},
		        punch_attack_uses = 0,
	        },
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:iron_ingot",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        pickaxey = { speed = 6, level = 4, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:pick_gold", {
	        description = S("Unbreakable Golden Pickaxe"),
	        _doc_items_longdesc = pickaxe_longdesc,
	        inventory_image = "default_tool_goldpick.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, pickaxe=1, dig_speed_class=6, enchantability=22 },
	        tool_capabilities = {
		        -- 1/1.2
		        full_punch_interval = 0.83333333,
		        max_drop_level=2,
		        damage_groups = {fleshy=2},
		        punch_attack_uses = 0,
	        },
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:gold_ingot",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        pickaxey = { speed = 12, level = 2, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:pick_diamond", {
	        description = S("Unbreakable Diamond Pickaxe"),
	        _doc_items_longdesc = pickaxe_longdesc,
	        inventory_image = "default_tool_diamondpick.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, pickaxe=1, dig_speed_class=5, enchantability=10 },
	        tool_capabilities = {
		        -- 1/1.2
		        full_punch_interval = 0.83333333,
		        max_drop_level=5,
		        damage_groups = {fleshy=5},
		        punch_attack_uses = 0,
	        },
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:diamond",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        pickaxey = { speed = 8, level = 5, uses = 0 }
	        },
        })
        minetest.log("action", "[unbreaking] MineClone2 Pickaxes now Unbreakable!")
    end    
end

--
-- Shovels
--
if unbreaking_shovel and mcl2 then
    make_grass_path = function(itemstack, placer, pointed_thing)
	    -- Use pointed node's on_rightclick function first, if present
	    local node = minetest.get_node(pointed_thing.under)
	    if placer and not placer:get_player_control().sneak then
		    if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
			    return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer, itemstack) or itemstack
		    end
	    end

	    -- Only make grass path if tool used on side or top of target node
	    if pointed_thing.above.y < pointed_thing.under.y then
		    return itemstack
	    end

	    if (minetest.get_item_group(node.name, "grass_block") == 1) then
		    local above = table.copy(pointed_thing.under)
		    above.y = above.y + 1
		    if minetest.get_node(above).name == "air" then
			    if minetest.is_protected(pointed_thing.under, placer:get_player_name()) then
				    minetest.record_protection_violation(pointed_thing.under, placer:get_player_name())
				    return itemstack
			    end

			    if not minetest.is_creative_enabled(placer:get_player_name()) then
				    -- Add wear (as if digging a shovely node)
				    local toolname = itemstack:get_name()
				    local wear = mcl_autogroup.get_wear(toolname, "shovely")
				    itemstack:add_wear(wear)
			    end
			    minetest.sound_play({name="default_grass_footstep", gain=1}, {pos = above}, true)
			    minetest.swap_node(pointed_thing.under, {name="mcl_core:grass_path"})
		    end
	    end
	    return itemstack
    end
end

if unbreaking_shovel then
    if mt_g then
	    minetest.register_tool("unbreaking:shovel_wood", {
		    description = S("Unbreakable Wooden Shovel"),
		    inventory_image = "default_tool_woodshovel.png",
		    wield_image = "default_tool_woodshovel.png^[transformR90",
		    tool_capabilities = {
			    full_punch_interval = 1.2,
			    max_drop_level=0,
			    groupcaps={
				    crumbly = {times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=0, maxlevel=1},
			    },
			    damage_groups = {fleshy=2},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {shovel = 1, flammable = 2}
	    })

	    minetest.register_tool("unbreaking:shovel_stone", {
		    description = S("Unbreakable Stone Shovel"),
		    inventory_image = "default_tool_stoneshovel.png",
		    wield_image = "default_tool_stoneshovel.png^[transformR90",
		    tool_capabilities = {
			    full_punch_interval = 1.4,
			    max_drop_level=0,
			    groupcaps={
				    crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=0, maxlevel=1},
			    },
			    damage_groups = {fleshy=2},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {shovel = 1}
	    })

	    minetest.register_tool("unbreaking:shovel_bronze", {
		    description = S("Unbreakable Bronze Shovel"),
		    inventory_image = "default_tool_bronzeshovel.png",
		    wield_image = "default_tool_bronzeshovel.png^[transformR90",
		    tool_capabilities = {
			    full_punch_interval = 1.1,
			    max_drop_level=1,
			    groupcaps={
				    crumbly = {times={[1]=1.65, [2]=1.05, [3]=0.45}, uses=0, maxlevel=2},
			    },
			    damage_groups = {fleshy=3},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {shovel = 1}
	    })

	    minetest.register_tool("unbreaking:shovel_steel", {
		    description = S("Unbreakable Steel Shovel"),
		    inventory_image = "default_tool_steelshovel.png",
		    wield_image = "default_tool_steelshovel.png^[transformR90",
		    tool_capabilities = {
			    full_punch_interval = 1.1,
			    max_drop_level=1,
			    groupcaps={
				    crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=0, maxlevel=2},
			    },
			    damage_groups = {fleshy=3},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {shovel = 1}
	    })

	    minetest.register_tool("unbreaking:shovel_mese", {
		    description = S("Unbreakable Mese Shovel"),
		    inventory_image = "default_tool_meseshovel.png",
		    wield_image = "default_tool_meseshovel.png^[transformR90",
		    tool_capabilities = {
			    full_punch_interval = 1.0,
			    max_drop_level=3,
			    groupcaps={
				    crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=0, maxlevel=3},
			    },
			    damage_groups = {fleshy=4},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {shovel = 1}
	    })

	    minetest.register_tool("unbreaking:shovel_diamond", {
		    description = S("Unbreakable Diamond Shovel"),
		    inventory_image = "default_tool_diamondshovel.png",
		    wield_image = "default_tool_diamondshovel.png^[transformR90",
		    tool_capabilities = {
			    full_punch_interval = 1.0,
			    max_drop_level=1,
			    groupcaps={
				    crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=0, maxlevel=3},
			    },
			    damage_groups = {fleshy=4},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {shovel = 1}
	    })
        minetest.log("action", "[unbreaking] Default Shovels now Unbreakable!")
    elseif mcl2 then
        minetest.register_tool("unbreaking:shovel_wood", {
	        description = S("Unbreakable Wooden Shovel"),
	        _doc_items_longdesc = shovel_longdesc,
	        _doc_items_usagehelp = shovel_use,
	        _doc_items_hidden = false,
	        inventory_image = "default_tool_woodshovel.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, shovel=1, dig_speed_class=2, enchantability=15 },
	        tool_capabilities = {
		        full_punch_interval = 1,
		        max_drop_level=1,
		        damage_groups = {fleshy=2},
		        punch_attack_uses = 0,
	        },
	        on_place = make_grass_path,
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "group:wood",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        shovely = { speed = 2, level = 1, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:shovel_stone", {
	        description = S("Unbreakable Stone Shovel"),
	        _doc_items_longdesc = shovel_longdesc,
	        _doc_items_usagehelp = shovel_use,
	        inventory_image = "default_tool_stoneshovel.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, shovel=1, dig_speed_class=3, enchantability=5 },
	        tool_capabilities = {
		        full_punch_interval = 1,
		        max_drop_level=3,
		        damage_groups = {fleshy=3},
		        punch_attack_uses = 0,
	        },
	        on_place = make_grass_path,
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:cobble",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        shovely = { speed = 4, level = 3, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:shovel_iron", {
	        description = S("Unbreakable Iron Shovel"),
	        _doc_items_longdesc = shovel_longdesc,
	        _doc_items_usagehelp = shovel_use,
	        inventory_image = "default_tool_steelshovel.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, shovel=1, dig_speed_class=4, enchantability=14 },
	        tool_capabilities = {
		        full_punch_interval = 1,
		        max_drop_level=4,
		        damage_groups = {fleshy=4},
		        punch_attack_uses = 0,
	        },
	        on_place = make_grass_path,
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:iron_ingot",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        shovely = { speed = 6, level = 4, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:shovel_gold", {
	        description = S("Unbreakable Golden Shovel"),
	        _doc_items_longdesc = shovel_longdesc,
	        _doc_items_usagehelp = shovel_use,
	        inventory_image = "default_tool_goldshovel.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, shovel=1, dig_speed_class=6, enchantability=22 },
	        tool_capabilities = {
		        full_punch_interval = 1,
		        max_drop_level=2,
		        damage_groups = {fleshy=2},
		        punch_attack_uses = 0,
	        },
	        on_place = make_grass_path,
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:gold_ingot",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        shovely = { speed = 12, level = 2, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:shovel_diamond", {
	        description = S("Unbreakable Diamond Shovel"),
	        _doc_items_longdesc = shovel_longdesc,
	        _doc_items_usagehelp = shovel_use,
	        inventory_image = "default_tool_diamondshovel.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, shovel=1, dig_speed_class=5, enchantability=10 },
	        tool_capabilities = {
		        full_punch_interval = 1,
		        max_drop_level=5,
		        damage_groups = {fleshy=5},
		        punch_attack_uses = 0,
	        },
	        on_place = make_grass_path,
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:diamond",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        shovely = { speed = 8, level = 5, uses = 0 }
	        },
        })
        minetest.log("action", "[unbreaking] MineClone2 Shovels now Unbreakable!")
    end
end

--
-- Axes
--
if unbreaking_axe and mcl2 then
    make_stripped_trunk = function(itemstack, placer, pointed_thing)
        if pointed_thing.type ~= "node" then return end

        local node = minetest.get_node(pointed_thing.under)
        local noddef = minetest.registered_nodes[minetest.get_node(pointed_thing.under).name]

        if not placer:get_player_control().sneak and noddef.on_rightclick then
            return minetest.item_place(itemstack, placer, pointed_thing)
        end
        if minetest.is_protected(pointed_thing.under, placer:get_player_name()) then
            minetest.record_protection_violation(pointed_thing.under, placer:get_player_name())
            return itemstack
        end

        if noddef._mcl_stripped_varient == nil then
		    return itemstack
	    else
		    minetest.swap_node(pointed_thing.under, {name=noddef._mcl_stripped_varient, param2=node.param2})
		    if not minetest.is_creative_enabled(placer:get_player_name()) then
			    -- Add wear (as if digging a axey node)
			    local toolname = itemstack:get_name()
			    local wear = mcl_autogroup.get_wear(toolname, "axey")
			    itemstack:add_wear(wear)
		    end
	    end
        return itemstack
    end
    minetest.log("action", "[unbreaking] MineClone2 Axe Utility function was loaded!")
end

if unbreaking_axe then
    if mt_g then
	    minetest.register_tool("unbreaking:axe_wood", {
		    description = S("Unbreakable Wooden Axe"),
		    inventory_image = "default_tool_woodaxe.png",
		    tool_capabilities = {
			    full_punch_interval = 1.0,
			    max_drop_level=0,
			    groupcaps={
				    choppy = {times={[2]=3.00, [3]=1.60}, uses=0, maxlevel=1},
			    },
			    damage_groups = {fleshy=2},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {axe = 1, flammable = 2}
	    })

	    minetest.register_tool("unbreaking:axe_stone", {
		    description = S("Unbreakable Stone Axe"),
		    inventory_image = "default_tool_stoneaxe.png",
		    tool_capabilities = {
			    full_punch_interval = 1.2,
			    max_drop_level=0,
			    groupcaps={
				    choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=0, maxlevel=1},
			    },
			    damage_groups = {fleshy=3},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {axe = 1}
	    })

	    minetest.register_tool("unbreaking:axe_bronze", {
		    description = S("Unbreakable Bronze Axe"),
		    inventory_image = "default_tool_bronzeaxe.png",
		    tool_capabilities = {
			    full_punch_interval = 1.0,
			    max_drop_level=1,
			    groupcaps={
				    choppy={times={[1]=2.75, [2]=1.70, [3]=1.15}, uses=0, maxlevel=2},
			    },
			    damage_groups = {fleshy=4},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {axe = 1}
	    })

	    minetest.register_tool("unbreaking:axe_steel", {
		    description = S("Unbreakable Steel Axe"),
		    inventory_image = "default_tool_steelaxe.png",
		    tool_capabilities = {
			    full_punch_interval = 1.0,
			    max_drop_level=1,
			    groupcaps={
				    choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=0, maxlevel=2},
			    },
			    damage_groups = {fleshy=4},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {axe = 1}
	    })

	    minetest.register_tool("unbreaking:axe_mese", {
		    description = S("Unbreakable Mese Axe"),
		    inventory_image = "default_tool_meseaxe.png",
		    tool_capabilities = {
			    full_punch_interval = 0.9,
			    max_drop_level=1,
			    groupcaps={
				    choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=0, maxlevel=3},
			    },
			    damage_groups = {fleshy=6},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {axe = 1}
	    })

	    minetest.register_tool("unbreaking:axe_diamond", {
		    description = S("Unbreakable Diamond Axe"),
		    inventory_image = "default_tool_diamondaxe.png",
		    tool_capabilities = {
			    full_punch_interval = 0.9,
			    max_drop_level=1,
			    groupcaps={
				    choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=0, maxlevel=3},
			    },
			    damage_groups = {fleshy=7},
		    },
		    sound = {breaks = "default_tool_breaks"},
		    groups = {axe = 1}
	    })
        minetest.log("action", "[unbreaking] Default Axes are now Unbreakable!")
    elseif mcl2 then
        minetest.register_tool("unbreaking:axe_wood", {
	        description = S("Unbreakable Wooden Axe"),
	        _doc_items_longdesc = axe_longdesc,
	        _doc_items_hidden = false,
	        inventory_image = "default_tool_woodaxe.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, axe=1, dig_speed_class=2, enchantability=15 },
	        tool_capabilities = {
		        full_punch_interval = 1.25,
		        max_drop_level=1,
		        damage_groups = {fleshy=7},
		        punch_attack_uses = 0,
	        },
	        on_place = make_stripped_trunk,
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "group:wood",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        axey = { speed = 2, level = 1, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:axe_stone", {
	        description = S("Unbreakable Stone Axe"),
	        _doc_items_longdesc = axe_longdesc,
	        inventory_image = "default_tool_stoneaxe.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, axe=1, dig_speed_class=3, enchantability=5 },
	        tool_capabilities = {
		        full_punch_interval = 1.25,
		        max_drop_level=3,
		        damage_groups = {fleshy=9},
		        punch_attack_uses = 0,
	        },
	        on_place = make_stripped_trunk,
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:cobble",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        axey = { speed = 4, level = 3, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:axe_iron", {
	        description = S("Unbreakable Iron Axe"),
	        _doc_items_longdesc = axe_longdesc,
	        inventory_image = "default_tool_steelaxe.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, axe=1, dig_speed_class=4, enchantability=14 },
	        tool_capabilities = {
		        -- 1/0.9
		        full_punch_interval = 1.11111111,
		        max_drop_level=4,
		        damage_groups = {fleshy=9},
		        punch_attack_uses = 0,
	        },
	        on_place = make_stripped_trunk,
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:iron_ingot",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        axey = { speed = 6, level = 4, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:axe_gold", {
	        description = S("Unbreakable Golden Axe"),
	        _doc_items_longdesc = axe_longdesc,
	        inventory_image = "default_tool_goldaxe.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, axe=1, dig_speed_class=6, enchantability=22 },
	        tool_capabilities = {
		        full_punch_interval = 1.0,
		        max_drop_level=2,
		        damage_groups = {fleshy=7},
		        punch_attack_uses = 0,
	        },
	        on_place = make_stripped_trunk,
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:gold_ingot",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        axey = { speed = 12, level = 2, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:axe_diamond", {
	        description = S("Unbreakable Diamond Axe"),
	        _doc_items_longdesc = axe_longdesc,
	        inventory_image = "default_tool_diamondaxe.png",
	        wield_scale = wield_scale,
	        groups = { tool=1, axe=1, dig_speed_class=5, enchantability=10 },
	        tool_capabilities = {
		        full_punch_interval = 1.0,
		        max_drop_level=5,
		        damage_groups = {fleshy=9},
		        punch_attack_uses = 0,
	        },
	        on_place = make_stripped_trunk,
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:diamond",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        axey = { speed = 8, level = 5, uses = 0 }
	        },
        })
        minetest.log("action", "[unbreaking] MineClone2 Axes now Unbreakable!")
    end
end

--
-- Swords?
--
if unbreaking_sword then
    if mt_g then
        minetest.register_tool("unbreaking:sword_wood", {
            description = S("Unbreakable Wooden Sword"),
            inventory_image = "default_tool_woodsword.png",
            tool_capabilities = {
                full_punch_interval = 1,
                max_drop_level=0,
                groupcaps={
                    snappy={times={[2]=1.6, [3]=0.40}, uses=0, maxlevel=1},
                },
                damage_groups = {fleshy=2},
            },
            sound = {breaks = "default_tool_breaks"},
            groups = {sword = 1, flammable = 2}
        })

        minetest.register_tool("unbreaking:sword_stone", {
            description = S("Unbreakable Stone Sword"),
            inventory_image = "default_tool_stonesword.png",
            tool_capabilities = {
                full_punch_interval = 1.2,
                max_drop_level=0,
                groupcaps={
                    snappy={times={[2]=1.4, [3]=0.40}, uses=0, maxlevel=1},
                },
                damage_groups = {fleshy=4},
            },
            sound = {breaks = "default_tool_breaks"},
            groups = {sword = 1}
        })

        minetest.register_tool("unbreaking:sword_bronze", {
            description = S("Unbreakable Bronze Sword"),
            inventory_image = "default_tool_bronzesword.png",
            tool_capabilities = {
                full_punch_interval = 0.8,
                max_drop_level=1,
                groupcaps={
                    snappy={times={[1]=2.75, [2]=1.30, [3]=0.375}, uses=0, maxlevel=2},
                },
                damage_groups = {fleshy=6},
            },
            sound = {breaks = "default_tool_breaks"},
            groups = {sword = 1}
        })

        minetest.register_tool("unbreaking:sword_steel", {
            description = S("Unbreakable Steel Sword"),
            inventory_image = "default_tool_steelsword.png",
            tool_capabilities = {
                full_punch_interval = 0.8,
                max_drop_level=1,
                groupcaps={
                    snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=0, maxlevel=2},
                },
                damage_groups = {fleshy=6},
            },
            sound = {breaks = "default_tool_breaks"},
            groups = {sword = 1}
        })

        minetest.register_tool("unbreaking:sword_mese", {
            description = S("Unbreakable Mese Sword"),
            inventory_image = "default_tool_mesesword.png",
            tool_capabilities = {
                full_punch_interval = 0.7,
                max_drop_level=1,
                groupcaps={
                    snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=0, maxlevel=3},
                },
                damage_groups = {fleshy=7},
            },
            sound = {breaks = "default_tool_breaks"},
            groups = {sword = 1}
        })

        minetest.register_tool("unbreaking:sword_diamond", {
            description = S("Unbreakable Diamond Sword"),
            inventory_image = "default_tool_diamondsword.png",
            tool_capabilities = {
                full_punch_interval = 0.7,
                max_drop_level=1,
                groupcaps={
                    snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=0, maxlevel=3},
                },
                damage_groups = {fleshy=8},
            },
            sound = {breaks = "default_tool_breaks"},
            groups = {sword = 1}
        })
        minetest.log("action", "[unbreaking] Default Swords now Unbreakable!")
    elseif mcl2 then
        minetest.register_tool("unbreaking:sword_wood", {
	        description = S("Unbreakable Wooden Sword"),
	        _doc_items_longdesc = sword_longdesc,
	        _doc_items_hidden = false,
	        inventory_image = "default_tool_woodsword.png",
	        wield_scale = wield_scale,
	        groups = { weapon=1, sword=1, dig_speed_class=2, enchantability=15 },
	        tool_capabilities = {
		        full_punch_interval = 0.625,
		        max_drop_level=1,
		        damage_groups = {fleshy=4},
		        punch_attack_uses = 0,
	        },
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "group:wood",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        swordy = { speed = 2, level = 1, uses = 0 },
		        swordy_cobweb = { speed = 2, level = 1, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:sword_stone", {
	        description = S("Unbreakable Stone Sword"),
	        _doc_items_longdesc = sword_longdesc,
	        inventory_image = "default_tool_stonesword.png",
	        wield_scale = wield_scale,
	        groups = { weapon=1, sword=1, dig_speed_class=3, enchantability=5 },
	        tool_capabilities = {
		        full_punch_interval = 0.625,
		        max_drop_level=3,
		        damage_groups = {fleshy=5},
		        punch_attack_uses = 0,
	        },
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:cobble",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        swordy = { speed = 4, level = 3, uses = 0 },
		        swordy_cobweb = { speed = 4, level = 3, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:sword_iron", {
	        description = S("Unbreakable Iron Sword"),
	        _doc_items_longdesc = sword_longdesc,
	        inventory_image = "default_tool_steelsword.png",
	        wield_scale = wield_scale,
	        groups = { weapon=1, sword=1, dig_speed_class=4, enchantability=14 },
	        tool_capabilities = {
		        full_punch_interval = 0.625,
		        max_drop_level=4,
		        damage_groups = {fleshy=6},
		        punch_attack_uses = 0,
	        },
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:iron_ingot",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        swordy = { speed = 6, level = 4, uses = 0 },
		        swordy_cobweb = { speed = 6, level = 4, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:sword_gold", {
	        description = S("Unbreakable Golden Sword"),
	        _doc_items_longdesc = sword_longdesc,
	        inventory_image = "default_tool_goldsword.png",
	        wield_scale = wield_scale,
	        groups = { weapon=1, sword=1, dig_speed_class=6, enchantability=22 },
	        tool_capabilities = {
		        full_punch_interval = 0.625,
		        max_drop_level=2,
		        damage_groups = {fleshy=4},
		        punch_attack_uses = 0,
	        },
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:gold_ingot",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        swordy = { speed = 12, level = 2, uses = 0 },
		        swordy_cobweb = { speed = 12, level = 2, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:sword_diamond", {
	        description = S("Unbreakable Diamond Sword"),
	        _doc_items_longdesc = sword_longdesc,
	        inventory_image = "default_tool_diamondsword.png",
	        wield_scale = wield_scale,
	        groups = { weapon=1, sword=1, dig_speed_class=5, enchantability=10 },
	        tool_capabilities = {
		        full_punch_interval = 0.625,
		        max_drop_level=5,
		        damage_groups = {fleshy=7},
		        punch_attack_uses = 0,
	        },
	        sound = { breaks = "default_tool_breaks" },
	        --_repair_material = "mcl_core:diamond",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        swordy = { speed = 8, level = 5, uses = 0 },
		        swordy_cobweb = { speed = 8, level = 5, uses = 0 }
	        },
        })
        minetest.log("action", "[unbreaking] MineClone2 Swords now Unbreakable!")
    end
end

--
-- Hoes
if unbreaking_hoe and mcl2 then
    create_soil = function(pos, inv)
        if pos == nil then
	        return false
        end
        local node = minetest.get_node(pos)
        local name = node.name
        local above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
        if minetest.get_item_group(name, "cultivatable") == 2 then
	        if above.name == "air" then
		        node.name = "mcl_farming:soil"
		        minetest.set_node(pos, node)
		        minetest.sound_play("default_dig_crumbly", { pos = pos, gain = 0.5 }, true)
		        return true
	        end
        elseif minetest.get_item_group(name, "cultivatable") == 1 then
	        if above.name == "air" then
		        node.name = "mcl_core:dirt"
		        minetest.set_node(pos, node)
		        minetest.sound_play("default_dig_crumbly", { pos = pos, gain = 0.6 }, true)
		        return true
	        end
        end
        return false
        end
    hoe_on_place_function2 = function(wear_divisor)
	    return function(itemstack, user, pointed_thing)
		    -- Call on_rightclick if the pointed node defines it
		    local node = minetest.get_node(pointed_thing.under)
		    if user and not user:get_player_control().sneak then
			    if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
				    return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, user, itemstack) or itemstack
			    end
		    end

		    if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
			    minetest.record_protection_violation(pointed_thing.under, user:get_player_name())
			    return itemstack
		    end

		    if create_soil(pointed_thing.under, user:get_inventory()) then
			    if not minetest.is_creative_enabled(user:get_player_name()) then
				    --itemstack:add_wear(65535/wear_divisor)
			    end
			    return itemstack
		    end
	    end
    end
end
-- From games/minetest_game/mods/farming/hoes.lua
if unbreaking_hoe then
    if mt_g then
        farming = rawget(_G, "farming") or error("[unbreaking] Failed to access API of farming mod!")

	    farming.register_hoe(":unbreaking:hoe_wood", {
		    description = S("Unbreakable Wooden Hoe"),
		    inventory_image = "farming_tool_woodhoe.png",
		    max_uses = 0,
		    material = "group:wood",
		    groups = {hoe = 1, flammable = 2},
	    })

	    farming.register_hoe(":unbreaking:hoe_stone", {
		    description = S("Unbreakable Stone Hoe"),
		    inventory_image = "farming_tool_stonehoe.png",
		    max_uses = 0,
		    material = "group:stone",
		    groups = {hoe = 1}
	    })

	    farming.register_hoe(":unbreaking:hoe_steel", {
		    description = S("Unbreakable Steel Hoe"),
		    inventory_image = "farming_tool_steelhoe.png",
		    max_uses = 0,
		    material = "default:steel_ingot",
		    groups = {hoe = 1}
	    })
        minetest.log("action", "[unbreaking] Default Hoes now Unbreakable!")
    elseif mcl2 then
        minetest.register_tool("unbreaking:hoe_wood", {
	        description = S("Unbreakable Wood Hoe"),
	        _tt_help = hoe_tt.."\n"..S("Uses: Infinite"),
	        _doc_items_longdesc = hoe_longdesc,
	        _doc_items_usagehelp = hoe_usagehelp,
	        _doc_items_hidden = false,
	        inventory_image = "farming_tool_woodhoe.png",
	        wield_scale = wield_scale,
	        on_place = hoe_on_place_function2(0),
	        groups = { tool=1, hoe=1, enchantability=15 },
	        tool_capabilities = {
		        full_punch_interval = 1,
		        damage_groups = { fleshy = 1, },
		        punch_attack_uses = 0,
	        },
	        --_repair_material = "group:wood",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        hoey = { speed = 2, level = 1, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:hoe_stone", {
	        description = S("Unbreakable Stone Hoe"),
	        _tt_help = hoe_tt.."\n"..S("Uses: Infinite"),
	        _doc_items_longdesc = hoe_longdesc,
	        _doc_items_usagehelp = hoe_usagehelp,
	        inventory_image = "farming_tool_stonehoe.png",
	        wield_scale = wield_scale,
	        on_place = hoe_on_place_function2(0),
	        groups = { tool=1, hoe=1, enchantability=5 },
	        tool_capabilities = {
		        full_punch_interval = 0.5,
		        damage_groups = { fleshy = 1, },
		        punch_attack_uses = 0,
	        },
	        _repair_material = "mcl_core:cobble",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        hoey = { speed = 4, level = 3, uses = 0 }
	        },
        })
        minetest.register_tool("unbreaking:hoe_iron", {
	        description = S("Unbreakable Iron Hoe"),
	        _tt_help = hoe_tt.."\n"..S("Uses: Infinite"),
	        _doc_items_longdesc = hoe_longdesc,
	        _doc_items_usagehelp = hoe_usagehelp,
	        inventory_image = "farming_tool_steelhoe.png",
	        wield_scale = wield_scale,
	        on_place = hoe_on_place_function2(0),
	        groups = { tool=1, hoe=1, enchantability=14 },
	        tool_capabilities = {
		        -- 1/3
		        full_punch_interval = 0.33333333,
		        damage_groups = { fleshy = 1, },
		        punch_attack_uses = 0,
	        },
	        _repair_material = "mcl_core:iron_ingot",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        hoey = { speed = 6, level = 4, uses = 0 }
	        },
        })
        minetest.register_craft({
	        type = "cooking",
	        output = "mcl_core:iron_nugget",
	        recipe = "unbreaking:hoe_iron",
	        cooktime = 10,
        })
        minetest.register_tool("unbreaking:hoe_gold", {
	        description = S("Unbreakable Golden Hoe"),
	        _tt_help = hoe_tt.."\n"..S("Uses: Infinite"),
	        _doc_items_longdesc = hoe_longdesc,
	        _doc_items_usagehelp = hoe_usagehelp,
	        inventory_image = "farming_tool_goldhoe.png",
	        wield_scale = wield_scale,
	        on_place = hoe_on_place_function2(0),
	        groups = { tool=1, hoe=1, enchantability=22 },
	        tool_capabilities = {
		        full_punch_interval = 1,
		        damage_groups = { fleshy = 1, },
		        punch_attack_uses = 0,
	        },
	        _repair_material = "mcl_core:gold_ingot",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        hoey = { speed = 12, level = 2, uses = 0 }
	        },
        })
        minetest.register_craft({
	        type = "cooking",
	        output = "mcl_core:gold_nugget",
	        recipe = "unbreaking:hoe_gold",
	        cooktime = 10,
        })
        minetest.register_tool("unbreaking:hoe_diamond", {
	        description = S("Unbreakable Diamond Hoe"),
	        _tt_help = hoe_tt.."\n"..S("Uses: Infinite"),
	        _doc_items_longdesc = hoe_longdesc,
	        _doc_items_usagehelp = hoe_usagehelp,
	        inventory_image = "farming_tool_diamondhoe.png",
	        wield_scale = wield_scale,
	        on_place = hoe_on_place_function2(0),
	        groups = { tool=1, hoe=1, enchantability=10 },
	        tool_capabilities = {
		        full_punch_interval = 0.25,
		        damage_groups = { fleshy = 1, },
		        punch_attack_uses = 0,
	        },
	        _repair_material = "mcl_core:diamond",
	        _mcl_toollike_wield = true,
	        _mcl_diggroups = {
		        hoey = { speed = 8, level = 5, uses = 0 }
	        },
        })
        minetest.log("action", "[unbreaking] MineClone2 Hoes now Unbreakable!")
    end
end

if unbreaking_shears and mcl2 then
    -- We will assume mcl_farming is a part of MineClone2 (It better be!)
    local carve_pumpkin = function(itemstack, placer, pointed_thing)
		-- Use pointed node's on_rightclick function first, if present
		local node = minetest.get_node(pointed_thing.under)
		if placer and not placer:get_player_control().sneak then
			if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
				return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer, itemstack) or itemstack
			end
		end

		-- Only carve pumpkin if used on side
		if pointed_thing.above.y ~= pointed_thing.under.y then
			return
		end
		if node.name == "mcl_farming:pumpkin" then
			if not minetest.is_creative_enabled(placer:get_player_name()) then
				-- Add wear (as if digging a shearsy node)
				local toolname = itemstack:get_name()
				--local wear = mcl_autogroup.get_wear(toolname, "shearsy")
				--itemstack:add_wear(wear)
			end
			minetest.sound_play({name="default_grass_footstep", gain=1}, {pos = pointed_thing.above}, true)
			local dir = vector.subtract(pointed_thing.under, pointed_thing.above)
			local param2 = minetest.dir_to_facedir(dir)
			minetest.swap_node(pointed_thing.under, {name="mcl_farming:pumpkin_face", param2 = param2})
			minetest.add_item(pointed_thing.above, "mcl_farming:pumpkin_seeds 4")
		end
		return itemstack
	end
    minetest.register_tool("unbreaking:shears", {
	    description = S("Unbreakable Shears"),
	    _doc_items_longdesc = shears_longdesc,
	    _doc_items_usagehelp = shears_use,
	    inventory_image = "default_tool_shears.png",
	    wield_image = "default_tool_shears.png",
	    stack_max = 1,
	    groups = { tool=1, shears=1, dig_speed_class=4, },
	    tool_capabilities = {
	            full_punch_interval = 0.5,
	            max_drop_level=1,
	    },
	    on_place = carve_pumpkin,
	    sound = { breaks = "default_tool_breaks" },
	    _mcl_toollike_wield = true,
	    _mcl_diggroups = {
		    shearsy = { speed = 1.5, level = 1, uses = 0 },
		    shearsy_wool = { speed = 5, level = 1, uses = 0 },
		    shearsy_cobweb = { speed = 15, level = 1, uses = 0 }
	    },
    })
    minetest.register_craft({
	    type = "shapeless",
	    output = "unbreaking:shears",
	    recipe = {
		    "mcl_tools:shears",
		    "group:wood"
	    }
    })
    minetest.log("action", "[unbreaking] MineClone2 Shears now Unbreakable!")
end

--
-- Register Craft Recipies
--

local craft_ingreds = {}
if mt_g then
    craft_ingreds = {
	    wood = "group:wood",
	    stone = "group:stone",
	    steel = "default:steel_ingot",
	    bronze = "default:bronze_ingot",
	    mese = "default:mese_crystal",
	    diamond = "default:diamond"
    }
    minetest.log("action", "[unbreaking] Detected Minetest Game!")
elseif mcl2 then
    craft_ingreds = {
	    wood = "group:wood",
	    stone = "group:stone",
	    iron = "mcl_core:iron_ingot",
	    gold = "mcl_core:gold_ingot",
	    diamond = "mcl_core:diamond"
    }
    minetest.log("action", "[unbreaking] Detected MineClone2 Game!")
end

for name, mat in pairs(craft_ingreds) do
    minetest.log("action", "[unbreaking] Creating Crafting Recipes for "..name.." which uses "..mat.." material for upgrade.")
	if unbreaking_pick then
        if mt_g then
		    minetest.register_craft({
			    type = "shapeless",
			    output = "unbreaking:pick_".. name,
			    recipe = {
				    "default:pick_"..name,
				    mat
			    }
		    })
        elseif mcl2 then
            minetest.register_craft({
			    type = "shapeless",
			    output = "unbreaking:pick_".. name,
			    recipe = {
				    "mcl_tools:pick_"..name,
				    mat
			    }
		    })
        end
	end

	if unbreaking_shovel then
        if mt_g then
		    minetest.register_craft({
			    type = "shapeless",
			    output = "unbreaking:shovel_".. name,
			    recipe = {
				    "default:shovel_"..name,
				    mat
			    }
		    })
        elseif mcl2 then
		    minetest.register_craft({
			    type = "shapeless",
			    output = "unbreaking:shovel_".. name,
			    recipe = {
				    "mcl_tools:shovel_"..name,
				    mat
			    }
		    })
        end
	end

	if unbreaking_axe then
        if mt_g then
		    minetest.register_craft({
			    type = "shapeless",
			    output = "unbreaking:axe_".. name,
			    recipe = {
				    "default:axe_"..name,
				    mat
			    }
		    })
        elseif mcl2 then
		    minetest.register_craft({
			    type = "shapeless",
			    output = "unbreaking:axe_".. name,
			    recipe = {
				    "mcl_tools:axe_"..name,
				    mat
			    }
		    })
        end
	end
	
    if unbreaking_sword then
        if mt_g then
            minetest.register_craft({
			    type = "shapeless",
                output = "unbreaking:sword_".. name,
                recipe = {
				    "default:sword_"..name,
				    mat
                }
            })
        elseif mcl2 then
            minetest.register_craft({
			    type = "shapeless",
                output = "unbreaking:sword_".. name,
                recipe = {
				    "mcl_tools:sword_"..name,
				    mat
                }
            })
        end
    end
    if unbreaking_hoe then
        if mcl2 then
            minetest.register_craft({
                type = "shapeless",
	            output = "unbreaking:hoe_"..name,
	            recipe = {
		            "mcl_farming:hoe_"..name,
                    mat
	            }
            })
        end
    end
end

--
-- Decompose
--

if unbreaking_pick then
	minetest.register_craft({
		type = "fuel",
		recipe = "unbreaking:pick_wood",
		burntime = 6,
	})
end

if unbreaking_shovel then
	minetest.register_craft({
		type = "fuel",
		recipe = "unbreaking:shovel_wood",
		burntime = 4,
	})
end

if unbreaking_axe then
	minetest.register_craft({
		type = "fuel",
		recipe = "unbreaking:axe_wood",
		burntime = 6,
	})
end

if unbreaking_sword then
	minetest.register_craft({
		type = "fuel",
		recipe = "unbreaking:sword_wood",
		burntime = 5,
	})
end

if unbreaking_hoe then
    minetest.register_craft({
        type = "fuel",
        recipe = "unbreaking:hoe_wood",
        burntime = 5,
    })
end
