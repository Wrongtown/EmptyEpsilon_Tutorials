-- Name: Helm Tutorial
-- Description: A brief tutorial covering the various controls available to the helm.

-- Init is run when the scenario is started. Create initial
function init()
    -- Create the main ship for the Players.
    Player = PlayerSpaceship():setFaction("Human Navy"):setShipTemplate("Player Cruiser")
    Player:setPosition(-1900, -1500):setCallSign("The Epsilon")
    --Create the station
--    sollab = SpaceStation():setTemplate("Small Station"):setFaction("Human Navy"):setPosition(23500, 16100):setCallSign("SOLlab-603")
--Temp SOLLAB close to Player
    sollab = SpaceStation():setTemplate("Small Station"):setFaction("Human Navy"):setPosition(-2200, -1500):setCallSign("SOLlab-603")
    SpaceStation():setTemplate("Medium Station"):setFaction("Independent"):setPosition(-25200, 32200):setCallSign("Habitat-ZG603")
    SpaceStation():setTemplate("Large Station"):setFaction("Human Navy"):setPosition(-45600, -15800):setCallSign("SOLCMD-42")
    SpaceStation():setTemplate("Small Station"):setFaction("Independent"):setPosition(9100,-35400):setCallSign("Hadley's Hope")

--Create a McGuffin entity hidden in sector Z81, the position of this ship in relation to the Station Nirvana serves as a sort of timer for the Global messages displayed.
    McGuffin = CpuShip():setFaction("Human Navy"):setShipTemplate("Tug"):setCallSign("McGuffin"):setPosition(1530000,411000):orderIdle()
    McGuffin:setCommsScript("") -- Disable the comms script for the Technical Officer station (though really, they should never find it all the way out in sector Z81).
    --Create a station called "Nirvana" for "Technical Officer" to approach 
    Nirvana = SpaceStation():setTemplate("Small Station"):setFaction("Human Navy"):setPosition(1530000,412000):setCallSign("Nirvana")

--Random nebulae in the system
    Nebula():setPosition( -8000,-38300)
    Nebula():setPosition( 28000,-32700)
    Nebula():setPosition( 47300,  6100)
    Nebula():setPosition( 69200, 15800)
    Nebula():setPosition(  9750, 30000)
    Nebula():setPosition(-39500, 23600)
    Nebula():setPosition( 18950, 52250)
    Nebula():setPosition(-45760,-25280)
  Asteroid():setPosition( -1500, -1650)
  Asteroid():setPosition( -1300, -1200)
  Asteroid():setPosition( -1350, -1450)

SupplyDrop():setFaction("Human Navy"):setPosition( -1607, -691) -- A supply drop, can be picked up by flying over it, empty per default, can be filled with energy and missile weapons.

    for asteroid_counter=1,500 do
        Asteroid():setPosition(random(2644, 21800), random(-1689, 30000))
        VisualAsteroid():setPosition(random(0, 5000), random(0, 30000))
    end

--[[
--Create some artifacts to test scanning --(Note, untested. Not sure if scanning already works properly)
a = Artifact():setPosition(-1200, -1200)
a:setModel("shield_generator") --Any model from the model_data.lua
a:setDescription("An odd object in space...")
a:setScanningParameters(2, 2) -- Set the scanning requirements to 2 sets of 2 bars

b = Artifact():setPosition(-1500, -1200)
a:setModel("artifact1") --Any model from the model_data.lua
a:setDescription("An odd object in space...")
a:setScanningParameters(2, 2) -- Set the scanning requirements to 2 sets of 2 bars

c = Artifact():setPosition(-1600, -1200)
a:setModel("artifact2") --Any model from the model_data.lua
a:setDescription("An odd object in space...")
a:setScanningParameters(2, 2) -- Set the scanning requirements to 2 sets of 2 bars

d = Artifact():setPosition(-1700, -1200)
a:setModel("artifact3") --Any model from the model_data.lua
a:setDescription("An odd object in space...")
a:setScanningParameters(2, 2) -- Set the scanning requirements to 2 sets of 2 bars

]]


    --for asteroid_counter=1,100 do
    --    Asteroid():setPosition(random(4111, -2900), random(6578, -1578))
    --    VisualAsteroid():setPosition(random(0, 5000), random(0, 30000))
    --end


tut_state = 1




end





function update(delta)


if tut_state == 1 then
    tutimer = 1
end


tutimer = tutimer + delta
print(tutimer)
    --if tut_state == 1 then
    if tutimer > 1 then
        if tutimer < 5 then
            globalMessage("You are a janitor.")
            tut_state = 2
        end
    --end


    --if tut_state == 2 then
        if tutimer > 5 then
            --if tutimer < 20 then

            globalMessage("Never forget this.")
            tut_state = 3
            end
        end
    --end

    if tut_state == 3 then
        if tutimer > 90 then
            globalMessage("Unfortunately this is an emergency, so you need to be more.")
            tut_state = 4
        end
    end
    
    if tut_state == 4 then
        if tutimer > 120 then
            globalMessage("We need human intervention. So we woke you up.")
            tut_state = 5
    end

    if tut_state == 5 then
       if tutimer > 150 then
            globalMessage("We wouldn't want to risk bringing a Helms Officer out of hypersleep.")
            tut_state = 6

        end
    end

    if tut_state == 6 then
       if tutimer > 165 then
            globalMessage("The odds of a crew member surviving hypersleep decrease dramatically with each repetition.")
            tut_state = 7

        end
    end

    if tut_state == 7 then
       if tutimer > 190 then
            globalMessage("But enough about that. Don't worry, we'll have you back in your pod shortly.")
            tut_state = 8

        end
    end


 end           

    sollab.tut_state = 1

--Dock at sollab to get re-fitted with weapons
    if sollab.tut_state == 1 then
        if Player:isDocked(sollab) then
            -- Reconfigure the Player ship into a Wartime Technician, which has more weapon capabilities then the Technical cruiser.
            Player:setTypeName("Wartime Technician")
            Player:setBeamWeapon(0, 100, -20, 1000.0, 6.0, 10)
            Player:setBeamWeapon(1, 100,  20, 1000.0, 6.0, 10)
            Player:setBeamWeapon(2,  90, 180, 1000.0, 6.0, 10)
            Player:setWeaponTubeCount(2)
            Player:setWeaponStorageMax("Homing", 12)
            Player:setWeaponStorageMax("Nuke", 4)
            Player:setWeaponStorageMax("Mine", 8)
            Player:setWeaponStorageMax("EMP", 6)
            Player:setWeaponStorage("Homing", 12)
            Player:setWeaponStorage("Nuke", 4)
            Player:setWeaponStorage("Mine", 8)
            Player:setWeaponStorage("EMP", 6)

            sollab:sendCommsMessage(Player, [[Science station Galileo has returned with their analasis of the E.O.S Scope's data.
            
            Edge-of-space sensors picked up on sparse signals from the super-nebula in Kraylor space that indicate they have some kind of wormhole. Intelligence suggests they intend to use it to infiltrate Human space and attack us where we are defenseless!
            
            When your ship is finished being outfitted for war move up to the nebula, but be cautious. There may be traps.]])
            
            sollab.tut_state = 2
        end
    end

--[[
    Player:setTypeName("Technician Cruiser")
    Player:setBeamWeapon(0, 90,-25, 1000.0, 6.0, 10)
    Player:setBeamWeapon(0, 90, 25, 1000.0, 6.0, 10)
    Player:setWeaponTubeCount(1)
    Player:setWeaponStorageMax("Nuke", 0)
    Player:setWeaponStorageMax("Mine", 0)
--]]



    --if you dead, you lose
    if not Player:isValid() then
        victory("Exuari")
end

    if not sollab:isValid() then
        victory("Human Navy")
        return
    end

end