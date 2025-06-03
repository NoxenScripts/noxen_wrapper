function GetPlayerItem(source, item)
    local player = GetPlayer(source)
    if not player then return nil end

    if FrameworkName == 'qb' then
        return player.Functions.GetItemByName(item)
    elseif FrameworkName == 'esx' then
        return player.getInventoryItem(item)
    end

    return nil
end

function GetPlayerItemCount(source, item)
    local playerItem = GetPlayerItem(source, item)
    if not playerItem then return 0 end

    if FrameworkName == 'qb' then
        return playerItem.amount or 0
    elseif FrameworkName == 'esx' then
        return playerItem.count or 0
    end

    return 0
end

function AddPlayerItem(source, item, amount, metadata)
    local player = GetPlayer(source)
    if not player or amount <= 0 then return false end

    if FrameworkName == 'qb' then
        return player.Functions.AddItem(item, amount, nil, metadata)
    elseif FrameworkName == 'esx' then
        player.addInventoryItem(item, amount)
        return true
    end

    return false
end

function RemovePlayerItem(source, item, amount)
    local player = GetPlayer(source)
    if not player or amount <= 0 then return false end

    if FrameworkName == 'qb' then
        return player.Functions.RemoveItem(item, amount)
    elseif FrameworkName == 'esx' then
        if GetPlayerItemCount(source, item) >= amount then
            player.removeInventoryItem(item, amount)
            return true
        end
    end

    return false
end

function HasPlayerItem(source, item, amount)
    amount = amount or 1

    if FrameworkName == 'qb' then
        return GetPlayerItemCount(source, item) >= amount
    elseif FrameworkName == 'esx' then
        local player = GetPlayer(source)
        if not player then return false end

        if amount == 1 then
            return player.hasItem(item)
        else
            return GetPlayerItemCount(source, item) >= amount
        end
    end

    return false
end

exports('GetPlayerItem', GetPlayerItem)
exports('GetPlayerItemCount', GetPlayerItemCount)
exports('AddPlayerItem', AddPlayerItem)
exports('RemovePlayerItem', RemovePlayerItem)
exports('HasPlayerItem', HasPlayerItem)