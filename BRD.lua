-- ███╗   ███╗██╗██╗  ██╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗████████╗
-- ████╗ ████║██║██║ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
-- ██╔████╔██║██║█████╔╝ █████╗     ██║   ██████╔╝██║   ██║██║   ██║   ██║
-- ██║╚██╔╝██║██║██╔═██╗ ██╔══╝     ██║   ██╔══██╗██║   ██║██║   ██║   ██║
-- ██║ ╚═╝ ██║██║██║  ██╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╔╝   ██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝
----------------------------------------------------------------------------
-- BRD.lua
-- Custom Bard GearSwap template built from uploaded gear export.
-- Includes:
--   * Daurdabla dummy song handling
--   * Horde Lullaby -> Blurred Harp +1
--   * Foe Lullaby -> Gjallarhorn
--   * TP / WS / FC / Cure templates
--   * Lullaby midcast set
-- Replace/add remaining slots as desired.

-- Independent weapon controls.
-- Numpad 1 cycles main hand: Naegling -> Twashtar -> Carnwenhan.
-- Numpad 2 cycles offhand: Crepuscular Knife -> Fusetto +2 -> Genmei Shield.
-- Numpad 3 toggles defense armor mode.
mainhand_mode = 'Naegling'
offhand_mode = 'Crepuscular Knife'
defense_mode = false

mainhand_order = {'Naegling', 'Twashtar', 'Carnwenhan'}
offhand_order = {'Crepuscular Knife', 'Fusetto +2', 'Genmei Shield'}

function current_weapon_set()
    return {main=mainhand_mode, sub=offhand_mode}
end

function equip_selected_weapons()
    equip({main=mainhand_mode, sub=offhand_mode})
end

function equip_current_weapon()
    equip_selected_weapons()
end

function equip_song_weapons()
    -- Songs force Carnwenhan main hand, while preserving the selected offhand.
    equip({main='Carnwenhan', sub=offhand_mode})
end

-- Startup options. Change these numbers to your preferred lockstyle, macro book, and macro page.
lockstyle_set = 9
macro_book = 4
macro_page = 4


function equip_current_status_set()

    if player and player.status == 'Engaged' then
        if defense_mode and sets.engaged.Defense then
            equip(sets.engaged.Defense)
        else
            equip(sets.engaged)
        end
    else
        equip(sets.idle)
    end

    equip_current_weapon()
end

function show_weapon_mode()
    add_to_chat(122, 'Weapons - Main: '..mainhand_mode..' / Sub: '..offhand_mode)
end

function set_startup_style_and_macros()
    windower.send_command('wait 1; input /lockstyleset '..lockstyle_set)
    windower.send_command('wait 1.5; input /macro book '..macro_book)
    windower.send_command('wait 2; input /macro set '..macro_page)
    add_to_chat(158, 'BRD loaded: lockstyle '..lockstyle_set..', macro book '..macro_book..', page '..macro_page)
end

function get_sets()
    sets = {}

include('CastStill.lua')
    ------------------------------------------------------------
    -- Precast
    ------------------------------------------------------------

    sets.precast = {}

    sets.precast.FC = {
    main="Carnwenhan",
    sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    range="Gjallarhorn",
    head="Fili Calot +3",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Song spellcasting time -4%',}},
    legs="Kaykaus Tights +1",
    feet="Fili Cothurnes +3",
    neck="Mnbw. Whistle +1",
    waist="Embla Sash",
    left_ear="Mendi. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Naji's Loop",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
}


    -- Absorb-TP precast. Replace any slots you want with your preferred dark-magic fast-cast gear.
    sets.precast.AbsorbTP = set_combine(sets.precast.FC, {
        main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Ammurapi Shield",
    ammo="Impatiens",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet="Fili Cothurnes +3",
    neck="Null Loop",
    waist="Embla Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Kyrene's Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    })

    ------------------------------------------------------------
    -- Midcast
    ------------------------------------------------------------

    sets.midcast = {}

    -- Absorb-TP midcast. Replace these placeholders with your preferred Dark Magic skill / Magic Accuracy gear.
    sets.midcast.AbsorbTP = {
    main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Ammurapi Shield",
    ammo="Impatiens",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet="Fili Cothurnes +3",
    neck="Null Loop",
    waist="Embla Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Kyrene's Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }


    sets.midcast.SongEffect = {
    main="Carnwenhan",
    sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    range="Gjallarhorn",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +4",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
    left_ring={name="Stikini Ring +1", bag="wardrobe4"},
    right_ring={name="Stikini Ring +1", bag="wardrobe"},
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
}

    -- Lullaby set: used for Foe Lullaby and Horde Lullaby.
    -- Edit this set anytime you want more Magic Accuracy / CHR gear.
    sets.midcast.Lullaby = {
    main="Carnwenhan",
    sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    head="Brioso Roundlet +2",
    body="Inyanga Jubbah +2",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +4",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
    left_ring={name="Stikini Ring +1", bag="wardrobe4"},
    right_ring={name="Stikini Ring +1", bag="wardrobe"},
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
}


    sets.midcast.DummySong = {
    main="Carnwenhan",
    sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    range="Daurdabla",
    head="Fili Calot +3",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Song spellcasting time -4%',}},
    legs="Kaykaus Tights +1",
    feet="Fili Cothurnes +3",
    neck="Mnbw. Whistle +1",
    waist="Embla Sash",
    left_ear="Mendi. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Naji's Loop",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
}

    sets.midcast.Cure = {
    main="Daybreak",
    sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    ammo="Impatiens",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Kaykaus Tights +1",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Nodens Gorget",
    waist="Null Belt",
    left_ear="Mendi. Earring",
    right_ear={ name="Fili Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
    left_ring={name="Stikini Ring +1", bag="wardrobe4"},
    right_ring={name="Stikini Ring +1", bag="wardrobe"},
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
}

    ------------------------------------------------------------
    -- Idle
    ------------------------------------------------------------

    sets.idle = {
    main="Carnwenhan",
    sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    head="Null Masque",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Null Belt",
    left_ear="Telos Earring",
    right_ear="Alabaster Earring",
    left_ring="Shneddick Ring",
    right_ring="Warp Ring",
    back="Null Shawl",
}

    ------------------------------------------------------------
    -- TP
    ------------------------------------------------------------

    sets.engaged = {
    main="Carnwenhan",
    sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    range="Linos",
    head="Bunzi's Hat",
    body="Perfection Plate.",
    hands="Bunzi's Gloves",
    legs="Nyame Flanchard",
    feet="Perfection Sab.",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Balder Earring",
    left_ring={ name="Moonlight Ring", bag="wardrobe" },
    right_ring={ name="Moonlight Ring", bag="wardrobe2" },
    back="Null Shawl",
    }

    sets.engaged.Defense = {
    main="Carnwenhan",
    sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    range="Linos",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Null Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Eabani Earring",
    left_ring={ name="Moonlight Ring", bag="wardrobe" },
    right_ring={ name="Moonlight Ring", bag="wardrobe2" },
    back="Null Shawl",
    }

    ------------------------------------------------------------
    -- Weapon Skills
    ------------------------------------------------------------

    sets.precast.WS = {    main="Carnwenhan",
    sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring={ name="Moonlight Ring", bag="wardrobe" },
    right_ring={ name="Moonlight Ring", bag="wardrobe2" },
    back="Alabaster Mantle",
}

    sets.precast.WS['Savage Blade'] = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back="Alabaster Mantle",
}

    -- Bind weapon and defense controls.
    windower.send_command('unbind numpad1; bind numpad1 gs c togglemainhand')
    windower.send_command('unbind numpad2; bind numpad2 gs c toggleoffhand')
    windower.send_command('unbind numpad3; bind numpad3 gs c toggledefense')
    windower.send_command('unbind numpad4; bind numpad4 gs c sing4')
    windower.send_command('unbind numpad7; bind numpad7 gs c pianissimo')

    -- Apply lockstyle and set macro book/page when this Lua loads.
    set_startup_style_and_macros()

end

------------------------------------------------------------
-- Instrument Logic
------------------------------------------------------------

dummy_songs = {
    ["Army's Paeon"] = true,
    ["Army's Paeon II"] = true,
    ["Army's Paeon III"] = true,
    ["Army's Paeon IV"] = true,
    ["Army's Paeon V"] = true,
    ["Army's Paeon VI"] = true,
    ["Fowl Aubade"] = true,
    ["Herb Pastoral"] = true,
    ["Shining Fantasia"] = true,
    ["Scop's Operetta"] = true,
    ["Puppet's Operetta"] = true,
    ["Gold Capriccio"] = true,
}

function is_lullaby(spell)
    return spell and spell.english and string.find(spell.english, "Lullaby") ~= nil
end

function get_song_instrument(spell)

    if spell.english == "Honor March" then
        return "Marsyas"
    end

    if dummy_songs[spell.english] then
        return "Daurdabla"
    end

    if string.find(spell.english, "Horde Lullaby") then
        return "Daurdabla"
    end

    if string.find(spell.english, "Foe Lullaby") then
        return "Gjallarhorn"
    end

    return "Gjallarhorn"
end

function precast(spell)

    -- If silence is preventing magic, use Echo Drops automatically and cancel the blocked cast.
    if spell.action_type == 'Magic' and buffactive and buffactive['Silence'] then
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
        add_to_chat(158, 'Silenced: using Echo Drops.')
        return
    end

    if spell.english == 'Absorb-TP' then
        equip(sets.precast.AbsorbTP)
        return
    end

    -- Weapon Skills need to be handled first so Magic FC logic cannot interfere.
    if spell.type == 'WeaponSkill' then
        -- Always equip the base WS set, then layer a named WS set on top if it exists.
        -- This makes generic WS work, and lets Savage Blade inherit missing slots.
        local wsset = sets.precast.WS[spell.english]
        if wsset then
            equip(set_combine(sets.precast.WS, wsset))
        else
            equip(sets.precast.WS)
        end
        equip_current_weapon()
        return
    end

    if spell.action_type == 'Magic' then
        equip(sets.precast.FC)

        -- Songs always start with Carnwenhan/Kali, even while in Naegling mode.
        -- After the song finishes, aftercast() returns you to the selected weapon mode.
        if spell.type == 'BardSong' then
            equip_song_weapons()

            -- Honor March requires Marsyas to already be equipped when casting starts.
            if spell.english == "Honor March" then
                equip({range="Marsyas"})
            end
        else
            equip_current_weapon()
        end
    end
end

function midcast(spell)

    if spell.english == 'Absorb-TP' then
        equip(sets.midcast.AbsorbTP)
        return
    end

    if spell.type == 'BardSong' then

        -- Dummy songs get their own armor set and Daurdabla.
        if dummy_songs[spell.english] then
            equip(sets.midcast.DummySong)
            equip_song_weapons()
            equip({range=get_song_instrument(spell)})
            return
        end

        -- Lullaby gets its own Magic Accuracy / CHR set.
        if is_lullaby(spell) then
            equip(sets.midcast.Lullaby)
            equip_song_weapons()
            equip({range=get_song_instrument(spell)})
            return
        end

        -- Normal songs use the normal song set and normal instrument logic.
        equip(sets.midcast.SongEffect)
        equip_song_weapons()
        equip({range=get_song_instrument(spell)})
        return
    end

    if string.find(spell.english, 'Cure') then
        equip(sets.midcast.Cure)
    end
end

function aftercast(spell)
    equip_current_status_set()
end

function status_change(new,old)
    equip_current_status_set()
end

function buff_change(name, gain)
    -- Automatically use Echo Drops as soon as Silence is detected.
    if gain and string.lower(name) == 'silence' then
        send_command('input /item "Echo Drops" <me>')
        add_to_chat(158, 'Silence detected: using Echo Drops.')
    end
end

function self_command(cmd)
    cmd = string.lower(cmd)

    if cmd == 'sing4' then
        cast_4_songs()
        return
    end

    if cmd == 'equipweapons' then
        equip_selected_weapons()
        return
    end

    if cmd == 'pianissimo' then
        send_command('input /ja "Pianissimo" <me>')
        return
    end

    if cmd == 'togglemainhand' then
        local next_mode = mainhand_order[1]
        for i, mode in ipairs(mainhand_order) do
            if mainhand_mode == mode then
                next_mode = mainhand_order[i + 1] or mainhand_order[1]
                break
            end
        end
        mainhand_mode = next_mode
        equip_current_status_set()
        show_weapon_mode()
        return
    end

    if cmd == 'toggleoffhand' then
        local next_mode = offhand_order[1]
        for i, mode in ipairs(offhand_order) do
            if offhand_mode == mode then
                next_mode = offhand_order[i + 1] or offhand_order[1]
                break
            end
        end
        offhand_mode = next_mode
        equip_current_status_set()
        show_weapon_mode()
        return
    end

    if cmd == 'toggledefense' then
        defense_mode = not defense_mode

        if defense_mode then
            add_to_chat(158,'Defense Mode: ON')
        else
            add_to_chat(122,'Defense Mode: OFF')
        end

        equip_current_status_set()
        return
    end
end

function cast_4_songs()
    send_command('input /ma "Honor March" <me>; wait 8; input /ma "Valor Minuet V" <me>; wait 8; input /ma "Valor Minuet IV" <me>; wait 8; input /ma "Blade Madrigal" <me>')
end

function file_unload()
    windower.send_command('unbind numpad1')
    windower.send_command('unbind numpad2')
    windower.send_command('unbind numpad3')
    windower.send_command('unbind numpad4')
    windower.send_command('unbind numpad7')
end
