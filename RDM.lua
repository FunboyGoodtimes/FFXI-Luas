-- ███╗   ███╗██╗██╗  ██╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗████████╗
-- ████╗ ████║██║██║ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
-- ██╔████╔██║██║█████╔╝ █████╗     ██║   ██████╔╝██║   ██║██║   ██║   ██║
-- ██║╚██╔╝██║██║██╔═██╗ ██╔══╝     ██║   ██╔══██╗██║   ██║██║   ██║   ██║
-- ██║ ╚═╝ ██║██║██║  ██╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╔╝   ██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝




--============================================================
-- RDM.lua - Simple Red Mage GearSwap
-- Built from user-provided gear sets
--============================================================

function get_sets()

    --========================================================
    -- WEAPON CYCLING / LOCK
    --========================================================
    main_weapons = {"Naegling", "Maxentius"}
    sub_weapons = {"Machaera +2", "Sakpata's Sword"}

    main_weapon_index = 1
    sub_weapon_index = 1
    weapon_lock = false

    send_command('bind numpad1 gs c cyclemain')
    send_command('bind numpad2 gs c cyclesub')
    send_command('bind numpad3 gs c weaponlock')

    --========================================================
    -- IDLE
    --========================================================
    sets.idle = {
        main="Naegling",
        sub="Bunzi's Rod",
        ammo="Staunch Tathlum",
        head="Null Masque",
        body="Shamash Robe",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Elite Royal Collar",
        waist="Fucho-no-Obi",
        left_ear="Alabaster Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Stikini Ring +1",
        right_ring="Shneddick Ring",
        back="Null Shawl",
    }

    --========================================================
    -- ENGAGED / TP
    --========================================================
    sets.engaged = {
        main="Naegling",
        sub="Bunzi's Rod",
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Anu Torque",
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear="Cessance Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring",
        back="Null Shawl",
    }

    --========================================================
    -- FAST CAST / PRECAST
    --========================================================
    sets.precast = {}
    sets.precast.FC = {
        main="Naegling",
        sub="Bunzi's Rod",
        ammo="Impatiens",
        head={ name="Merlinic Hood", augments={'"Fast Cast"+7','MND+10','Mag. Acc.+6','"Mag.Atk.Bns."+4',}},
        body={ name="Merlinic Jubbah", augments={'"Fast Cast"+7','MND+9','Mag. Acc.+4',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
        legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+7','INT+9','Mag. Acc.+5','"Mag.Atk.Bns."+1',}},
        feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+7','CHR+7',}},
        neck="Null Loop",
        waist="Embla Sash",
        left_ear="Malignance Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Kishar Ring",
        right_ring="Naji's Loop",
        back="Perimede Cape",
    }

    --========================================================
    -- MAGIC ACCURACY / ENFEEBLING / DEBUFFS
    --========================================================
    sets.midcast = {}
    sets.midcast.MAcc = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Impatiens",
        head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Hoxne Torque",
        waist="Null Belt",
        left_ear="Crep. Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    }

    --========================================================
    -- ELEMENTAL MAGIC / NUKES
    --========================================================
    sets.midcast.Nuke = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head="Ea Hat",
        body="Shamash Robe",
        hands="Ea Cuffs",
        legs="Ea Slops",
        feet="Ea Pigaches",
        neck="Hoxne Torque",
        waist="Sacro Cord",
        left_ear="Friomisi Earring",
        right_ear="Malignance Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Null Shawl",
    }

    --========================================================
    -- HEALING MAGIC
    --========================================================
    sets.midcast.Healing = {
        main="Daybreak",
        sub="Sors Shield",
        ammo="Impatiens",
        head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
        body="Bunzi's Robe",
        hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
        feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
        neck="Nodens Gorget",
        waist="Sacro Cord",
        left_ear="Roundel Earring",
        right_ear="Mendi. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Perimede Cape",
    }

    --========================================================
    -- ENHANCING MAGIC DURATION
    --========================================================
    sets.midcast.Enhancing = {
        main="Naegling",
        sub="Ammurapi Shield",
        ammo="Impatiens",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
        body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
        feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
        neck="Hoxne Torque",
        waist="Embla Sash",
        left_ear="Regal Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Perimede Cape",
    }

    --========================================================
    -- WEAPONSKILLS
    --========================================================
    sets.precast.WS = {}
    sets.precast.WS['Savage Blade'] = {
        ammo="Aurgelmir Orb",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Sherida Earring",
        left_ring="Ephramad's Ring",
        right_ring="Epaminondas's Ring",
        back="Alabaster Mantle",
    }

    -- Equip the correct starting set when the Lua loads.
    if player.status == 'Engaged' then
        equip(sets.engaged)
    else
        equip(sets.idle)
    end
end

--============================================================
-- PRECAST
--============================================================
function precast(spell)
    if spell.type == 'WeaponSkill' then
        if sets.precast.WS[spell.english] then
            equip(sets.precast.WS[spell.english])
        end
        return
    end

    -- Fast Cast for all magic spells.
    if spell.action_type == 'Magic' then
        equip(sets.precast.FC)
    end
end

--============================================================
-- MIDCAST
--============================================================
function midcast(spell)
    -- Nukes
    if spell.skill == 'Elemental Magic' then
        equip(sets.midcast.Nuke)

    -- Healing spells including Cure / Curaga style magic
    elseif spell.skill == 'Healing Magic' then
        equip(sets.midcast.Healing)

    -- Enhancing duration set
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.Enhancing)

    -- RDM enfeebles / debuffs
    elseif spell.skill == 'Enfeebling Magic' then
        equip(sets.midcast.MAcc)

    -- Dark Magic debuffs such as Bio also use the M.Acc set
    elseif spell.skill == 'Dark Magic' then
        equip(sets.midcast.MAcc)
    end
end

--============================================================
-- AFTERCAST / STATUS
--============================================================
function aftercast(spell)
    equip_current_set()
end

function status_change(new, old)
    equip_current_set()
end

function equip_current_set()
    if player.status == 'Engaged' then
        equip(sets.engaged)
    else
        equip(sets.idle)
    end

    -- Always return to the currently selected melee weapons.
    equip_selected_weapons()
end

--============================================================
-- SELECTED WEAPONS
--============================================================
function equip_selected_weapons()
    -- If weapon lock is active, leave the currently equipped
    -- main/sub weapons completely untouched.
    if weapon_lock then
        return
    end

    equip({
        main=main_weapons[main_weapon_index],
        sub=sub_weapons[sub_weapon_index]
    })
end

--============================================================
-- NUMPAD COMMANDS
-- NumPad 1 = Main: Naegling <-> Maxentius
-- NumPad 2 = Sub:  Machaera +2 <-> Sakpata's Sword
-- NumPad 3 = Lock/unlock whatever weapons are currently equipped
--============================================================
function self_command(command)
    if command == 'cyclemain' then
        if weapon_lock then
            add_to_chat(123, 'Weapon Lock is ON - unlock with NumPad 3 first')
            return
        end

        main_weapon_index = main_weapon_index + 1
        if main_weapon_index > #main_weapons then
            main_weapon_index = 1
        end

        equip_selected_weapons()
        add_to_chat(122, 'Main Hand: '..main_weapons[main_weapon_index])

    elseif command == 'cyclesub' then
        if weapon_lock then
            add_to_chat(123, 'Weapon Lock is ON - unlock with NumPad 3 first')
            return
        end

        sub_weapon_index = sub_weapon_index + 1
        if sub_weapon_index > #sub_weapons then
            sub_weapon_index = 1
        end

        equip_selected_weapons()
        add_to_chat(122, 'Off Hand: '..sub_weapons[sub_weapon_index])

    elseif command == 'weaponlock' then
        weapon_lock = not weapon_lock

        if weapon_lock then
            -- Lock exactly whatever main/sub weapons are equipped right now.
            disable('main', 'sub')
            add_to_chat(158, 'Weapon Lock: ON - Current weapons locked')
        else
            enable('main', 'sub')
            equip_current_set()
            add_to_chat(123, 'Weapon Lock: OFF')
        end
    end
end

--============================================================
-- UNBIND KEYS WHEN LUA UNLOADS
--============================================================
function file_unload()
    send_command('unbind numpad1')
    send_command('unbind numpad2')
    send_command('unbind numpad3')
    enable('main', 'sub')
end
