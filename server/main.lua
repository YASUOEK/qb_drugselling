local CopsConnected = 0
local LSPD1 = 0
local FBI1 = 0

function CountCops()
	local xPlayers = QBCore.Functions.GetPlayers()
	CopsConnected = 0
	LSPD1 = 0
	FBI1 = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
		if xPlayer.PlayerData.job.name == 'police' then
			LSPD1 = LSPD1 + 1
		end
		if xPlayer.PlayerData.job.name == 'sheriff' then
			FBI1 = FBI1 + 1
		end
		CopsConnected = (LSPD1 + FBI1)
	end
	SetTimeout(5000, CountCops)
end

CountCops()

function isIntrested()
  	local percent = math.random(1, 2)
  	if percent == 1  then 
		return true
  	else 
		return false
  	end
end

RegisterServerEvent('esx_npcdrugsales:vente')
AddEventHandler('esx_npcdrugsales:vente', function(deal)

	local xPlayer = QBCore.Functions.GetPlayer(source)
	local xPlayers 		 = QBCore.Functions.GetPlayers()
	local QTE = 1
	local TYPE = ""
	local LABEL = ""
	local PrixFinal = 200
	local methQTE = xPlayer.Functions.GetItemByName('methtray').count
	local cokeQTE = xPlayer.Functions.GetItemByName('methtray').count
	local weedQTE = xPlayer.Functions.GetItemByName('methtray').count
	local opiumQTE = xPlayer.Functions.GetItemByName('methtray').count
	
	if CopsConnected >= GuTu.CopsNeeds then
		if isIntrested() then
			TriggerClientEvent("esx_npcdrugsales:animation", source)
			xPlayer.Functions.RemoveItem(TYPE, QTE, 1)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['methtray'], "remove")
			xPlayer.Functions.AddMoney('bank', PrixFinal)
			TriggerClientEvent('pkl:showCountryWelcome', source, GuTu.Text['done'] .. QTE .. LABEL .. GuTu.Text['for'] .. PrixFinal)
			
			local poukichance = math.random (1,4)
			if poukichance == 1 then
				for i=1, #xPlayers, 1 do
					local xPlayer2 = QBCore.Functions.GetPlayer(xPlayers[i])
					if xPlayer2.PlayerData.job.name == 'police' then
						TriggerClientEvent('pkl:showCountryWelcome', xPlayers[i], GuTu.Text['process'])
						TriggerClientEvent('esx_npcdrugsales:poucave', xPlayers[i], deal.x, deal.y, deal.z)
					end
				end
			end
		else
			TriggerClientEvent('pkl:showCountryWelcome', source, GuTu.Text['no'])
		end
	else
		TriggerClientEvent('pkl:showCountryWelcome', source, GuTu.Text['cops1'] .. CopsConnected .. "/" .. GuTu.CopsNeeds .. GuTu.Text['cops2'])
	end
end)

RegisterNetEvent('esx_npcdrugsales:dist')
AddEventHandler('esx_npcdrugsales:dist', function()
	TriggerClientEvent('pkl:showCountryWelcome', source, GuTu.Text['dist'])
end)

RegisterServerEvent('esx_npcdrugsales:GetJob')
AddEventHandler('esx_npcdrugsales:GetJob', function()
    local xPlayer  = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('esx_npcdrugsales:RefreshJob', source, xPlayer.PlayerData.job.name)
end)

RegisterServerEvent('esx_npcdrugsales:GetUserInventory')
AddEventHandler('esx_npcdrugsales:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = QBCore.Functions.GetPlayer(_source)

	if xPlayer.Functions.GetItemByName('methtray') ~= nil then
        TriggerClientEvent('esx_npcdrugsales:ReturnInventory', source)
    end
end)

--l78Z7enfGGarnS4x0ojcCwKDXf+SW/+1ERTAio7M8MY=
