-- ███╗   ███╗██╗██╗  ██╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗████████╗
-- ████╗ ████║██║██║ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
-- ██╔████╔██║██║█████╔╝ █████╗     ██║   ██████╔╝██║   ██║██║   ██║   ██║
-- ██║╚██╔╝██║██║██╔═██╗ ██╔══╝     ██║   ██╔══██╗██║   ██║██║   ██║   ██║
-- ██║ ╚═╝ ██║██║██║  ██╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╔╝   ██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝


--========================================================--
--                      MNK.lua                           --
--              Simple Monk GearSwap                     --
--========================================================--

tp_mode = "Regular"
ws_mode = "Normal"
subtle_blow_mode = false
hoxne_locked = false
counter_mode = false


function get_sets()

    --====================================================--
    -- IDLE
    --====================================================--
    sets.idle = {
        ammo="Staunch Tathlum",
        head="Null Masque",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Elite Royal Collar",
        waist="Null Belt",
        left_ear="Alabaster Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Shneddick Ring",
        right_ring="Warp Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }


    --====================================================--
    -- ENGAGED / TP SETS
    -- NumPad 1: Regular <-> Defense
    -- NumPad 2: Subtle Blow ON/OFF
    --
    -- Hoxne versions are selected automatically while
    -- NumPad 9 has Hoxne Ampulla equipped/locked.
    --====================================================--
    sets.engaged = {}

    -- Finan-style Godhands TP set, adapted to Miketrout's verified gear.
    sets.engaged.Regular = {
        ammo="Aurgelmir Orb",
        head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        body="Mpaca's Doublet",
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Bhikku Hose +3",
        feet="Mpaca's Boots",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Epona's Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    -- Defensive/full-DT leaning set.
    sets.engaged.Defense = {
        ammo="Aurgelmir Orb",
        head="Mpaca's Cap",
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Bhikku Hose +3",
        feet="Mpaca's Boots",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Alabaster Earring",
        right_ear="Schere Earring",
        left_ring="Epona's Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    -- User-defined Subtle Blow TP set. This is a hard override while
    -- Subtle Blow mode is enabled with NumPad 2.
    sets.engaged.SubtleBlow = {
        main="Godhands",
        ammo="Hoxne Ampulla",
        head="Bhikku Crown +3",
        body="Bhikku Cyclas +3",
        hands="Malignance Gloves",
        legs="Bhikku Hose +3",
        feet="Anch. Gaiters +4",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    -- NumPad 4 Counter set. Jolt Counter is locked in the main slot
    -- while this mode is active so weapon skills cannot replace it.
    sets.engaged.Counter = {
        main="Jolt Counter",
        ammo="Crepuscular Pebble",
        head="Bhikku Crown +3",
        body="Mpaca's Doublet",
        hands={ name="Rao Kote +1", augments={'Accuracy+12','Attack+12','Evasion+20',}},
        legs="Anch. Hose +2",
        feet="Bhikku Gaiters +3",
        neck="Bathy Choker +1",
        waist="Moonbow Belt +1",
        left_ear="Schere Earring",
        right_ear={ name="Bhikku Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Store TP"+3',}},
        left_ring="Niqmaddu Ring",
        right_ring="Murky Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
    }

    -- Hoxne Ampulla TP families.
    -- Ammo remains locked by NumPad 9, so these sets cannot accidentally
    -- replace Hoxne while it is active.
    sets.engaged.Hoxne = {}

    sets.engaged.Hoxne.Regular = {
        main="Godhands",
        ammo="Hoxne Ampulla",
        head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Bhikku Hose +3",
        feet="Malignance Boots",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.Hoxne.Defense = {
        main="Godhands",
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Bhikku Hose +3",
        feet="Mpaca's Boots",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Crep. Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    -- Same hard-override Subtle Blow set if NumPad 9 is also active.
    sets.engaged.Hoxne.SubtleBlow = sets.engaged.SubtleBlow


    --====================================================--
    -- WEAPONSKILLS - FINAN ROUTING
    --
    -- NumPad 8:
    --   Normal  <-> ATK Cap
    --
    -- NumPad 9:
    --   Automatically switches to Hoxne versions.
    --
    -- Footwork:
    --   Automatically uses Dragon Kick / Tornado Kick
    --   Footwork versions.
    --
    -- Impetus:
    --   Automatically uses the Impetus Victory Smite set.
    --   Other WS keep Bhikku Cyclas +3 equipped while active.
    --====================================================--
    sets.ws = {}
    sets.ws.Normal = {}
    sets.ws.ATKCap = {}
    sets.ws.HoxneNormal = {}
    sets.ws.HoxneATKCap = {}

    sets.ws.Footwork = {
        Normal = {},
        ATKCap = {},
        HoxneNormal = {},
        HoxneATKCap = {},
    }

    sets.ws.Impetus = {
        Normal = {},
        ATKCap = {},
        HoxneNormal = {},
        HoxneATKCap = {},
    }

    -- User-defined Subtle Blow WS set. Every weapon skill uses this
    -- exact set while Subtle Blow mode is active.
    sets.ws.SubtleBlow = {
        main="Godhands",
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Ken. Samue +1",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Mpaca's Boots",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Moonshade Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    -- General fallback for any WS without a dedicated set.
    sets.ws.General = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }


    --========================--
    -- HOWLING FIST
    --========================--
    sets.ws.Normal["Howling Fist"] = {
        ammo="Coiste Bodhar",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Ephramad's Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.ATKCap["Howling Fist"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Ephramad's Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }


    --========================--
    -- VICTORY SMITE
    --========================--
    sets.ws.Normal["Victory Smite"] = {
        ammo="Coiste Bodhar",
        head="Mpaca's Cap",
        body="Mpaca's Doublet",
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Ephramad's Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.ATKCap["Victory Smite"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Mpaca's Doublet",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Ephramad's Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.Impetus.Normal["Victory Smite"] =
        set_combine(sets.ws.Normal["Victory Smite"], {
            body="Bhikku Cyclas +3",
        })

    sets.ws.Impetus.ATKCap["Victory Smite"] =
        set_combine(sets.ws.ATKCap["Victory Smite"], {
            body="Bhikku Cyclas +3",
        })


    --========================--
    -- TORNADO KICK
    --========================--
    sets.ws.Normal["Tornado Kick"] = {
        ammo="Coiste Bodhar",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.ATKCap["Tornado Kick"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Ephramad's Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.Footwork.Normal["Tornado Kick"] =
        set_combine(sets.ws.Normal["Tornado Kick"], {
            feet="Anch. Gaiters +4",
        })

    sets.ws.Footwork.ATKCap["Tornado Kick"] =
        set_combine(sets.ws.ATKCap["Tornado Kick"], {
            feet="Anch. Gaiters +4",
        })


    --========================--
    -- DRAGON KICK
    --========================--
    sets.ws.Normal["Dragon Kick"] = {
        ammo="Coiste Bodhar",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.ATKCap["Dragon Kick"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Ephramad's Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.Footwork.Normal["Dragon Kick"] =
        set_combine(sets.ws.Normal["Dragon Kick"], {
            feet="Anch. Gaiters +4",
        })

    sets.ws.Footwork.ATKCap["Dragon Kick"] =
        set_combine(sets.ws.ATKCap["Dragon Kick"], {
            feet="Anch. Gaiters +4",
        })


    --========================--
    -- RAGING FISTS
    --========================--
    sets.ws.Normal["Raging Fists"] = {
        ammo="Coiste Bodhar",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.ATKCap["Raging Fists"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }


    --========================--
    -- SHIJIN SPIRAL
    --========================--
    sets.ws.Normal["Shijin Spiral"] = {
        ammo="Coiste Bodhar",
        head="Mpaca's Cap",
        body="Bhikku Cyclas +3",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.ws.ATKCap["Shijin Spiral"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Malignance Tabard",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }


    --========================--
    -- ASCETIC'S FURY
    --========================--
    sets.ws.Normal["Ascetic's Fury"] = {
        ammo="Coiste Bodhar",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.ATKCap["Ascetic's Fury"] =
        set_combine(sets.ws.Normal["Ascetic's Fury"], {
            ammo="Crepuscular Pebble",
        })


    --====================================================--
    -- HOXNE WEAPONSKILL FAMILIES
    --
    -- These follow Finan's Hoxne priorities while using
    -- verified substitutes where exact guide pieces were
    -- not present in the user's export.
    --====================================================--

    sets.ws.HoxneNormal["Howling Fist"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Bhikku Gloves +3",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.HoxneATKCap["Howling Fist"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.HoxneNormal["Victory Smite"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Mpaca's Doublet",
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.HoxneATKCap["Victory Smite"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Bhikku Cyclas +3",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Fotia Belt",
        left_ear="Alabaster Earring",
        right_ear="Schere Earring",
        left_ring="Ephramad's Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.Impetus.HoxneNormal["Victory Smite"] =
        set_combine(sets.ws.HoxneNormal["Victory Smite"], {
            body="Bhikku Cyclas +3",
        })

    sets.ws.Impetus.HoxneATKCap["Victory Smite"] =
        set_combine(sets.ws.HoxneATKCap["Victory Smite"], {
            body="Bhikku Cyclas +3",
        })

    sets.ws.HoxneNormal["Tornado Kick"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.HoxneATKCap["Tornado Kick"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.Footwork.HoxneNormal["Tornado Kick"] =
        set_combine(sets.ws.HoxneNormal["Tornado Kick"], {
            feet="Anch. Gaiters +4",
        })

    sets.ws.Footwork.HoxneATKCap["Tornado Kick"] =
        set_combine(sets.ws.HoxneATKCap["Tornado Kick"], {
            feet="Anch. Gaiters +4",
        })

    sets.ws.HoxneNormal["Dragon Kick"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.HoxneATKCap["Dragon Kick"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.Footwork.HoxneNormal["Dragon Kick"] =
        set_combine(sets.ws.HoxneNormal["Dragon Kick"], {
            feet="Anch. Gaiters +4",
        })

    sets.ws.Footwork.HoxneATKCap["Dragon Kick"] =
        set_combine(sets.ws.HoxneATKCap["Dragon Kick"], {
            feet="Anch. Gaiters +4",
        })

    sets.ws.HoxneNormal["Raging Fists"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Bhikku Cyclas +3",
        hands="Bhikku Gloves +3",
        legs="Nyame Flanchard",
        feet="Mpaca's Boots",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Gere Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.HoxneATKCap["Raging Fists"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Malignance Tabard",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Ephramad's Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.HoxneNormal["Shijin Spiral"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Bhikku Cyclas +3",
        hands="Bhikku Gloves +3",
        legs="Nyame Flanchard",
        feet="Mpaca's Boots",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Alabaster Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.ws.HoxneATKCap["Shijin Spiral"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Malignance Tabard",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Fotia Belt",
        left_ear="Alabaster Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.ws.HoxneNormal["Ascetic's Fury"] = {
        ammo="Hoxne Ampulla",
        head="Mpaca's Cap",
        body="Bhikku Cyclas +3",
        hands="Bhikku Gloves +3",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Alabaster Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.HoxneATKCap["Ascetic's Fury"] =
        set_combine(sets.ws.HoxneNormal["Ascetic's Fury"], {})


    --====================================================--
    -- JOB ABILITY SETS
    --====================================================--
    sets.ja = {}

    -- Artifact armor
    sets.ja["Boost"] = {
        hands="Anchor. Gloves +3",
    }

    sets.ja["Focus"] = {
        head="Anch. Crown +3",
    }

    sets.ja["Dodge"] = {
        feet="Anch. Gaiters +4",
    }

    sets.ja["Chakra"] = {
        body="Anch. Cyclas +3",
        hands="Hes. Gloves",
    }

    -- Relic armor (exact Hesychast pieces supplied by user)
    -- Hes. Crown enhances Penance, which is applied through Chi Blast.
    sets.ja["Chi Blast"] = {
        head="Hes. Crown",
    }

    -- Hes. Gaiters increase Counterstance counter rate when worn on activation.
    sets.ja["Counterstance"] = {
        feet="Hes. Gaiters",
    }

    -- Hes. Cyclas enhances Formless Strikes duration.
    sets.ja["Formless Strikes"] = {
        body="Hes. Cyclas",
    }

    -- Hes. Gaiters enhance Mantra.
    sets.ja["Mantra"] = {
        feet="Hes. Gaiters",
    }

    -- Hes. Hose enhance Hundred Fists duration.
    sets.ja["Hundred Fists"] = {
        legs="Hes. Hose",
    }

    -- Empyrean armor
    sets.ja["Perfect Counter"] = {
        head="Bhikku Crown +3",
    }

    sets.ja["Footwork"] = {
        feet="Bhikku Gaiters +3",
    }

    sets.ja["Impetus"] = {
        body="Bhikku Cyclas +3",
    }

    -- No specific AF/Relic/Empyrean activation piece is required here.
    sets.ja["Inner Strength"] = {}

    --====================================================--
    -- STARTUP / NUMPAD BINDS
    -- get_sets() is called once when GearSwap loads this job file.
    --====================================================--
    send_command('bind numpad1 gs c tpmode')
    send_command('bind numpad2 gs c subtle')
    send_command('bind numpad4 gs c counter')
    send_command('bind numpad8 gs c wsmode')
    send_command('bind numpad9 gs c hoxne')

    send_command('input /macro book 7; wait 1; input /macro set 1')
    send_command('wait 5; input /lockstyleset 13')

    add_to_chat(158, 'MNK NumPad: 1 TP Mode | 2 Subtle Blow | 4 Counter | 8 WS Normal/ATK Cap | 9 Hoxne')

end


--========================================================--
-- COUNTER MODE CLEANUP
--========================================================--
function exit_counter_mode()

    if counter_mode then
        counter_mode = false
        enable('main')
    end

end


--========================================================--
-- WEAPONSKILL FAMILY SELECTOR
--========================================================--
function get_ws_family()

    if hoxne_locked then
        if ws_mode == "ATKCap" then
            return "HoxneATKCap"
        else
            return "HoxneNormal"
        end
    end

    return ws_mode

end


function get_ws_set(ws_name)

    -- Subtle Blow mode is a hard override for every weapon skill.
    if subtle_blow_mode then
        return sets.ws.SubtleBlow
    end

    local family = get_ws_family()

    -- Footwork-specific Dragon Kick / Tornado Kick sets.
    if buffactive["Footwork"]
        and sets.ws.Footwork[family]
        and sets.ws.Footwork[family][ws_name] then

        return sets.ws.Footwork[family][ws_name]
    end

    -- Victory Smite has a dedicated Impetus family.
    if buffactive["Impetus"]
        and sets.ws.Impetus[family]
        and sets.ws.Impetus[family][ws_name] then

        return sets.ws.Impetus[family][ws_name]
    end

    if sets.ws[family] and sets.ws[family][ws_name] then
        return sets.ws[family][ws_name]
    end

    return sets.ws.General

end


--========================================================--
-- PRECAST
--========================================================--
function precast(spell)

    if spell.type == "WeaponSkill" then

        equip(get_ws_set(spell.english))

        -- Subtle Blow + Footwork: use AF feet +4 for kick weapon skills.
        if subtle_blow_mode
            and buffactive["Footwork"]
            and (spell.english == "Dragon Kick" or spell.english == "Tornado Kick") then
            equip({feet="Anch. Gaiters +4"})
        end

        -- User preference: keep Bhikku Cyclas +3 on while Impetus
        -- is active, even for WS other than Victory Smite.
        if not subtle_blow_mode
            and buffactive["Impetus"]
            and spell.english ~= "Victory Smite" then
            equip({body="Bhikku Cyclas +3"})
        end

    elseif spell.type == "JobAbility" then

        if sets.ja[spell.english] then
            equip(sets.ja[spell.english])
        end

    end

end


--========================================================--
-- MIDCAST
--========================================================--
function midcast(spell)
end


--========================================================--
-- AFTERCAST
--========================================================--
function aftercast(spell)

    -- Chi Blast applies Penance (Inhibit TP) to Aminon for 100 seconds.
    -- Give the party a warning five seconds before it is expected to wear off.
    local target_name = spell.target and spell.target.name

    -- Fall back to the current target for older GearSwap action tables.
    if not target_name and player.target then
        target_name = player.target.name
    end

    if spell.english == "Chi Blast"
        and not spell.interrupted
        and target_name == "Aminon" then
        windower.send_command('wait 95; input /p 5 seconds until Penance off. <call20>')
    end

    equip_current_set()
end


--========================================================--
-- PENANCE WEAR-OFF ALERT
-- The game reports Penance as Aminon's Inhibit TP effect.
--========================================================--
windower.raw_register_event('incoming text', function(str)

    if string.match(str, "Aminon's Inhibit TP effect wears off") then
        windower.send_command('input /p Penance off. <call21>')
    end

end)


--========================================================--
-- STATUS CHANGE
--========================================================--
function status_change(new, old)
    equip_current_set()
end


--========================================================--
-- BUFF CHANGE
-- Handles Footwork and Impetus gear immediately when the
-- buffs turn on/off.
--========================================================--
function buff_change(buff, gain)

    if buff == "Footwork" or buff == "Impetus" then
        equip_current_set()
    end

end


--========================================================--
-- CURRENT ENGAGED SET
-- Automatically uses Hoxne TP sets while Hoxne is locked.
-- Footwork: Anch. Gaiters +4 while active
-- Impetus:  Bhikku Cyclas +3 while active
--========================================================--
function equip_current_set()

    if player.status == "Engaged" then

        local tp_set

        if counter_mode then
            tp_set = sets.engaged.Counter
        elseif subtle_blow_mode then
            -- Subtle Blow is a hard gear override regardless of the
            -- Regular/Defense or Hoxne toggle state.
            tp_set = sets.engaged.SubtleBlow
        elseif hoxne_locked then
            tp_set = sets.engaged.Hoxne[tp_mode]
        else
            tp_set = sets.engaged[tp_mode]
        end

        equip(tp_set)

        -- Do not overwrite any pieces from the user-defined Subtle Blow set.
        if not counter_mode and not subtle_blow_mode and buffactive["Footwork"] then
            equip({feet="Anch. Gaiters +4"})
        end

        if not counter_mode and not subtle_blow_mode and buffactive["Impetus"] then
            if hoxne_locked then
                equip({body="Bhikku Cyclas +3"})
            else
                equip({body="Bhikku Cyclas +3", ammo="Coiste Bodhar"})
            end
        end

    else
        equip(sets.idle)
    end

end


--========================================================--
-- UNLOAD
--========================================================--
function file_unload()

    -- Never leave equipment slots disabled after unloading or reloading this file.
    enable('ammo')
    enable('main')

    send_command('unbind numpad1')
    send_command('unbind numpad2')
    send_command('unbind numpad4')
    send_command('unbind numpad8')
    send_command('unbind numpad9')

end


--========================================================--
-- SELF COMMAND
--========================================================--
function self_command(command)

    if command == "tpmode" then

        -- NumPad 1 exits special TP modes and toggles between
        -- the normal Regular and Defense families.
        exit_counter_mode()
        subtle_blow_mode = false

        if tp_mode == "Regular" then
            tp_mode = "Defense"
            add_to_chat(158, 'MNK TP Mode: DEFENSE')
        else
            tp_mode = "Regular"
            add_to_chat(158, 'MNK TP Mode: REGULAR')
        end

        equip_current_set()

    elseif command == "subtle" then

        -- NumPad 2 toggles Subtle Blow on/off.
        -- Turning it off returns to the Regular/Defense mode
        -- last selected with NumPad 1.
        exit_counter_mode()
        subtle_blow_mode = not subtle_blow_mode

        if subtle_blow_mode then
            add_to_chat(158, 'MNK TP Mode: SUBTLE BLOW')
        else
            add_to_chat(158, 'MNK Subtle Blow: OFF - Returning to '..string.upper(tp_mode))
        end

        equip_current_set()

    elseif command == "counter" then

        -- NumPad 4 toggles the dedicated Counter set and keeps
        -- Jolt Counter locked in the main slot while active.
        if counter_mode then

            counter_mode = false
            enable('main')
            add_to_chat(158, 'MNK Counter Mode: OFF - Returning to '..string.upper(tp_mode))
            equip_current_set()

        else

            -- Counter mode is exclusive with Hoxne and Subtle Blow so
            -- their weapon/ammo requirements cannot conflict.
            if hoxne_locked then
                enable('ammo')
                hoxne_locked = false
            end

            subtle_blow_mode = false
            counter_mode = true

            enable('main')
            equip(sets.engaged.Counter)
            disable('main')

            add_to_chat(158, 'MNK Counter Mode: ON - JOLT COUNTER LOCKED')

        end

    elseif command == "wsmode" then

        if ws_mode == "Normal" then
            ws_mode = "ATKCap"
            add_to_chat(158, 'MNK WS Mode: ATTACK CAPPED')
        else
            ws_mode = "Normal"
            add_to_chat(158, 'MNK WS Mode: NORMAL')
        end

    elseif command == "hoxne" then

        -- Hoxne mode is exclusive with Counter mode because each
        -- requires a different weapon and ammo setup.
        exit_counter_mode()

        -- NumPad 9 toggles Hoxne Ampulla ON/OFF.
        if not hoxne_locked then

            enable('ammo')
            hoxne_locked = true
            equip({ammo="Hoxne Ampulla"})
            disable('ammo')

            add_to_chat(158, 'Hoxne Ampulla: ON - HOXNE TP/WS SETS ACTIVE')
            send_command('wait 5; input /item "Hoxne Ampulla" <me>')

            if player.status == "Engaged" then
                equip_current_set()
            end

        else

            enable('ammo')
            hoxne_locked = false
            add_to_chat(158, 'Hoxne Ampulla: OFF - NORMAL TP/WS SETS ACTIVE')
            equip_current_set()

        end

    end

end
