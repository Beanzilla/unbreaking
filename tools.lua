-- From

-- games/minetest_game/mods/default/tools.lua

-- support for MT game translation.
local S = default.get_translator

--
-- Picks
--
if unbreaking_pick then
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
end

--
-- Shovels
--
if unbreaking_shovel then
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
end

--
-- Axes
--
if unbreaking_axe then
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
end

--
-- Swords?
--
if unbreaking_sword then
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
end

--
-- Hoes
-- From games/minetest_game/mods/farming/hoes.lua
--[[ Failwhale
if unbreaking_hoe then
    farming = {}
    farming.path = minetest.get_modpath("farming")
    farming.get_translator = S

	farming.register_hoe("unbreaking:hoe_wood", {
		description = S("Unbreakable Wooden Hoe"),
		inventory_image = "farming_tool_woodhoe.png",
		max_uses = 0,
		material = "group:wood",
		groups = {hoe = 1, flammable = 2},
	})

	farming.register_hoe("unbreaking:hoe_stone", {
		description = S("Unbreakable Stone Hoe"),
		inventory_image = "farming_tool_stonehoe.png",
		max_uses = 0,
		material = "group:stone",
		groups = {hoe = 1}
	})

	farming.register_hoe("unbreaking:hoe_steel", {
		description = S("Unbreakable Steel Hoe"),
		inventory_image = "farming_tool_steelhoe.png",
		max_uses = 0,
		material = "default:steel_ingot",
		groups = {hoe = 1}
	})

	if unbreaking_hoe_old then
		farming.register_hoe("unbreaking:hoe_bronze", {
			description = S("Unbreakable Bronze Hoe"),
			inventory_image = "farming_tool_bronzehoe.png",
			max_uses = 0,
			groups = {hoe = 1, not_in_creative_inventory = 1},
		})

		farming.register_hoe("unbreaking:hoe_mese", {
			description = S("Unbreakable Mese Hoe"),
			inventory_image = "farming_tool_mesehoe.png",
			max_uses = 0,
			groups = {hoe = 1, not_in_creative_inventory = 1},
		})

		farming.register_hoe("unbreaking:hoe_diamond", {
			description = S("Unbreakable Diamond Hoe"),
			inventory_image = "farming_tool_diamondhoe.png",
			max_uses = 0,
			groups = {hoe = 1, not_in_creative_inventory = 1},
		})
	end
end
--]]

--
-- Register Craft Recipies
--

local craft_ingreds = {
	wood = "group:wood",
	stone = "group:stone",
	steel = "default:steel_ingot",
	bronze = "default:bronze_ingot",
	mese = "default:mese_crystal",
	diamond = "default:diamond"
}

for name, mat in pairs(craft_ingreds) do
	if unbreaking_pick then
		minetest.register_craft({
			type = "shapeless",
			output = "unbreaking:pick_".. name,
			recipe = {
				"default:pick_"..name,
				mat
			}
		})
	end

	if unbreaking_shovel then
		minetest.register_craft({
			type = "shapeless",
			output = "unbreaking:shovel_".. name,
			recipe = {
				"default:shovel_"..name,
				mat
			}
		})
	end

	if unbreaking_axe then
		minetest.register_craft({
			type = "shapeless",
			output = "unbreaking:axe_".. name,
			recipe = {
				"default:axe_"..name,
				mat
			}
		})
	end
	
    if unbreaking_sword then
        minetest.register_craft({
			type = "shapeless",
            output = "unbreaking:sword_".. name,
            recipe = {
				"default:sword_"..name,
				mat
            }
        })
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