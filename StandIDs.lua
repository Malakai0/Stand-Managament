--[[

    Name - name of the script
    DisplayName - the name that appears in the menu
    Directory - directory of the stand
    Stats - stats.. {Power, Speed, Durability}
    Arrow - bool, obtainable by arrow?
    Chance - the chance..

]]

local ChanceModule = require('Chances')

local Chances = {
    ['S'] = 1,
    ['A'] = 2,
    ['B'] = 7,
    ['C'] = 15,
    ['D'] = 35,
    ['E'] = 40
}

-- Directory is a table placeholder for the folder.
local StandIDs = {
    [1] = {
        ['Name'] = "Standless",
        ['DisplayName'] = 'Standless',
        ['Stats'] = {"C","C","C"},
        ['Arrow'] = false
    },
    [2] = {
        ['Name'] = "StarPlatinum",
        ['DisplayName'] = 'Star Platinum',
        ['Stats'] = {"A","A","A"},
        ['Arrow'] = true,
        ['Chance'] = 'A'
    }
}

function StandIDs.GetStandOfRank(Rank)
    local Found = {}
    for I, V in next, StandIDs do
        if type(V) == 'table' and (V.Chance and V.Chance:lower() == Rank:lower()) then
            table.insert(Found, I)
        end
    end
    return Found
end

function StandIDs.GetId(Name)
    for I, V in next, StandIDs do
        if type(V) == 'table' and (V.Name and V.Name:lower() == Name) then
            return I;
        end
    end
end

function StandIDs.GetRandomStand()
    local Rank = ChanceModule.Run(Chances)
    print("Rank: " .. Rank)
    local Stands = StandIDs.GetStandOfRank(Rank)
    local EachChance = 100 / #Stands -- math.ceil'ing just incase it returns 99.99..
    local NewChanceTable = {}
    for _, V in next, Stands do
        NewChanceTable[V] = EachChance
    end

    return ChanceModule.Run(NewChanceTable) -- This returns the ID.
end

return StandIDs
