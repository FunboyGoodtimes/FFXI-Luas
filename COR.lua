-- ███╗   ███╗██╗██╗  ██╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗████████╗
-- ████╗ ████║██║██║ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
-- ██╔████╔██║██║█████╔╝ █████╗     ██║   ██████╔╝██║   ██║██║   ██║   ██║
-- ██║╚██╔╝██║██║██╔═██╗ ██╔══╝     ██║   ██╔══██╗██║   ██║██║   ██║   ██║
-- ██║ ╚═╝ ██║██║██║  ██╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╔╝   ██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝




-- COR.lua for Miketrout
-- Built from the Community Corsair Guide and inventory export dated 2026-08-29.
-- NumPad 1 toggles the main hand between Naegling and Rostam.
-- NumPad 2 toggles the ranged weapon between Anarchy +2 and Death Penalty.
-- Crepuscular Knife remains fixed in the off-hand slot.
-- Compensator is equipped only while using Phantom Rolls or Double-Up.

function get_sets()
    sets = {}

    main_weapon_mode = 'Naegling'
    ranged_weapon_mode = 'Anarchy +2'

    -- Weapons / ammunition
    sets.weapons = {}
    sets.weapons.Naegling = {
        main='Naegling',
        sub='Crepuscular Knife',
    }
    sets.weapons.Rostam = {
        main={name='Rostam', augments={'Path: C'}},
        sub='Crepuscular Knife',
    }

    sets.ranged_weapons = {
        ['Anarchy +2'] = {range='Anarchy +2'},
        ['Death Penalty'] = {range='Death Penalty'},
    }

    -- Idle and melee sets
    sets.idle = {
    head="Null Masque",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Null Belt",
    left_ear="Crep. Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Warp Ring",
    right_ring="Shneddick Ring",
    back="Null Shawl",
    }

    sets.engaged = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Epona's Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
    }

    -- Spell and ranged precast
    sets.precast = {}
    sets.precast.FC = {
        head={name='Carmine Mask +1', augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4'}},
        neck='Null Loop', ear1='Enchntr. Earring +1', ear2='Malignance Earring',
        body='Malignance Tabard', hands={name='Leyline Gloves', augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2'}},
        ring1='Kishar Ring', ring2='Shneddick Ring', waist='Witful Belt',
        legs='Malignance Tights', feet='Malignance Boots',
    }

    -- Only inventory-confirmed pieces are used here. Malignance supplies a safe
    -- ranged accuracy / Store TP foundation after the shot leaves the gun.
    sets.precast.RA = {
    ammo="Eminent Bullet",
    head="Laksa. Tricorne +3",
    body="Laksa. Frac +3",
    hands="Laksa. Gants +3",
    legs="Laksa. Trews +3",
    feet="Laksa. Bottes +3",
    neck="Comm. Charm +2",
    waist="Null Belt",
    left_ear="Crep. Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Crit.hit rate+4',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
    }

    sets.midcast = {}
    sets.midcast.RA = {
    ammo="Eminent Bullet",
    head="Laksa. Tricorne +3",
    body="Laksa. Frac +3",
    hands="Laksa. Gants +3",
    legs="Laksa. Trews +3",
    feet="Laksa. Bottes +3",
    neck="Iskur Gorget",
    waist="Null Belt",
    left_ear="Crep. Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Crit.hit rate+4',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
    }

    sets.midcast.QuickDraw = {
    ammo="Eminent Bullet",
    head="Laksa. Tricorne +3",
    body="Laksa. Frac +3",
    hands="Laksa. Gants +3",
    legs="Laksa. Trews +3",
    feet="Laksa. Bottes +3",
    neck="Comm. Charm +2",
    waist="Null Belt",
    left_ear="Crep. Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Crit.hit rate+4',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
    }
    sets.midcast.QuickDrawAcc = set_combine(sets.midcast.QuickDraw, {
    ammo="Eminent Bullet",
    head="Laksa. Tricorne +3",
    body="Laksa. Frac +3",
    hands="Laksa. Gants +3",
    legs="Laksa. Trews +3",
    feet="Laksa. Bottes +3",
    neck="Comm. Charm +2",
    waist="Null Belt",
    left_ear="Crep. Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Crit.hit rate+4',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
    })

    -- Phantom Roll: effect, duration, and range pieces owned in the export.
    sets.precast.CorsairRoll = {
    main={ name="Rostam", augments={'Path: C',}},
    range="Compensator",
    ammo="Eminent Bullet",
    head="Lanun Tricorne",
    body="Nyame Mail",
    hands="Chasseur's Gants +2",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Regal Necklace",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Crit.hit rate+4',}},
    left_ring="Luzaf's Ring",
    right_ring="Ephramad's Ring",
    }
    sets.precast.CorsairShot = sets.midcast.QuickDraw

    -- COR job-ability sets. Add or replace gear in any individual set below.
    -- Rolls and Quick Draw use their dedicated sets above.
    sets.precast.JA = {}
    sets.precast.JA['Double-Up'] = set_combine(sets.precast.CorsairRoll, {})
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +1",}
    sets.precast.JA['Wild Card'] = {}
    sets.precast.JA['Fold'] = {hands="Lanun Gants",}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews",}
    sets.precast.JA['Crooked Cards'] = {}
    sets.precast.JA['Triple Shot'] = {}
    sets.precast.JA['Cutting Cards'] = {}

    -- Curing Waltz set. This is used for every tier of Curing Waltz.
    -- Prioritize Waltz potency gear here, followed by VIT and CHR.
    sets.precast.Waltz = {
    head="Laksa. Tricorne +3",
    body="Laksa. Frac +3",
    hands="Laksa. Gants +3",
    legs="Dashing Subligar",
    feet="Laksa. Bottes +3",
    neck="Elite Royal Collar",
    waist="Aristo Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Odnowa Earring +1",
    left_ring="Carb. Ring +1",
    right_ring="Carb. Ring +1",
    back="Null Shawl",
    }

    -- Weapon skills
    sets.precast.WS = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Crit.hit rate+4',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    }

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Crit.hit rate+4',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},})
   
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
        neck='Fotia Gorget', waist='Fotia Belt', ring1='Niqmaddu Ring', ring2='Gere Ring',
    })
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
        neck='Fotia Gorget', waist='Fotia Belt',
        body='Mummu Jacket +2', hands='Mummu Wrists +2',
        ring1="Epona's Ring", ring2='Mummu Ring', legs='Mummu Kecks +2', feet='Mummu Gamash. +2',
    })

    sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {
        neck='Fotia Gorget', waist='Fotia Belt',
        back={name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%'}},
    })

    sets.precast.WS.Magic = set_combine(sets.precast.WS, {
        ear2='Friomisi Earring', ring1='Freke Ring', waist="Orpheus's Sash",
        back={name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%'}},
    })
    sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS.Magic, {  
    head="Pixie Hairpin +1",
    body="Lanun Frac +1",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Lanun Bottes +3",
    neck="Comm. Charm +2",
    waist="Orpheus's Sash",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},})
    sets.precast.WS['Wildfire'] = sets.precast.WS.Magic
    sets.precast.WS['Hot Shot'] = sets.precast.WS.Magic
    sets.precast.WS['Aeolian Edge'] = sets.precast.WS.Magic

    send_command('input /macro book 9; wait 1; input /macro set 1; wait 5; input /lockstyleset 15')
    send_command('bind numpad1 gs c toggle_main')
    send_command('bind numpad2 gs c toggle_range')
    equip_default_weapons()
end

function precast(spell, action)
    -- Spectral Jig will fail to refresh Sneak/Invisible cleanly if either
    -- effect is already active, so remove them before using the ability.
    if spell.english == 'Spectral Jig' then
        if buffactive['Sneak'] then
            windower.ffxi.cancel_buff(71)
        end
        if buffactive['Invisible'] then
            windower.ffxi.cancel_buff(69)
        end
    end

    if spell.type == 'CorsairRoll' or spell.english == 'Double-Up' then
        equip(sets.precast.CorsairRoll)
    elseif spell.type == 'CorsairShot' then
        equip(sets.precast.CorsairShot)
    elseif spell.action_type == 'Ranged Attack' then
        equip(sets.precast.RA)
    elseif spell.type == 'WeaponSkill' then
        equip(sets.precast.WS[spell.english] or sets.precast.WS)
    elseif spell.action_type == 'Magic' then
        equip(sets.precast.FC)
    elseif spell.type == 'Waltz' and spell.english:find('Curing Waltz', 1, true) == 1 then
        equip(sets.precast.Waltz)
    elseif spell.type == 'JobAbility' and sets.precast.JA[spell.english] then
        equip(sets.precast.JA[spell.english])
    end
end

function midcast(spell, action)
    if spell.action_type == 'Ranged Attack' then
        equip(sets.midcast.RA)
    elseif spell.type == 'CorsairShot' then
        if spell.english == 'Light Shot' or spell.english == 'Dark Shot' then
            equip(sets.midcast.QuickDrawAcc)
        else
            equip(sets.midcast.QuickDraw)
        end
    end
end

function aftercast(spell, action)
    if player.status == 'Engaged' then
        equip(sets.engaged)
    else
        equip(sets.idle)
    end
    equip_default_weapons()
end

function status_change(new, old)
    if new == 'Engaged' then
        equip(sets.engaged)
    else
        equip(sets.idle)
    end
    equip_default_weapons()
end

function equip_default_weapons()
    equip(sets.weapons[main_weapon_mode])
    equip(sets.ranged_weapons[ranged_weapon_mode])
end

function self_command(command)
    if command == 'toggle_main' then
        if main_weapon_mode == 'Naegling' then
            main_weapon_mode = 'Rostam'
        else
            main_weapon_mode = 'Naegling'
        end

        equip_default_weapons()
        windower.add_to_chat(122, 'Main hand: '..main_weapon_mode)
    elseif command == 'toggle_range' then
        if ranged_weapon_mode == 'Anarchy +2' then
            ranged_weapon_mode = 'Death Penalty'
        else
            ranged_weapon_mode = 'Anarchy +2'
        end

        equip_default_weapons()
        windower.add_to_chat(122, 'Ranged weapon: '..ranged_weapon_mode)
    end
end

function file_unload()
    send_command('unbind numpad1')
    send_command('unbind numpad2')
end
