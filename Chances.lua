local Chances = {}

math.randomseed(os.clock()*2^36)

-- In Roblox you'd use Random.new() and Random:NextInteger instead of math.random..

function Chances.Run(ChanceTable)
    local Entries = {}
    local Total = 0

    table.sort(ChanceTable)

    for I, V in pairs(ChanceTable) do
        Entries[I] = {Min = Total, Max = Total + V}
        Total = Total + V
    end

    if math.ceil(Total) ~= 100 then
        error("Total doesn't add up to 100, \""..tostring(Total).."\" specified.")
    end


    local Number = math.random(0,100)
    print("Number: " .. Number)
    for I, V in next, Entries do
        if V.Min <= Number and V.Max >= Number then
            return I
        end
    end

    -- Should never happen!
    error("Couldn't find random value.")
end

return Chances
