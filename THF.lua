-- ███╗   ███╗██╗██╗  ██╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗████████╗
-- ████╗ ████║██║██║ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
-- ██╔████╔██║██║█████╔╝ █████╗     ██║   ██████╔╝██║   ██║██║   ██║   ██║
-- ██║╚██╔╝██║██║██╔═██╗ ██╔══╝     ██║   ██╔══██╗██║   ██║██║   ██║   ██║
-- ██║ ╚═╝ ██║██║██║  ██╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╔╝   ██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝



--[[
    THF.lua
    Simple Thief GearSwap
    NumPad 1 toggles between Regular and Crit engaged modes.
--]]

function get_sets()
    mote_include_version = 2

    -- Current engaged mode.
    crit_mode = false

    -- NumPad 1: Toggle Regular / Crit mode.
    send_command('bind numpad1 gs c toggle_crit')

    -----------------------------------------------------------------------
    -- IDLE SET
    -----------------------------------------------------------------------
    sets.idle = {
    ammo="Aurgelmir Orb",
    head="Null Masque",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Elite Royal Collar",
    waist="Null Belt",
    left_ear="Telos Earring",
    right_ear={ name="Skulk. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Store TP"+4',}},
    left_ring="Shneddick Ring",
    right_ring="Warp Ring",
    back="Null Shawl",
    }

    -----------------------------------------------------------------------
    -- ENGAGED SETS
    -----------------------------------------------------------------------
    sets.engaged = {}

    -- Add your normal TP gear here.
    sets.engaged.Regular = {
    ammo="Aurgelmir Orb",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Null Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Store TP"+4',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
    }

    -- Critical-hit mode supplied by Miketrout.
    sets.engaged.Crit = {
        main="Voluspa Knife",
        sub="Gleti's Knife",
        ammo="Yamarang",
        head="Mummu Bonnet +2",
        body="Mummu Jacket +2",
        hands="Mummu Wrists +2",
        legs="Mummu Kecks +2",
        feet="Mummu Gamash. +2",
        neck="Nefarious Collar",
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear={
            name="Skulk. Earring +1",
            augments={
                'System: 1 ID: 1676 Val: 0',
                'Accuracy+12',
                'Mag. Acc.+12',
                '"Store TP"+4',
            },
        },
        left_ring="Mummu Ring",
        right_ring="Shneddick Ring",
        back="Null Shawl",
    }

    -----------------------------------------------------------------------
    -- FAST CAST
    -----------------------------------------------------------------------
    sets.precast = {}
    sets.precast.FC = {
        -- Add Fast Cast gear here.
    }

    -----------------------------------------------------------------------
    -- JOB ABILITIES
    -----------------------------------------------------------------------
    sets.precast.JA = {}

    sets.precast.JA['Sneak Attack'] = {
        -- Add Sneak Attack gear here.
    }

    sets.precast.JA['Trick Attack'] = {
        -- Add Trick Attack gear here.
    }

    sets.precast.JA['Steal'] = {
        -- Add Steal gear here.
    }

    sets.precast.JA['Despoil'] = {
        -- Add Despoil gear here.
    }

    sets.precast.JA['Mug'] = {
        -- Add Mug gear here.
    }

    sets.precast.JA['Feint'] = {
        -- Add Feint gear here.
    }

    sets.precast.JA['Flee'] = {
        -- Add Flee gear here.
    }

    sets.precast.JA['Hide'] = {
        -- Add Hide gear here.
    }

    sets.precast.JA['Collaborator'] = {
        -- Add Collaborator gear here.
    }

    sets.precast.JA['Accomplice'] = {
        -- Add Accomplice gear here.
    }

    -----------------------------------------------------------------------
    -- WEAPONSKILL SETS
    -----------------------------------------------------------------------
    sets.precast.WS = {
        -- Add your default weaponskill gear here.
    }

    sets.precast.WS['Rudra\'s Storm'] = {
        -- Add Rudra's Storm gear here.
    }

    sets.precast.WS['Evisceration'] = {
        -- Add Evisceration gear here.
    }

    sets.precast.WS['Savage Blade'] = {
        -- Add Savage Blade gear here.
    }

    sets.precast.WS['Aeolian Edge'] = {
        -- Add Aeolian Edge gear here.
    }

    -----------------------------------------------------------------------
    -- MIDCAST SETS
    -----------------------------------------------------------------------
    sets.midcast = {}

    sets.midcast.SpellInterrupt = {
        -- Add spell interruption reduction gear here if desired.
    }

    -----------------------------------------------------------------------
    -- OPTIONAL STARTUP SETTINGS
    -----------------------------------------------------------------------
    -- Uncomment and change these if desired.
    -- send_command('input /macro book 1; wait 1; input /macro set 1')
    -- send_command('wait 2; input /lockstyleset 1')

    windower.add_to_chat(122, 'THF.lua loaded. Engaged Mode: Regular')
end


function precast(spell)
    -- Job abilities.
    if spell.type == 'JobAbility' then
        if sets.precast.JA[spell.english] then
            equip(sets.precast.JA[spell.english])
        end
        return
    end

    -- Weaponskills.
    if spell.type == 'WeaponSkill' then
        if sets.precast.WS[spell.english] then
            equip(sets.precast.WS[spell.english])
        else
            equip(sets.precast.WS)
        end
        return
    end

    -- Magic.
    if spell.action_type == 'Magic' then
        equip(sets.precast.FC)
    end
end


function midcast(spell)
    if spell.action_type == 'Magic' then
        equip(sets.midcast.SpellInterrupt)
    end
end


function aftercast(spell)
    if player.status == 'Engaged' then
        equip_engaged_set()
    else
        equip(sets.idle)
    end
end


function status_change(new_status, old_status)
    if new_status == 'Engaged' then
        equip_engaged_set()
    else
        equip(sets.idle)
    end
end


function self_command(command)
    command = command:lower()

    if command == 'toggle_crit' then
        crit_mode = not crit_mode

        if crit_mode then
            windower.add_to_chat(158, 'Engaged Mode: CRIT')
        else
            windower.add_to_chat(122, 'Engaged Mode: REGULAR')
        end

        if player.status == 'Engaged' then
            equip_engaged_set()
        end
    end
end


function equip_engaged_set()
    if crit_mode then
        equip(sets.engaged.Crit)
    else
        equip(sets.engaged.Regular)
    end
end


function file_unload()
    send_command('unbind numpad1')
end
