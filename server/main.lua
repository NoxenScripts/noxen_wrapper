Framework = nil
FrameworkName = nil

local function DetectFramework()
    if Config.AutoDetectFramework then
        if GetResourceState('qb-core') == 'started' then
            Framework = exports['qb-core']:GetCoreObject({'Functions'})
            FrameworkName = 'qb'
            if Config.Debug then
                print('[Noxen-Wrapper] QBCore detected and loaded')
            end
            return true
        elseif GetResourceState('es_extended') == 'started' then
            Framework = exports['es_extended']:getSharedObject()
            FrameworkName = 'esx'
            if Config.Debug then
                print('[Noxen-Wrapper] ESX detected and loaded')
            end
            return true
        else
            if Config.Debug then
                print('[Noxen-Wrapper] No supported framework detected, trying manual selection')
            end
            return false
        end
    else
        if Config.ManualFramework == 'qb' then
            if GetResourceState('qb-core') == 'started' then
                Framework = exports['qb-core']:GetCoreObject({'Functions'})
                FrameworkName = 'qb'
                if Config.Debug then
                    print('[Noxen-Wrapper] QBCore manually selected and loaded')
                end
                return true
            else
                if Config.Debug then
                    print('[Noxen-Wrapper] QBCore manually selected but not found')
                end
                return false
            end
        elseif Config.ManualFramework == 'esx' then
            if GetResourceState('es_extended') == 'started' then
                Framework = exports['es_extended']:getSharedObject()
                FrameworkName = 'esx'
                if Config.Debug then
                    print('[Noxen-Wrapper] ESX manually selected and loaded')
                end
                return true
            else
                if Config.Debug then
                    print('[Noxen-Wrapper] ESX manually selected but not found')
                end
                return false
            end
        else
            if Config.Debug then
                print('[Noxen-Wrapper] Invalid manual framework selection: ' .. tostring(Config.ManualFramework))
            end
            return false
        end
    end
end

Citizen.CreateThread(function()
    while not DetectFramework() do
        Citizen.Wait(1000)
    end

    if Config.Debug then
        print('[Noxen-Wrapper] Framework loaded: ' .. tostring(FrameworkName))
    end
end)

function GetFramework()
    return Framework
end

function GetFrameworkName()
    return FrameworkName
end

function IsFrameworkReady()
    return Framework ~= nil
end

exports('GetFramework', GetFramework)
exports('GetFrameworkName', GetFrameworkName)
exports('IsFrameworkReady', IsFrameworkReady)