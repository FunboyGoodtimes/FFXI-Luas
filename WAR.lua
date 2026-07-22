-- ███╗   ███╗██╗██╗  ██╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗████████╗
-- ████╗ ████║██║██║ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
-- ██╔████╔██║██║█████╔╝ █████╗     ██║   ██████╔╝██║   ██║██║   ██║   ██║
-- ██║╚██╔╝██║██║██╔═██╗ ██╔══╝     ██║   ██╔══██╗██║   ██║██║   ██║   ██║
-- ██║ ╚═╝ ██║██║██║  ██╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╔╝   ██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝

--========================================================--
-- WAR.lua
-- Numpad 1-4 = Weapon Sets
-- Numpad 5   = TP/Defense Toggle
--========================================================--

WeaponMode = 1
ArmorMode = "TP"

function get_sets()

    --------------------------------------------------------
    -- IDLE
    --------------------------------------------------------

    sets.idle = {    ammo="Thr. Tomahawk",
    head="Null Masque",
    body="Sacro Breastplate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Elite Royal Collar",
    waist="Null Belt",
    left_ear="Telos Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Chirich Ring +1",
    right_ring="Shneddick Ring",
    back="Null Shawl",

    }

    --------------------------------------------------------
    -- ENGAGED
    --------------------------------------------------------

    sets.engaged = {    ammo="Aurgelmir Orb",
    head="Boii Mask +2",
    body="Hjarrandi Breast.",
    hands="Sakpata's Gauntlets",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck="Null Loop",
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",}

    sets.engaged.TP = {    ammo="Aurgelmir Orb",
    head="Boii Mask +2",
    body="Hjarrandi Breast.",
    hands="Sakpata's Gauntlets",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck="Null Loop",
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",}
    

    sets.engaged.Defense = {    ammo="Staunch Tathlum",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Murky Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    

    --------------------------------------------------------
    -- WEAPONSKILLS
    --------------------------------------------------------

    sets.precast = {}

    sets.precast.JA = {}

-- Default JA set
sets.precast.JA.Default = {
ammo="Thr. Tomahawk",
head="Agoge Mask +3",
body="Pumm. Lorica +3",
hands="Pumm. Mufflers +3",
legs="Pumm. Cuisses +3",
feet="Pumm. Calligae +3",
neck="Elite Royal Collar",
waist="Ioskeha Belt",
left_ear="Telos Earring",
right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
back="Null Shawl",}

-- Tomahawk override
sets.precast.JA['Tomahawk'] = set_combine(
sets.precast.JA.Default,{
ammo="Thr. Tomahawk",
})

    sets.precast.WS = {    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Boii Cuisses +3",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Savage Blade'] = set_combine(
        sets.precast.WS,{    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Boii Cuisses +3",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })

    sets.precast.WS['Upheaval'] = set_combine(
        sets.precast.WS,{
    })

    sets.precast.WS["Ukko's Fury"] = set_combine(
        sets.precast.WS,{
    })

    sets.precast.WS['Impulse Drive'] = set_combine(
        sets.precast.WS,{
    })

        sets.precast.WS['Judgment'] = set_combine(
        sets.precast.WS,{    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Boii Cuisses +3",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })

    --------------------------------------------------------
    -- WEAPON SETS
    --------------------------------------------------------

    sets.weapons = {}

    -- Numpad 1
    sets.weapons[1] = {
        main="Naegling",
        sub="Blurred Shield +1",
    }

    -- Numpad 2
    sets.weapons[2] = {
        main="Loxotic Mace +1",
        sub="Blurred Shield +1",
    }

    -- Numpad 3
    sets.weapons[3] = {
        main="Chango",
        sub="Utu Grip",
    }

    -- Numpad 4
    sets.weapons[4] = {
        main="Shining One",
        sub="Utu Grip",
    }

    bind_keys()
    send_command('wait 2;input /macro book 2')
send_command('wait 3;input /macro set 10')
send_command('wait 4;input /lockstyleset 20')
end

------------------------------------------------------------
-- PRECAST
------------------------------------------------------------

function precast(spell)

if spell.type == 'JobAbility' then

    if sets.precast.JA[spell.english] then
        equip(sets.precast.JA[spell.english])
    else
        equip(sets.precast.JA.Default)
    end

    return
end

if spell.type == 'WeaponSkill' then

    if sets.precast.WS[spell.english] then
        equip(sets.precast.WS[spell.english])
    else
        equip(sets.precast.WS)
    end

end

end

------------------------------------------------------------
-- AFTERCAST
------------------------------------------------------------

function aftercast(spell)
    equip_current_set()
end

------------------------------------------------------------
-- STATUS CHANGE
------------------------------------------------------------

function status_change(new,old)
    equip_current_set()
end

------------------------------------------------------------
-- EQUIP LOGIC
------------------------------------------------------------

function equip_current_set()

    -- Always keep selected weapon set equipped
    equip(sets.weapons[WeaponMode])

    if player.status == 'Engaged' then
        equip(sets.engaged[ArmorMode])
    else
        equip(sets.idle)
    end

end

------------------------------------------------------------
-- COMMANDS
------------------------------------------------------------

function self_command(cmd)

    if cmd == 'weapon1' then

        WeaponMode = 1
        equip_current_set()
        add_to_chat(122,'Weapon Set 1')

    elseif cmd == 'weapon2' then

        WeaponMode = 2
        equip_current_set()
        add_to_chat(122,'Weapon Set 2')

    elseif cmd == 'weapon3' then

        WeaponMode = 3
        equip_current_set()
        add_to_chat(122,'Weapon Set 3')

    elseif cmd == 'weapon4' then

        WeaponMode = 4
        equip_current_set()
        add_to_chat(122,'Weapon Set 4')

    elseif cmd == 'togglearmor' then

        if ArmorMode == 'TP' then
            ArmorMode = 'Defense'
        else
            ArmorMode = 'TP'
        end

        equip_current_set()

        add_to_chat(122,'Armor Mode: '..ArmorMode)

    end
end

------------------------------------------------------------
-- LOAD
------------------------------------------------------------

function bind_keys()

    send_command('bind numpad1 gs c weapon1')
    send_command('bind numpad2 gs c weapon2')
    send_command('bind numpad3 gs c weapon3')
    send_command('bind numpad4 gs c weapon4')
    send_command('bind numpad5 gs c togglearmor')

end

------------------------------------------------------------
-- UNLOAD
------------------------------------------------------------

function file_unload()

    send_command('unbind numpad1')
    send_command('unbind numpad2')
    send_command('unbind numpad3')
    send_command('unbind numpad4')
    send_command('unbind numpad5')

end