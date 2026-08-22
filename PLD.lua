-- ███╗   ███╗██╗██╗  ██╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗████████╗
-- ████╗ ████║██║██║ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
-- ██╔████╔██║██║█████╔╝ █████╗     ██║   ██████╔╝██║   ██║██║   ██║   ██║
-- ██║╚██╔╝██║██║██╔═██╗ ██╔══╝     ██║   ██╔══██╗██║   ██║██║   ██║   ██║
-- ██║ ╚═╝ ██║██║██║  ██╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╔╝   ██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝



--[[
    PLD.lua - Simple Paladin GearSwap
    Built as a clean, easy-to-edit template.

    Keybinds:
      NumPad 1: Cycle weapon modes (Burtgang / Naegling / Excalibur)
      NumPad 2: Toggle TP / Defense armor mode
      NumPad 3: Toggle DPS mode
      NumPad 4: Toggle Magic DEF mode
      NumPad 5: Toggle Duban / Aegis
      NumPad 7: Toggle Phalanx gear mode
      NumPad 9: Toggle Auto Majesty on / off
      NumPad 0: Reset all modes

    Edit the gear inside init_gear_sets().
    Startup settings are near the top of user_setup().
]]

local res = require('resources')

function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end

function job_setup()
    state.WeaponMode = M{['description']='Weapon Mode',
        'Burtgang',
        'Naegling',
        'Excalibur'
    }

    state.ArmorMode = M{['description']='Armor Mode',
        'TP',
        'Defense'
    }

    state.DPSMode = M{['description']='DPS Mode',
        'Off',
        'On'
    }

    state.ShieldMode = M{['description']='Shield Mode',
        'Duban',
        'Aegis'
    }

    state.MagicDefMode = M{['description']='Magic DEF Mode',
        'Off',
        'On'
    }

    state.PhalanxGearMode = M{['description']='Phalanx Gear Mode',
        'Off',
        'On'
    }

    state.AutoMode = M{['description']='Automation Mode',
        'Off',
        'Majesty'
    }

    phalanx_spells = S{'Phalanx', 'Phalanx II'}
    auto_check_scheduled = false
end

function user_setup()
    -- Change these values to your preferred PLD macro book/page and lockstyle.
    send_command('wait 2; input /macro book 2; wait 1; input /macro set 7')
    send_command('wait 3; input /lockstyleset 5')

    send_command('bind numpad1 gs c cycle WeaponMode')
    send_command('bind numpad2 gs c cycle ArmorMode')
    send_command('bind numpad3 gs c cycle DPSMode')
    send_command('bind numpad4 gs c cycle MagicDefMode')
    send_command('bind numpad5 gs c cycle ShieldMode')
    send_command('bind numpad7 gs c cycle PhalanxGearMode')
    send_command('bind numpad9 gs c cycle AutoMode')
    send_command('bind numpad0 gs c reset_modes')

    select_default_macro_book()
end

function user_unload()
    send_command('unbind numpad1')
    send_command('unbind numpad2')
    send_command('unbind numpad3')
    send_command('unbind numpad4')
    send_command('unbind numpad5')
    send_command('unbind numpad7')
    send_command('unbind numpad9')
    send_command('unbind numpad0')
end

function init_gear_sets()

    -------------------------------------------------------------------------
    -- WEAPON SETS
    -------------------------------------------------------------------------

    sets.weapons = {}

    sets.weapons.Burtgang = {
        main="Burtgang",
    }

    sets.weapons.Naegling = {
        main="Naegling",
    }

    sets.weapons.Excalibur = {
        main="Excalibur",
    }

    sets.shields = {
        Duban = { sub="Duban" },
        Aegis = { sub="Aegis" },
    }
    -------------------------------------------------------------------------
    -- PRECAST
    -------------------------------------------------------------------------

    sets.precast.FC = {
    ammo="Impatiens",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Sacro Breastplate",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs="Enif Cosciales",
    feet="Chev. Sabatons +3",
    neck="Moonlight Necklace",
    waist="Plat. Mog. Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        right_ear="Mendi. Earring",
    })
    sets.precast.JA = {}

    sets.precast.JA['Invincible'] = {
        legs="Cab. Breeches +3",
    }

    sets.precast.JA['Holy Circle'] = {
        feet="Rev. Leggings +3",
    }

    sets.precast.JA['Shield Bash'] = {
        hands="Cab. Gauntlets +3",
        left_ear="Knightly Earring",
        right_ear="Friomisi Earring",
    }

    sets.precast.JA['Sentinel'] = {
        feet="Cab. Leggings +3",
    }

    sets.precast.JA['Cover'] = {
        head="Rev. Coronet +3",
        body="Cab. Surcoat +3",
    }

    sets.precast.JA['Rampart'] = {
        head="Cab. Coronet +3",
    }

    sets.precast.JA['Fealty'] = {
        body="Cab. Surcoat +3",
    }

    sets.precast.JA['Chivalry'] = {
        hands="Cab. Gauntlets +3",
    }

    sets.precast.JA['Divine Emblem'] = {
        feet="Chev. Sabatons +3",
    }

    sets.precast.JA['Intervene'] = {
        -- Add Intervene gear here.
    }

    -------------------------------------------------------------------------
    -- WEAPON SKILLS
    -------------------------------------------------------------------------

    sets.precast.WS = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Telos Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back="Alabaster Mantle",
    }

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
    ammo="Aurgelmir Orb",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Crep. Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back="Alabaster Mantle",
    })

    sets.precast.WS['Atonement'] = {
        ammo="Oshasha's Treatise",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Moonlight Necklace",
        waist="Fotia Belt",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Eihwaz Ring",
        right_ring="Vexer Ring +1",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
        neck="Fotia Gorget",
        waist="Fotia Belt",
    })

    -------------------------------------------------------------------------
    -- MIDCAST
    -------------------------------------------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Enmity = {
    ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Moonlight Necklace",
    waist="Plat. Mog. Belt",
    left_ear="Friomisi Earring",
    right_ear="Alabaster Earring",
    left_ring="Eihwaz Ring",
    right_ring="Stikini Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }

    sets.midcast.Flash = sets.midcast.Enmity

    sets.midcast.Cure = {
    ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Chev. Cuirass +3",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+5','Attack+2',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Moonlight Necklace",
    waist="Plat. Mog. Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Knightly Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.EnhancingMagic = {
        ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",
        body="Shab. Cuirass +1",
        hands="Regal Gauntlets",
        legs="Carmine Cuisses +1",
        feet="Odyssean Greaves",
        neck="Incanter's Torque",
        waist="Olympus Sash",
        left_ear="Andoaa Earring",
        right_ear="Mimir Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",
    }

    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingMagic, {
    main="Sakpata's Sword",
    sub="Priwen",
    ammo="Impatiens",
    head={ name="Yorium Barbuta", augments={'Phalanx +3',}},
    body={ name="Yorium Cuirass", augments={'Phalanx +3',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs="Sakpata's Cuisses",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Hoxne Torque",
    waist="Hachirin-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    })

    sets.midcast.Reprisal = set_combine(sets.midcast.EnhancingMagic, {
        body="Shab. Cuirass +1",
    })


    -- Blue Magic SIRD set. Used for Sheep Song and all other Blue Magic.
    -- Replace any pieces below with your preferred Spell Interruption Rate Down gear.
    sets.midcast.SIRD = {
    ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Chev. Cuirass +3",
    hands={ name="Yorium Gauntlets", augments={'Spell interruption rate down -10%',}},
    legs={ name="Founder's Hose", augments={'MND+5','Attack+2',}},
    feet={ name="Yorium Sabatons", augments={'Spell interruption rate down -10%',}},
    neck="Moonlight Necklace",
    waist="Hachirin-no-Obi",
    left_ear="Knightly Earring",
    right_ear="Alabaster Earring",
    left_ring="Murky Ring",
    right_ring="Evanescence Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }

    sets.midcast.EnfeeblingMagic = {
        ammo="Pemphredo Tathlum",
        head="Carmine Mask +1",
        body="Rev. Surcoat +3",
        hands="Regal Gauntlets",
        legs="Carmine Cuisses +1",
        feet="Odyssean Greaves",
        neck="Incanter's Torque",
        waist="Luminary Sash",
        left_ear="Digni. Earring",
        right_ear="Crep. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape",
    }
    -------------------------------------------------------------------------
    -- IDLE / ENGAGED
    -------------------------------------------------------------------------

    sets.idle = {
    ammo="Staunch Tathlum",
    head="Chev. Armet +3",
    body="Chev. Cuirass +3",
    hands="Chev. Gauntlets +2",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Alabaster Earring",
left_ring  = {name="Moonlight Ring", bag="wardrobe1"},
    right_ring="Shneddick Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }

    sets.engaged = {
    ammo="Staunch Tathlum",
    head="Chev. Armet +3",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Chev. Cuisses +3",
    feet="Sakpata's Leggings",
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Alabaster Earring",
    left_ring="Murky Ring",
    right_ring="Shadow Ring",
    back="Shadow Mantle",
    }

    sets.engaged.Defense = {
    ammo="Staunch Tathlum",
    head="Chev. Armet +3",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Chev. Cuisses +3",
    feet="Sakpata's Leggings",
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Alabaster Earring",
    left_ring="Murky Ring",
    right_ring="Shadow Ring",
    back="Shadow Mantle",
    }

    -- NumPad 4 toggles this full Magic DEF set on and off.
    sets.engaged.MagicDef = {
        main="Burtgang",
        sub="Aegis",
        ammo="Vanir Battery",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Coatl Gorget +1",
        waist="Null Belt",
        left_ear="Odnowa Earring +1",
        right_ear="Alabaster Earring",
        left_ring="Shadow Ring",
        right_ring="Vexer Ring +1",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }

    -- NumPad 3 toggles this full DPS set on and off.
    sets.engaged.DPS = {
        main="Naegling",
        sub="Blurred Shield +1",
        ammo="Coiste Bodhar",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Null Loop",
        waist="Sailfi Belt +1",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Moonlight Ring",
        back="Null Shawl",
    }
end

function job_precast(spell, action, spellMap, eventArgs)
    -- Automatically use Divine Emblem before Flash when the ability is ready.
    -- The repeated Flash command will pass through normally once Divine Emblem is active.
    if spell.english == 'Flash' and not buffactive['Divine Emblem'] then
        local remaining = ability_recast_remaining('Divine Emblem')
        if remaining == 0 then
            local target = (spell.target and spell.target.raw) or '<t>'
            cancel_spell()
            send_command('input /ja "Divine Emblem" <me>; wait 1; input /ma "Flash" '..target)
            return
        end
    end

    if spell.skill == 'Blue Magic' then
        equip(sets.precast.FC)
    elseif spell.action_type == 'Magic' and spell.skill == 'Healing Magic' then
        equip(sets.precast.FC.Cure)
    end
end

function job_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Blue Magic' then
        equip(sets.midcast.SIRD)
    elseif phalanx_spells:contains(spell.english) then
        equip(sets.midcast.Phalanx)
    elseif spell.english == 'Reprisal' then
        equip(sets.midcast.Reprisal)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingMagic)
    elseif spell.skill == 'Enfeebling Magic' then
        equip(sets.midcast.EnfeeblingMagic)
    elseif spell.english == 'Flash' then
        equip(sets.midcast.Flash)
    elseif spell.skill == 'Healing Magic' then
        equip(sets.midcast.Cure)
    end
end


-- =========================================================================
-- AUTO MAJESTY
-- NumPad 9 toggles Auto Majesty: Off <-> On
-- =========================================================================

function auto_uses_majesty()
    return state.AutoMode.value == 'Majesty'
end

function ability_recast_remaining(ability_name)
    local ability = res.job_abilities:with('en', ability_name)
    if not ability or ability.recast_id == nil then
        return 999
    end

    local recasts = windower.ffxi.get_ability_recasts()
    return recasts[ability.recast_id] or 0
end

function schedule_auto_check(delay)
    if state.AutoMode.value == 'Off' or auto_check_scheduled then
        return
    end

    auto_check_scheduled = true
    send_command('wait '..tostring(delay or 3)..'; gs c auto_check')
end

function run_automation()
    if state.AutoMode.value == 'Off'
    or player.main_job ~= 'PLD'
    or player.status == 'Resting'
    or midaction() then
        if state.AutoMode.value ~= 'Off' then
            schedule_auto_check(3)
        end
        return
    end

    if auto_uses_majesty() and not buffactive['Majesty'] then
        local remaining = ability_recast_remaining('Majesty')
        if remaining == 0 then
            send_command('input /ja "Majesty" <me>')
            schedule_auto_check(4)
        else
            schedule_auto_check(math.max(3, math.min(remaining + 1, 15)))
        end
        return
    end

    -- Recheck periodically so dispels and missed buff-change events are caught.
    schedule_auto_check(10)
end

function job_aftercast(spell, action, spellMap, eventArgs)
    equip_current_mode()
    schedule_auto_check(2)
end

function job_buff_change(buff, gain)
    if buff == 'Majesty' and not gain then
        schedule_auto_check(2)
    end
end

function job_status_change(newStatus, oldStatus, eventArgs)
    equip_current_mode()
    schedule_auto_check(2)
end

function customize_idle_set(idleSet)
    if state.PhalanxGearMode.value == 'On' then
        return sets.midcast.Phalanx
    elseif state.MagicDefMode.value == 'On' then
        return sets.engaged.MagicDef
    elseif state.DPSMode.value == 'On' then
        return set_combine(sets.engaged.DPS, sets.shields[state.ShieldMode.value])
    elseif state.ArmorMode.value == 'Defense' then
        return set_combine(sets.engaged.Defense, sets.weapons[state.WeaponMode.value], sets.shields[state.ShieldMode.value])
    end

    return set_combine(idleSet, sets.weapons[state.WeaponMode.value], sets.shields[state.ShieldMode.value])
end

function customize_melee_set(meleeSet)
    if state.PhalanxGearMode.value == 'On' then
        return sets.midcast.Phalanx
    elseif state.MagicDefMode.value == 'On' then
        return sets.engaged.MagicDef
    elseif state.DPSMode.value == 'On' then
        return set_combine(sets.engaged.DPS, sets.shields[state.ShieldMode.value])
    end

    local selectedSet = meleeSet

    if state.ArmorMode.value == 'Defense' then
        selectedSet = sets.engaged.Defense
    end

    return set_combine(selectedSet, sets.weapons[state.WeaponMode.value], sets.shields[state.ShieldMode.value])
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Weapon Mode' then
        add_to_chat(122, 'Weapon Mode: '..newValue)
        equip_current_mode()
    elseif stateField == 'Armor Mode' then
        add_to_chat(122, 'Armor Mode: '..newValue)
        equip_current_mode()
    elseif stateField == 'DPS Mode' then
        add_to_chat(122, 'DPS Mode: '..newValue)
        equip_current_mode()
    elseif stateField == 'Shield Mode' then
        add_to_chat(122, 'Shield Mode: '..newValue)
        equip_current_mode()
    elseif stateField == 'Magic DEF Mode' then
        if newValue == 'On' then
            if state.PhalanxGearMode.value == 'On' then
                state.PhalanxGearMode:set('Off')
            end
            add_to_chat(122, 'Magic DEF Mode: ON')
        else
            add_to_chat(122, 'Magic DEF Mode: OFF')
        end
        equip_current_mode()
    elseif stateField == 'Phalanx Gear Mode' then
        if newValue == 'On' then
            if state.MagicDefMode.value == 'On' then
                state.MagicDefMode:set('Off')
            end
            add_to_chat(122, 'Phalanx Gear Mode: ON')
        else
            add_to_chat(122, 'Phalanx Gear Mode: OFF')
        end
        equip_current_mode()
    elseif stateField == 'Automation Mode' then
        if newValue == 'Majesty' then
            add_to_chat(122, 'Auto Majesty: ON')
        else
            add_to_chat(122, 'Auto Majesty: OFF')
        end
        auto_check_scheduled = false
        schedule_auto_check(1)
    end
end

function job_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'auto_check' then
        auto_check_scheduled = false
        run_automation()
        eventArgs.handled = true
    elseif cmdParams[1] == 'reset_modes' then
        state.WeaponMode:set('Burtgang')
        state.ArmorMode:set('TP')
        state.DPSMode:set('Off')
        state.ShieldMode:set('Duban')
        state.MagicDefMode:set('Off')
        state.PhalanxGearMode:set('Off')
        state.AutoMode:set('Off')
        auto_check_scheduled = false
        add_to_chat(122, 'PLD modes reset: Burtgang / TP / DPS Off / Duban / Magic DEF Off / Phalanx Gear Off / Auto Majesty Off')
        equip_current_mode()
        eventArgs.handled = true
    end
end

function equip_current_mode()
    if state.PhalanxGearMode.value == 'On' then
        equip(sets.midcast.Phalanx)
    elseif state.MagicDefMode.value == 'On' then
        equip(sets.engaged.MagicDef)
    elseif state.DPSMode.value == 'On' then
        equip(set_combine(sets.engaged.DPS, sets.shields[state.ShieldMode.value]))
    elseif player.status == 'Engaged' then
        if state.ArmorMode.value == 'Defense' then
            equip(set_combine(sets.engaged.Defense, sets.weapons[state.WeaponMode.value], sets.shields[state.ShieldMode.value]))
        else
            equip(set_combine(sets.engaged, sets.weapons[state.WeaponMode.value], sets.shields[state.ShieldMode.value]))
        end
    else
        if state.ArmorMode.value == 'Defense' then
            equip(set_combine(sets.engaged.Defense, sets.weapons[state.WeaponMode.value], sets.shields[state.ShieldMode.value]))
        else
            equip(set_combine(sets.idle, sets.weapons[state.WeaponMode.value], sets.shields[state.ShieldMode.value]))
        end
    end
end

function select_default_macro_book()
    -- Macro book/page and lockstyle are set in user_setup().
end
