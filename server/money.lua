function GetPlayerMoney(source, moneyType)
    local player = GetPlayer(source)
    if not player then return 0 end

    moneyType = moneyType or 'cash'

    if FrameworkName == 'qb' then
        return player.Functions.GetMoney(moneyType) or 0
    elseif FrameworkName == 'esx' then
        if moneyType == 'cash' then
            return player.getMoney() or 0
        elseif moneyType == 'bank' then
            return player.getAccount('bank').money or 0
        end
    end

    return 0
end

function AddPlayerMoney(source, moneyType, amount)
    local player = GetPlayer(source)
    if not player or amount <= 0 then return false end

    moneyType = moneyType or 'cash'

    if FrameworkName == 'qb' then
        return player.Functions.AddMoney(moneyType, amount)
    elseif FrameworkName == 'esx' then
        if moneyType == 'cash' then
            player.addMoney(amount)
            return true
        elseif moneyType == 'bank' then
            player.addAccountMoney('bank', amount)
            return true
        end
    end

    return false
end

function RemovePlayerMoney(source, moneyType, amount)
    local player = GetPlayer(source)
    if not player or amount <= 0 then return false end

    moneyType = moneyType or 'cash'

    if FrameworkName == 'qb' then
        return player.Functions.RemoveMoney(moneyType, amount)
    elseif FrameworkName == 'esx' then
        if moneyType == 'cash' then
            if player.getMoney() >= amount then
                player.removeMoney(amount)
                return true
            end
        elseif moneyType == 'bank' then
            if player.getAccount('bank').money >= amount then
                player.removeAccountMoney('bank', amount)
                return true
            end
        end
    end

    return false
end

function SetPlayerMoney(source, moneyType, amount)
    local player = GetPlayer(source)
    if not player or amount < 0 then return false end

    moneyType = moneyType or 'cash'

    if FrameworkName == 'qb' then
        return player.Functions.SetMoney(moneyType, amount)
    elseif FrameworkName == 'esx' then
        if moneyType == 'cash' then
            player.setMoney(amount)
            return true
        elseif moneyType == 'bank' then
            player.setAccountMoney('bank', amount)
            return true
        end
    end

    return false
end

exports('GetPlayerMoney', GetPlayerMoney)
exports('AddPlayerMoney', AddPlayerMoney)
exports('RemovePlayerMoney', RemovePlayerMoney)
exports('SetPlayerMoney', SetPlayerMoney)