if GetObjectName(GetMyHero()) ~= "Annie" then return end  	-- proverava da li je Annie, ako nije onda zaustavlja skriptu
	
local version = "0.1"									  	-- verzija skripte 

function AutoUpdate( data )
	if tonumber(data) > tonumber(version) then
		PrintChat("New version found! " .. data)
		PrintChat("Downloading update, please wait...")
		DownloadFileAsync("https://raw.githubusercontent.com/dangerousScript/GoS-Scripts/master/Annie/EduAnnie.lua", SCRIPT_PATH .. "EduAnnie.lua", function() PrintChat("Update Complete, please 2x F6!") return end)
	else		
		PrintChat("No updates found!")
	end
end

GetWebResultAsync("https://raw.githubusercontent.com/dangerousScript/GoS-Scripts/master/Annie/EduAnnie.version", AutoUpdate)

require("OpenPredict")										-- Loads OpenPredict
--[[
	code za proveru da li korisnik ima OpenPredict, ako nema onda skida potrebne library
]]

local AnnieMenu = Menu("Annie", "Annie")					-- pravimo menu AnnieMenu
AnnieMenu:SubMenu("Combo", "Full Combo")					-- submenu Combo
AnnieMenu.Combo:Boolean("Q", "Use Q", true)
AnnieMenu.Combo:Boolean("W", "Use W", true)
AnnieMenu.Combo:Boolean("E", "Use E", false)
AnnieMenu.Combo:Boolean("R", "Use R", true)
AnnieMenu.Combo:Boolean("KSQ", "Killsteal with Q", true)		-- button za killsteal sa Q
AnnieMenu.Combo:Boolean("UOP", "Use OpenPredict for R", true)	-- button da li hocu da koristim openpredict za R
AnnieMenu:Info("Info", "ExampleText")

local AnnieR = {delay = 0.075, range = 600, radius = 150, speed = math.huge}	-- table for Annie R for OpenPredict
