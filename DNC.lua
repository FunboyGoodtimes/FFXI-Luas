-- ███╗   ███╗██╗██╗  ██╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗████████╗
-- ████╗ ████║██║██║ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
-- ██╔████╔██║██║█████╔╝ █████╗     ██║   ██████╔╝██║   ██║██║   ██║   ██║
-- ██║╚██╔╝██║██║██╔═██╗ ██╔══╝     ██║   ██╔══██╗██║   ██║██║   ██║   ██║
-- ██║ ╚═╝ ██║██║██║  ██╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╔╝   ██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝


--========================================================--
-- DNC.lua - Clean Dancer GearSwap Framework
--========================================================--
-- NumPad 1: Cycle main-hand weapons
-- NumPad 2: Cycle off-hand weapons
-- NumPad 3: Equip Karambit in the main-hand slot
-- NumPad 5: Toggle between TP and Defense engaged sets
--
-- Edit these startup values to match your preferred setup:
local macro_book = 6
local macro_page = 3
local lockstyle_set = 11
--========================================================--

function get_sets()
    mote_include_version = 2

    include('Mote-Include.lua')
end

function job_setup()
    state.ArmorMode = M{['description']='Armor Mode', 'TP', 'Defense'}
    state.MainWeapon = M{'Twashtar','Tauret','Aeneas','Karambit'}
    state.Offhand = M{'Crepuscular Knife','Fusetto +2'}

    -- Prevents Presto automation from repeatedly trying to fire.
    presto_automation_enabled = true
end

function user_setup()
    send_command('bind numpad1 gs c cycle MainWeapon')
    send_command('bind numpad2 gs c cycle Offhand')
    send_command('bind numpad3 gs c set MainWeapon Karambit')
    send_command('bind numpad5 gs c cycle ArmorMode')

    select_default_macro_book()
    send_command('wait 2; input /lockstyleset '..lockstyle_set)
end

function user_unload()
    send_command('unbind numpad1')
    send_command('unbind numpad2')
    send_command('unbind numpad3')
    send_command('unbind numpad5')
end

function init_gear_sets()

    --========================================================--
    -- PRECAST: FAST CAST
    --========================================================--
    sets.precast.FC = {
        -- Add Fast Cast gear here.
    }

    --========================================================--
    -- JOB ABILITIES
    --========================================================--

    -- No Foot Rise. Equips Horos Casaque before the ability activates.
    sets.precast.JA = {}
    sets.precast.JA['No Foot Rise'] = {
        body="Horos Casaque",
    }
 
    -- Jigs.
    sets.precast.Jig = {
    legs="Horos Tights +1",
    feet="Maxixi Toe Shoes +1",
    }
    -- General Waltz set.
    sets.precast.Waltz = {
    ammo="Yamarang",
    head="Etoile Tiara",
    body="Dancer's Casaque",
    hands="Nyame Gauntlets",
    legs="Dashing Subligar",
    feet="Nyame Sollerets",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Aristo Belt",
    left_ear="Roundel Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Carb. Ring +1",
    right_ring="Carb. Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- Healing Waltz set.
    sets.precast.Waltz['Healing Waltz'] = {
    ammo="Yamarang",
    head="Etoile Tiara",
    body="Dancer's Casaque",
    hands="Nyame Gauntlets",
    legs="Dashing Subligar",
    feet="Nyame Sollerets",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Aristo Belt",
    left_ear="Roundel Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Carb. Ring +1",
    right_ring="Carb. Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- Sambas.
    sets.precast.Samba = {
      back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- Steps.
    sets.precast.Step = {
    ammo="Yamarang",
    head="Maculele Tiara +3",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
    feet="Macu. Toe Shoes +1",
    }

    -- Flourishes: general set.
    sets.precast.Flourish = {
        -- Add general Flourish gear here.
    }

    -- Optional individual Flourish sets.
    sets.precast.Flourish['Animated Flourish'] = {
        -- Add Animated Flourish gear here.
    }

    sets.precast.Flourish['Desperate Flourish'] = {
        -- Add Desperate Flourish gear here.
    }

    sets.precast.Flourish['Reverse Flourish'] = {
    hands="Macu. Bangles +1",
    }

    sets.precast.Flourish['Building Flourish'] = {
        -- Add Building Flourish gear here.
    }

    sets.precast.Flourish['Climactic Flourish'] = {
    head="Maculele Tiara +3",
    }

    sets.precast.Flourish['Striking Flourish'] = {
    body="Macu. Casaque +1",
    }

    sets.precast.Flourish['Ternary Flourish'] = {
        -- Add Ternary Flourish gear here.
    }

    --========================================================--
    -- WEAPONSKILLS
    --========================================================--

    -- General weaponskill set.
    sets.precast.WS = {
    ammo="Oshasha's Treatise",
    head="Maculele Tiara +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS["Rudra's Storm"] = {
        ammo="Oshasha's Treatise",
    head="Maculele Tiara +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Mache Earring +1",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Evisceration'] = {
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
    }

    sets.precast.WS['Shark Bite'] = {
    ammo="Aurgelmir Orb",
    head={ name="Herculean Helm", augments={'Attack+18','Weapon skill damage +2%','DEX+10','Accuracy+1',}},
    body={ name="Herculean Vest", augments={'"Counter"+3','DEX+10','Accuracy+13','Attack+13',}},
    hands="Herculean Gloves",
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +3%','DEX+5','Accuracy+14',}},
    feet={ name="Herculean Boots", augments={'Weapon skill damage +3%','DEX+10','Accuracy+15','Attack+10',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Exenterator'] = {
    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Maculele Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+6','Mag. Acc.+6',}},
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Dancing Edge'] = {
        -- Add Dancing Edge gear here.
    }


    -- Climactic Flourish override set (used automatically while buff is active).
    sets.precast.WS.Climactic = {
        ammo="Oshasha's Treatise",
    head="Maculele Tiara +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Mache Earring +1",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    --========================================================--
    -- IDLE
    --========================================================--
    sets.idle = {
        ammo="Staunch Tathlum",
    head="Null Masque",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Elite Royal Collar",
    waist="Null Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Balder Earring",
    left_ring="Warp Ring",
    right_ring="Shneddick Ring",
    }

    --========================================================--
    -- ENGAGED
    --========================================================--

    -- Standard TP set.
    sets.engaged = {
       ammo="Aurgelmir Orb",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
    }

    -- Defense engaged set.
    sets.engaged.Defense = {
        -- Add defensive engaged gear here.
    }

end

--========================================================--
-- PRESTO AUTOMATION
--========================================================--
function job_precast(spell, action, spellMap, eventArgs)
    if presto_automation_enabled
        and spell.type == 'Step'
        and not buffactive['Presto']
        and not spell.interrupted then

        local recasts = windower.ffxi.get_ability_recasts()

        -- Presto ability recast ID is 236.
        if recasts[236] == 0 then
            eventArgs.cancel = true

            local target = spell.target.raw or '<t>'
            send_command('input /ja "Presto" <me>; wait 1.2; input /ja "'..
                spell.english..'" '..target)
            return
        end
    end

    -- Spectral Jig does not overwrite Sneak unless Sneak is removed first.
    if spell.english == 'Spectral Jig' and buffactive['Sneak'] then
        send_command('cancel 71')
    end
end

--========================================================--
-- CUSTOM PRECAST HANDLING
--========================================================--
function job_post_precast(spell, action, spellMap, eventArgs)

    if spell.english == 'No Foot Rise' then
        equip(sets.precast.JA['No Foot Rise'])

    elseif spell.type == 'Waltz' then
        if spell.english == 'Healing Waltz' then
            equip(sets.precast.Waltz['Healing Waltz'])
        else
            equip(sets.precast.Waltz)
        end

    elseif spell.type == 'Samba' then
        equip(sets.precast.Samba)

    elseif spell.type == 'Jig' then
        equip(sets.precast.Jig)

    elseif spell.type == 'Step' then
        equip(sets.precast.Step)

    elseif spell.type == 'Flourish1'
        or spell.type == 'Flourish2'
        or spell.type == 'Flourish3' then

        if sets.precast.Flourish[spell.english] then
            equip(sets.precast.Flourish[spell.english])
        else
            equip(sets.precast.Flourish)
        end
    elseif spell.type == 'WeaponSkill' then
        if buffactive['Climactic Flourish'] and sets.precast.WS.Climactic then
            equip(sets.precast.WS.Climactic)
        end
    end
end

--========================================================--
-- ARMOR MODE TOGGLE
--========================================================--
function customize_melee_set(meleeSet)
    if state.ArmorMode.value == 'Defense' then
        meleeSet = set_combine(meleeSet, sets.engaged.Defense)
    end
    meleeSet = set_combine(meleeSet,{
        main=state.MainWeapon.value,
        sub=state.Offhand.value,
    })
    return meleeSet
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Armor Mode' then
        if newValue == 'Defense' then
            add_to_chat(122, 'Armor Mode: DEFENSE')
        else
            add_to_chat(158, 'Armor Mode: TP')
        end

        handle_equipping_gear(player.status)
    elseif stateField == 'MainWeapon' then
        add_to_chat(122,'Main Weapon: '..newValue)
        handle_equipping_gear(player.status)
    elseif stateField == 'Offhand' then
        add_to_chat(122,'Offhand: '..newValue)
        handle_equipping_gear(player.status)
    end
end

--========================================================--
-- MACRO BOOK, PAGE, AND LOCKSTYLE
--========================================================--
function select_default_macro_book()
    set_macro_page(macro_page, macro_book)
end
