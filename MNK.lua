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
subtle_blow_mode = false
hoxne_locked = false
weapon_mode = "Godhands"


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
    --====================================================--
    sets.engaged = {}

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

    sets.engaged.SubtleBlow = {
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
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }


    --====================================================--
    -- WEAPONSKILLS
    --====================================================--
    sets.ws = {}

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

    sets.ws["Ascetic's Fury"] = {
        ammo="Coiste Bodhar",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.ws["Shijin Spiral"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Malignance Tabard",
        hands="Nyame Gauntlets",
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

    sets.ws["Victory Smite"] = {
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

    sets.ws["Raging Fists"] = {
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

    sets.ws["Dragon Kick"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
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

    sets.ws["Howling Fist"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
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

    sets.ws["Tornado Kick"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
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


    --====================================================--
    -- FOOTWORK-ONLY WEAPONSKILL SETS
    -- These are ONLY used while the Footwork buff is active.
    --====================================================--
    sets.ws.Footwork = {}

    sets.ws.Footwork["Dragon Kick"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Mpaca's Hose",
        feet="Anch. Gaiters +3",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }

    sets.ws.Footwork["Tornado Kick"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Mpaca's Hose",
        feet="Anch. Gaiters +3",
        neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
        waist="Moonbow Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Ephramad's Ring",
        back={ name="Segomo's Mantle", augments={'STR+20','STR+10','"Dbl.Atk."+10',}},
    }


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
        feet="Anch. Gaiters +3",
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
        feet="Bhikku Gaiters +2",
    }

    sets.ja["Impetus"] = {
        body="Bhikku Cyclas +2",
    }

    -- No specific AF/Relic/Empyrean activation piece is required here.
    sets.ja["Inner Strength"] = {}

    --====================================================--
    -- STARTUP / NUMPAD BINDS
    -- get_sets() is called once when GearSwap loads this job file.
    --====================================================--
    send_command('bind numpad1 gs c weapon')
    send_command('bind numpad2 gs c tpmode')
    send_command('bind numpad3 gs c subtle')
    send_command('bind numpad9 gs c hoxne')

    send_command('input /macro book 7; wait 1; input /macro set 1')
    send_command('wait 5; input /lockstyleset 13')

    add_to_chat(158, 'MNK NumPad: 1 Weapons | 2 TP Mode | 3 Subtle Blow | 9 Hoxne Ampulla')
    add_to_chat(158, 'MNK Weapon Mode: GODHANDS')

end


--========================================================--
-- PRECAST
--========================================================--
function precast(spell)

    if spell.type == "WeaponSkill" then

        -- Footwork versions of Dragon Kick / Tornado Kick
        -- are used ONLY when Footwork is actually active.
        if buffactive["Footwork"] and sets.ws.Footwork[spell.english] then
            equip(sets.ws.Footwork[spell.english])
        elseif sets.ws[spell.english] then
            equip(sets.ws[spell.english])
        else
            equip(sets.ws.General)
        end

        -- Bhikku Cyclas +3 augments Impetus only while worn,
        -- so keep it on for weapon skills while Impetus is active.
        if buffactive["Impetus"] then
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
    equip_current_set()
end


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
-- Footwork: Anch. Gaiters +3 while active
-- Impetus:  Bhikku Cyclas +3 while active
--========================================================--
function equip_current_set()

    if player.status == "Engaged" then

        if subtle_blow_mode then
            equip(sets.engaged.SubtleBlow)
        else
            equip(sets.engaged[tp_mode])
        end

        -- User-requested Footwork engaged override.
        if buffactive["Footwork"] then
            equip({feet="Anch. Gaiters +3"})
        end

        -- Impetus body must remain equipped to augment Impetus.
        if buffactive["Impetus"] then
            equip({body="Bhikku Cyclas +3"})
        end

    else
        equip(sets.idle)
    end

    equip_weapon_set()

end


--========================================================--
-- CURRENT WEAPON SET
-- NumPad 1 cycles:
-- Godhands -> Karambit -> Xoanon + Elder's Grip +1
--========================================================--
function equip_weapon_set()

    if weapon_mode == "Godhands" then
        equip({main="Godhands", sub=empty})
    elseif weapon_mode == "Karambit" then
        equip({main="Karambit", sub=empty})
    elseif weapon_mode == "Xoanon" then
        equip({main="Xoanon", sub="Elder's Grip +1"})
    end

end




--========================================================--
-- UNLOAD
--========================================================--
function file_unload()

    send_command('unbind numpad1')
    send_command('unbind numpad2')
    send_command('unbind numpad3')
    send_command('unbind numpad9')

end


--========================================================--
-- SELF COMMAND
--========================================================--
function self_command(command)

    if command == "weapon" then

        if weapon_mode == "Godhands" then
            weapon_mode = "Karambit"
            add_to_chat(158, 'MNK Weapon: KARAMBIT')
        elseif weapon_mode == "Karambit" then
            weapon_mode = "Xoanon"
            add_to_chat(158, "MNK Weapon: XOANON + ELDER'S GRIP +1")
        else
            weapon_mode = "Godhands"
            add_to_chat(158, 'MNK Weapon: GODHANDS')
        end

        equip_weapon_set()

    elseif command == "tpmode" then

        -- NumPad 2 always exits Subtle Blow mode and toggles
        -- between the two normal TP modes.
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

        -- NumPad 3 toggles Subtle Blow on/off.
        -- Turning it off returns to the Regular/Defense mode
        -- last selected with NumPad 2.
        subtle_blow_mode = not subtle_blow_mode

        if subtle_blow_mode then
            add_to_chat(158, 'MNK TP Mode: SUBTLE BLOW')
        else
            add_to_chat(158, 'MNK Subtle Blow: OFF - Returning to '..string.upper(tp_mode))
        end

        equip_current_set()

    elseif command == "hoxne" then

        -- NumPad 9 toggles Hoxne Ampulla ON/OFF.
        if not hoxne_locked then

            enable('ammo')
            equip({ammo="Hoxne Ampulla"})
            disable('ammo')
            hoxne_locked = true

            add_to_chat(158, 'Hoxne Ampulla: ON - AMMO LOCKED')
            send_command('wait 5; input /item "Hoxne Ampulla" <me>')

        else

            enable('ammo')
            hoxne_locked = false
            add_to_chat(158, 'Hoxne Ampulla: OFF - AMMO UNLOCKED')
            equip_current_set()

        end

    end

end
