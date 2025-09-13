--- STEAMODDED HEADER
--- MOD_NAME: Simple
--- MOD_ID: SimpleJoker
--- MOD_AUTHOR: [Gonçalo,Braz,Hernani]
--- MOD_DESCRIPTION: An example mod on how to create Jokers.
--- PREFIX: xmpl
----------------------------------------------
------------MOD CODE -------------------------


SMODS.Atlas{
    key = 'Jokers', --atlas key
    path = 'Jokers.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{
    key = 'Simpleton', --joker key
    loc_txt = { -- local text
        name = 'Simple',
        text = {
          'When Blind is selected,',
          'create a {C:attention}Joker{}',
          '{X:mult,C:white}X#1#{} Mult',
          'Gain {C:money}123${} at end of round'
        },
        --[[unlock = {
            'Be {C:legendary}cool{}',
        }]]
    },
    atlas = 'Jokers', --atlas' key
    rarity = 1, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 1, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = false, --can it be eternal
    perishable_compat = false, --can it be perishable
    pos = {x = 0, y = 0}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
    config = { 
      extra = {
        Xmult = 100 --configurable value
      }
    },
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.j_joker --adds "Joker"'s description next to this card's description
        return {vars = {center.ability.extra.Xmult}} --#1# is replaced with card.ability.extra.Xmult
    end,
    check_for_unlock = function(self, args)
        if args.type == 'derek_loves_you' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = 'X' .. card.ability.extra.Xmult,
                colour = G.C.MULT
            }
        end

        if context.setting_blind then
            local new_card = create_card('Joker', G.jokers, nil,nil,nil,nil,'j_joker')
            new_card:add_to_deck()
            G.jokers:emplace(new_card)
        end
    end,
    in_pool = function(self,wawa,wawa2)
        --whether or not this card is in the pool, return true if it is, return false if its not
        return true
    end,
    calc_dollar_bonus = function(self,card)
        return 123
    end,
}

SMODS.Atlas{
    key = 'jack_of_all_jokers', --atlas key
    path = 'Unknown.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{
    key = 'Jack_of_all_jokers', --joker key
    loc_txt = { -- local text
        name = 'Jack of All Jokers',
        text = {
          'When Blind is selected,',
          'create a two {C:attention}Jokers{}',
          '{C:attention}1 in 6{} chance to destroy',
          'cards next to it',
        },
        --[[unlock = {
            'Be {C:legendary}cool{}',
        }]]
    },
    atlas = 'jack_of_all_jokers', --atlas' key
    rarity = 1, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 1, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = false, --can it be eternal
    perishable_compat = false, --can it be perishable
    pos = {x = 0, y = 0}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
    config = { 
      extra = {
        Xmult = 100 --configurable value
      }
    },
    calculate = function(self,card,context)
        if context.setting_blind then 
            local new_card1 = create_card('Triboulet', G.jokers, nil,nil,nil,nil,'j_joker')
            local new_card2 = create_card('Triboulet', G.jokers, nil,nil,nil,nil,'j_joker')
            new_card1:add_to_deck()
            new_card2:add_to_deck()
            G.jokers:emplace(new_card1)
            G.jokers:emplace(new_card2)
        end
    end
}

SMODS.Atlas {
    key = "the_cutter",
    path = "checker.png",
    px = 34,
    py = 34,
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS',
}

SMODS.Blind {
    key = "the_cutter",
    atlas = "the_cutter",
    pos = { x = 0, y = 0 },
    dollars = 10,
    discovered = true,
    mult = 5,
    boss = { min = 1},
    boss_colour = HEX('00008B'),    
    
    loc_txt = {
        name = 'The Cutter',
        text = {
            'cards on hand cut by half'
        },
    },


}

SMODS.Atlas {
    key = "paradox",
    path = "paradox.png",
    px = 34,
    py = 34,
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS',
}

SMODS.Blind {
    key = "paradox",
    atlas = "paradox",
    pos = { x = 0, y = 0 },
    dollars = 10,
    discovered = true,
    mult = 5,
    boss = { min = 1},
    boss_colour = HEX('a6a6a6'),    
    
    loc_txt = {
        name = 'The Paradox',
        text = {
            'If blind is lost,',
            'return to ante 1.'
        },
    },


}