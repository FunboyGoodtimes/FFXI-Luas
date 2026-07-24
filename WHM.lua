-- ███╗   ███╗██╗██╗  ██╗███████╗████████╗██████╗  ██████╗ ██╗   ██╗████████╗
-- ████╗ ████║██║██║ ██╔╝██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
-- ██╔████╔██║██║█████╔╝ █████╗     ██║   ██████╔╝██║   ██║██║   ██║   ██║
-- ██║╚██╔╝██║██║██╔═██╗ ██╔══╝     ██║   ██╔══██╗██║   ██║██║   ██║   ██║
-- ██║ ╚═╝ ██║██║██║  ██╗███████╗   ██║   ██║  ██║╚██████╔╝╚██████╔╝   ██║
-- ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝


--============================================================--
--                    WHM GearSwap Lua                        --
--   Simple setup: Idle, Fast Cast, Cure, Curaga, Enhancing,  --
--   Regen, Barspells, Enfeebling, and Impact                 --
--============================================================--

function get_sets()
    initialize()
end

function initialize()
    sets = {}

    --========================================================--
    -- Idle Set
    --========================================================--
    sets.idle = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Null Masque",
    body="Ebers Bliaut +3",
    hands="Volte Gloves",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Alabaster Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back="Shadow Mantle",
    }

    --========================================================--
    -- Fast Cast Set
    --========================================================--
    sets.precast = {}
    sets.precast.FC = {
    main="C. Palug Hammer",
    sub="Sors Shield",
    ammo="Impatiens",
    head="Ebers Cap +2",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Song spellcasting time -4%',}},
    legs="Pinga Pants",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Mendi. Earring",
    right_ear="Malignance Earring",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'"Fast Cast"+10','Damage taken-5%',}},
    }

    -- Impact requires the cloak equipped before the spell begins.
    sets.precast.Impact = set_combine(sets.precast.FC, {
        head = empty,
        body = "Crepuscular Cloak",
    })

    --========================================================--
    -- Midcast Sets
    --========================================================--
    sets.midcast = {}

    sets.midcast.Cure = {
    main="Raetic Rod +1",
    sub="Sors Shield",
    ammo="Impatiens",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body="Ebers Bliaut +3",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Ebers Pant. +3",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Roundel Earring",
    left_ring={name="Stikini Ring +1", bag="wardrobe4"},
    right_ring={name="Stikini Ring +1", bag="wardrobe"},
    back={ name="Alaunus's Cape", augments={'"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.midcast.Curaga = {
    main="Raetic Rod +1",
    sub="Sors Shield",
    ammo="Impatiens",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body="Ebers Bliaut +3",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Ebers Pant. +3",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Roundel Earring",
    left_ring={name="Stikini Ring +1", bag="wardrobe4"},
    right_ring={name="Stikini Ring +1", bag="wardrobe"},
    back={ name="Alaunus's Cape", augments={'"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.midcast.Enhancing = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+18','"Mag.Atk.Bns."+3','DMG:+6',}},
    sub="Ammurapi Shield",
    ammo="Impatiens",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet="Theo. Duckbills +3",
    neck="Hoxne Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Regal Earring",
    left_ring={name="Stikini Ring +1", bag="wardrobe4"},
    right_ring={name="Stikini Ring +1", bag="wardrobe"},
    back={ name="Alaunus's Cape", augments={'"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.midcast.Regen = {
        -- Add your Regen gear here
    }

    sets.midcast.Barspell = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+18','"Mag.Atk.Bns."+3','DMG:+6',}},
    sub="Ammurapi Shield",
    ammo="Impatiens",
    head="Ebers Cap +2",
    body="Ebers Bliaut +3",
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs="Ebers Pant. +3",
    feet="Theo. Duckbills +3",
    neck="Hoxne Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Regal Earring",
    left_ring={name="Stikini Ring +1", bag="wardrobe4"},
    right_ring={name="Stikini Ring +1", bag="wardrobe"},
    back={ name="Alaunus's Cape", augments={'"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.midcast.Enfeebling = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Ebers Cap +2",
    body="Ebers Bliaut +3",
    hands="Bunzi's Gloves",
    legs="Ebers Pant. +3",
    feet="Theo. Duckbills +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
    }

    sets.midcast.Impact = {
        head = empty,
        body = "Crepuscular Cloak",
        -- Add the rest of your Impact gear here
    }

    --========================================================--
    -- Startup Settings
    -- Change these numbers to your preferred macro book/page
    -- and lockstyle set.
    --========================================================--
    send_command('wait 2; input /macro book 1; input /macro set 10')
    send_command('wait 4; input /lockstyleset 12')

    equip(sets.idle)
end

--============================================================--
-- Precast
--============================================================--
function precast(spell)
    if spell.action_type == 'Magic' then
        if spell.english == 'Impact' then
            equip(sets.precast.Impact)
        else
            equip(sets.precast.FC)
        end
    end
end

--============================================================--
-- Midcast
--============================================================--
function midcast(spell)
    if spell.english == 'Impact' then
        equip(sets.midcast.Impact)

    elseif spell.english:startswith('Curaga') or spell.english == 'Curagara' then
        equip(sets.midcast.Curaga)

    elseif spell.english:startswith('Cure') then
        equip(sets.midcast.Cure)

    elseif spell.english:startswith('Regen') then
        equip(sets.midcast.Regen)

    elseif spell.english:startswith('Bar') then
        equip(sets.midcast.Barspell)

    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.Enhancing)

    elseif spell.skill == 'Enfeebling Magic' then
        equip(sets.midcast.Enfeebling)
    end
end

--============================================================--
-- Aftercast
--============================================================--
function aftercast(spell)
    equip(sets.idle)
    check_buffs()
end

--============================================================--
-- Status Change
--============================================================--
function status_change(new, old)
    equip(sets.idle)
    check_buffs()
end

--============================================================--
-- Helper Function
--============================================================--
function string.startswith(self, value)
    return self:sub(1, #value) == value
end


--============================================================--
-- Auto Light Arts / Afflatus Solace
--============================================================--
auto_ja_busy = false

function check_buffs()
    if auto_ja_busy then return end
    if player.status ~= 'Idle' then return end
    if midaction() then return end

    if not buffactive['Light Arts'] then
        auto_ja_busy = true
        send_command('input /ja "Light Arts" <me>; wait 3; gs c reset_autoja')
        return
    end

    -- Only attempt Solace after Light Arts is active.
    if buffactive['Light Arts'] and not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
        auto_ja_busy = true
        send_command('input /ja "Afflatus Solace" <me>; wait 3; gs c reset_autoja')
    end
end

function self_command(cmd)
    if cmd == 'reset_autoja' then
        auto_ja_busy = false
        check_buffs()
    end
end
