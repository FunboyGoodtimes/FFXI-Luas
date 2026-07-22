-- ███╗   ███╗██╗██╗  ██╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗████████╗
-- ████╗ ████║██║██║ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
-- ██╔████╔██║██║█████╔╝ █████╗     ██║   ██████╔╝██║   ██║██║   ██║   ██║
-- ██║╚██╔╝██║██║██╔═██╗ ██╔══╝     ██║   ██╔══██╗██║   ██║██║   ██║   ██║
-- ██║ ╚═╝ ██║██║██║  ██╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╔╝   ██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝

-------------------------------------------------------------------------------------------------------------------
-- GEO.lua - Clean GearSwap Template
-- Built for easy gear-set filling, no HUD/UI.
-- Add your gear inside the sets below.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Initialization
-------------------------------------------------------------------------------------------------------------------

function get_sets()

    mote_include_version = 2

    include('CastStill.lua')

    -- Toggle variables
    MagicBurstMode = false
    DefenseMode = false

    -- Bind keys
    send_command('bind numpad5 gs c toggle DefenseMode')
    send_command('bind numpad7 gs c toggle MagicBurstMode')

    -- Macro book and lockstyle placeholders. Edit these later if you want.
    send_command('input /macro book 2; wait .1; input /macro set 3')
    send_command('wait 2; input /lockstyleset 1')

    -------------------------------------------------------------------------------------------------------------------
    -- Precast Sets
    -------------------------------------------------------------------------------------------------------------------

    sets.precast = {}

    sets.precast.FC = {
    main="C. Palug Hammer",
    sub="Sors Shield",
    range="Dunna",
    head={ name="Merlinic Hood", augments={'"Fast Cast"+7','MND+10','Mag. Acc.+6','"Mag.Atk.Bns."+4',}},
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+7','MND+9','Mag. Acc.+4',}},
    hands="Bagua Mitaines +1",
    legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+7','INT+9','Mag. Acc.+5','"Mag.Atk.Bns."+1',}},
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+7','CHR+7',}},
    neck="Mizu. Kubikazari",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

    -- Impact must be equipped in precast because Crepuscular Cloak grants access to the spell.
    sets.precast.Impact = {
    main="C. Palug Hammer",
    sub="Sors Shield",
    range="Dunna",
    head=empty,
    body="Crepuscular Cloak",
    hands="Bagua Mitaines +1",
    legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+7','INT+9','Mag. Acc.+5','"Mag.Atk.Bns."+1',}},
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+7','CHR+7',}},
    neck="Mizu. Kubikazari",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

    -------------------------------------------------------------------------------------------------------------------
    -- Job Ability Sets
    -------------------------------------------------------------------------------------------------------------------

    sets.ja = {}

    sets.ja.Bolster = { body = "Bagua Tunic +1",
    }

    sets.ja['Blaze of Glory'] = {
    }

    sets.ja['Ecliptic Attrition'] = {
    }

    sets.ja['Life Cycle'] = { 	body = "Geomancy Tunic +3",
    }

    sets.ja['Full Circle'] = { head = "Azimuth Hood +3",
    }

    sets.ja['Radial Arcana'] = { 	feet = "Bagua Sandals +3",
    }

    sets.ja['Mending Halation'] = {
    }

    sets.ja['Collimated Fervor'] = {
    }

    sets.ja.Dematerialize = {
    }

    sets.ja.Entrust = {
    }

    sets.ja['Widened Compass'] = {
    }

    -------------------------------------------------------------------------------------------------------------------
    -- Weapon Skill Sets
    -------------------------------------------------------------------------------------------------------------------

    sets.ws = {}

    sets.ws.Default = {     ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back="Alabaster Mantle",
    }


    sets.ws['Black Halo'] = {     ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back="Alabaster Mantle",
    }

    -------------------------------------------------------------------------------------------------------------------
    -- Midcast Sets
    -------------------------------------------------------------------------------------------------------------------

    sets.midcast = {}

    sets.midcast.Cure = {     main="Daybreak",
    sub="Sors Shield",
    range="Dunna",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Bagua Charm +2",
    waist="Othila Sash",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Pet: "Regen"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.Curaga = {     main="Daybreak",
    sub="Sors Shield",
    range="Dunna",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Bagua Charm +2",
    waist="Othila Sash",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Pet: "Regen"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.Enhancing = {     main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+18','"Mag.Atk.Bns."+3','DMG:+6',}},
    sub="Ammurapi Shield",
    range="Dunna",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+7','INT+9','Mag. Acc.+5','"Mag.Atk.Bns."+1',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Pet: "Regen"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.Enfeebling = {
    }

    sets.midcast.Elemental = {     main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Shiva Ring +1",
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

    sets.midcast.MagicBurst = {     main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Shiva Ring +1",
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

    sets.midcast.Aspir = {     
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head={ name="Merlinic Hood", augments={'"Drain" and "Aspir" potency +10','DEX+6',}},
    body={ name="Merlinic Jubbah", augments={'"Drain" and "Aspir" potency +10','Mag. Acc.+14','"Mag.Atk.Bns."+11',}},
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Drain" and "Aspir" potency +11','CHR+10','"Mag.Atk.Bns."+9',}},
    legs={ name="Merlinic Shalwar", augments={'"Drain" and "Aspir" potency +11',}},
    feet="Agwu's Pigaches",
    neck="Hoxne Torque",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Evanescence Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
    }

    sets.midcast.Geomancy = {     main="Idris",
    sub="Genmei Shield",
    range="Dunna",
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Bagua Pants +3",
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+8',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Pet: "Regen"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.Indi = {     main="Idris",
    sub="Genmei Shield",
    range="Dunna",
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Bagua Pants +3",
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Malignance Earring",
    right_ear="Azimuth Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Pet: "Regen"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.Impact = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head=empty,
    body="Crepuscular Cloak",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Shiva Ring +1",
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

    sets.midcast.Stoneskin = {
    }

    sets.midcast.Aquaveil = {
    }

    sets.midcast.Refresh = {
    }

    -------------------------------------------------------------------------------------------------------------------
    -- Idle / Engaged / Utility Sets
    -------------------------------------------------------------------------------------------------------------------

    sets.idle = {     sub="Genmei Shield",
    range="Dunna",
    head="Null Masque",
    body="Shamash Robe",
    hands="Azimuth Gloves +3",
    legs="Nyame Flanchard",
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Warp Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Pet: "Regen"+10','Phys. dmg. taken-10%',}},
    }

    sets.idle.Luopan = {     sub="Genmei Shield",
    range="Dunna",
    head="Azimuth Hood +3",
    body="Shamash Robe",
    hands="Geo. Mitaines +3",
    legs="Nyame Flanchard",
    feet="Bagua Sandals +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Pet: "Regen"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged = {     main="Tishtrya",
    sub="Genmei Shield",
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
    }

    sets.defense = {
    }

    sets.buff = {}

    sets.buff.Doom = {
    }

    sets.TreasureHunter = {
    }

end

-------------------------------------------------------------------------------------------------------------------
-- Precast
-------------------------------------------------------------------------------------------------------------------

function precast(spell)

    if spell.action_type == 'Magic' then
        if spell.english == 'Impact' then
            equip(sets.precast.Impact)
            return
        else
            equip(sets.precast.FC)
            return
        end
    end

    if spell.type == 'WeaponSkill' then
        if sets.ws[spell.english] then
            equip(sets.ws[spell.english])
        else
            equip(sets.ws.Default)
        end
        return
    end

    if spell.type == 'JobAbility' then
        if sets.ja[spell.english] then
            equip(sets.ja[spell.english])
        end
        return
    end

end

-------------------------------------------------------------------------------------------------------------------
-- Midcast
-------------------------------------------------------------------------------------------------------------------

function midcast(spell)

    if spell.english == 'Impact' then
        equip(sets.midcast.Impact)
        return
    end

    if spell.skill == 'Geomancy' then
        if string.find(spell.english, 'Indi%-') then
            equip(sets.midcast.Indi)
        else
            equip(sets.midcast.Geomancy)
        end
        return
    end

    if spell.skill == 'Healing Magic' then
        if string.find(spell.english, 'Curaga') or string.find(spell.english, 'Cura') then
            equip(sets.midcast.Curaga)
        elseif string.find(spell.english, 'Cure') then
            equip(sets.midcast.Cure)
        end
        return
    end

    if spell.skill == 'Enhancing Magic' then
        if spell.english == 'Stoneskin' then
            equip(sets.midcast.Stoneskin)
        elseif spell.english == 'Aquaveil' then
            equip(sets.midcast.Aquaveil)
        elseif spell.english == 'Refresh' or spell.english == 'Refresh II' or spell.english == 'Refresh III' then
            equip(sets.midcast.Refresh)
        else
            equip(sets.midcast.Enhancing)
        end
        return
    end

    if spell.skill == 'Enfeebling Magic' then
        equip(sets.midcast.Enfeebling)
        return
    end

    if spell.skill == 'Elemental Magic' then
        if spell.english == 'Aspir' or spell.english == 'Aspir II' or spell.english == 'Aspir III'
        or spell.english == 'Drain' or spell.english == 'Drain II' or spell.english == 'Drain III' then
            equip(sets.midcast.Aspir)
        elseif MagicBurstMode then
            equip(sets.midcast.MagicBurst)
        else
            equip(sets.midcast.Elemental)
        end
        return
    end

    if spell.skill == 'Dark Magic' then
        if spell.english == 'Aspir' or spell.english == 'Aspir II' or spell.english == 'Aspir III'
        or spell.english == 'Drain' or spell.english == 'Drain II' or spell.english == 'Drain III' then
            equip(sets.midcast.Aspir)
        end
        return
    end

end

-------------------------------------------------------------------------------------------------------------------
-- Aftercast / Status / Pet Handling
-------------------------------------------------------------------------------------------------------------------

function aftercast(spell)
    idle_check()
end

function status_change(new, old)
    idle_check()
end

function pet_change(pet, gain)
    idle_check()
end

function buff_change(buff, gain)
    if buff == 'doom' then
        if gain then
            equip(sets.buff.Doom)
            add_to_chat(123, 'Doom detected: equipping Doom set.')
        else
            add_to_chat(123, 'Doom removed.')
            idle_check()
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Idle Logic
-------------------------------------------------------------------------------------------------------------------

function idle_check()

    if buffactive['doom'] then
        equip(sets.buff.Doom)
        return
    end

    if DefenseMode then
        equip(sets.defense)
        return
    end

    if player.status == 'Engaged' then
        equip(sets.engaged)
        return
    end

    if pet.isvalid then
        equip(sets.idle.Luopan)
    else
        equip(sets.idle)
    end

end

-------------------------------------------------------------------------------------------------------------------
-- Self Commands / Toggles
-------------------------------------------------------------------------------------------------------------------

function self_command(command)

    if command == 'toggle DefenseMode' then
        DefenseMode = not DefenseMode
        if DefenseMode then
            add_to_chat(122, 'Defense Mode: ON')
        else
            add_to_chat(122, 'Defense Mode: OFF')
        end
        idle_check()
        return
    end

    if command == 'toggle MagicBurstMode' then
        MagicBurstMode = not MagicBurstMode
        if MagicBurstMode then
            add_to_chat(122, 'Magic Burst Mode: ON')
        else
            add_to_chat(122, 'Magic Burst Mode: OFF')
        end
        return
    end

end

-------------------------------------------------------------------------------------------------------------------
-- Cleanup
-------------------------------------------------------------------------------------------------------------------

function file_unload()
    send_command('unbind numpad5')
    send_command('unbind numpad7')
end
