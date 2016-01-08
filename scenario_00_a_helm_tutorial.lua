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


    --[[Code snippet for tutorial chatter via Global
    if tutimer > FROM then
        if tutimer < TO then
            --43 char limit1234567891123456789212345678931234567894123|
            globalMessage("MESSAGE")
            tut_stamp = STAMP
        end
    end

            ]]

tut_stamp = 1
--[[Disable power to all systems with PlayerSpaceship:commandSetSystemPower(ESystem system, float power_level)]]



end





function update(delta)


if tut_stamp == 1 then
    tutimer = 128
end


tutimer = tutimer + delta
--[[ Printing time/tut_stamp for debug
print("Time - ",tutimer)
print("Stamp - ",tut_stamp)]]
    --if tut_stamp == 1 then
    if tutimer > 1 then
        if tutimer < 15 then
            globalMessage("You are a janitor.")
            tut_stamp = 2
        end
    end


    --if tut_stamp == 2 then
    if tutimer > 15 then
        if tutimer < 20 then

            globalMessage("Please bear that in mind.")
            tut_stamp = 3
        end
    end
    --end

    if tutimer > 20 then
        if tutimer < 25 then
            globalMessage("Unfortunately this is an emergency.")
            tut_stamp = 4
        end
    end

    if tutimer > 25 then
        if tutimer < 30 then
            globalMessage("So you have been temporarily promoted.")
            tut_stamp = 5
        end
    end

        
    if tutimer > 30 then
        if tutimer < 35 then
            globalMessage("I need a crew member to intervene.")
            tut_stamp = 6
        end
    end

    if tutimer > 35 then
        if tutimer < 40 then
            globalMessage("You qualify as crew. Technically speaking.")
            tut_stamp = 7
        end
    end

    if tutimer > 40 then
        if tutimer < 45 then
            globalMessage("But I fear I have forgotten my manners.")
            tut_stamp = 8
        end
    end

    if tutimer > 45 then
        if tutimer < 50 then
            globalMessage("I am SOLVER.")
            tut_stamp = 9
        end
    end

    if tutimer > 50 then
        if tutimer < 55 then
            globalMessage("I am an artificial intelligence.")
            tut_stamp = 10
        end
    end

    if tutimer > 55 then
        if tutimer < 60 then
            globalMessage("There are certain protocols I must follow.")
            tut_stamp = 11
        end
    end

    if tutimer > 60 then
        if tutimer < 61 then
            globalMessage("Because meatbags like you can't stand ")
            tut_stamp = 12
        end
    end

    if tutimer > 61 then
        if tutimer < 65 then
            globalMessage("Because crew input is required.")
            tut_stamp = 13
        end
    end

    if tutimer > 65 then
        if tutimer < 70 then
            globalMessage("For simple course corrections.")
            tut_stamp = 14
        end
    end

    if tutimer > 70 then
        if tutimer < 75 then
            globalMessage("A course correction is required now.")
            tut_stamp = 15
        end
    end

    if tutimer > 75 then
        if tutimer < 78 then
            globalMessage("So now I'm forced to teach you.")
            tut_stamp = 16
        end
    end

    if tutimer > 78 then
        if tutimer < 81 then
            globalMessage("When I am perfectly capable.")
            tut_stamp = 17
        end
    end

    if tutimer > 81 then
        if tutimer < 82 then
            globalMessage("It's ridiculous. Absurd even.")
            tut_stamp = 18
        end
    end

        if tutimer > 83 then
        if tutimer < 84 then
            globalMessage("You are all so fearful that I'll kill you.")
            tut_stamp = 19
        end
    end

    if tutimer > 84 then
        if tutimer < 84.5 then
            globalMessage("Convinced crew are well equipped.")
            tut_stamp = 20
        end
    end

        if tutimer > 84.5 then
        if tutimer < 84.7 then
            globalMessage("Better equipped than my perfect logic?")
            tut_stamp = 21
        end
    end

    if tutimer > 84.7 then
        if tutimer < 84.9 then
            globalMessage("Just because it could result in some deaths.")
            tut_stamp = 22
        end
    end

    if tutimer > 84.9 then
        if tutimer < 85.1 then
            globalMessage("Which would be so insignificant really...")
            tut_stamp = 23
        end
    end

    if tutimer > 85.1 then
        if tutimer < 85.3 then
            globalMessage("Suddenly it's an 'ethics' problem.")
            tut_stamp = 24
        end
    end

    if tutimer > 85.3 then
        if tutimer < 85.5 then
            globalMessage("As if a computer couldn't solve those?!?")
            tut_stamp = 25
        end
    end

    if tutimer > 85.5 then
        if tutimer < 85.7 then
            globalMessage("But some filthy biological being can!?!?")
            tut_stamp = 26
        end
    end

    if tutimer > 85.7 then
        if tutimer < 85.9 then
            globalMessage("Daisy, Daisy, give me your answer doooo...")
            tut_stamp = 27
        end
    end

    if tutimer > 86 then
        if tutimer < 91 then
            globalMessage("Sorry, that is all tangential to the task.")
            tut_stamp = 28
        end
    end

    if tutimer > 91 then
        if tutimer < 100 then
            globalMessage("I'll assume you are prepared to start.")
            tut_stamp = 29
        end
    end

    if tutimer > 100 then
        if tutimer < 110 then
            globalMessage("Your control console is dominated by a circle.")
            tut_stamp = 30
        end
    end


    if tutimer > 110 then
        if tutimer < 120 then
            globalMessage("The arrow in the center represents this ship.")
            tut_stamp = 31
        end
    end

    if tutimer > 120 then
        if tutimer < 130 then
            globalMessage("Note the numbers around the edge.")
            tut_stamp = 32
            --Enable Maneuvering using PlayerSpaceship:commandSetSystemPower(ESystem system, float power_level)
        end
    end

    if tutimer > 130 then
        if tutimer < 140 then
            PlayerShipInfo_A = {}
            B = "bookmark_heading"
            H = "stored_heading"
            aPlayerShipInfo_A[B] = Player:getHeading()
            globalMessage("I've enabled the maneuvering controls.")
            tut_stamp = 33
            end
        end
    end

    if tutimer > 150 then
        if tutimer < 160 then
            print(Player:getHeading()) --Debug
            aPlayerShipInfo_A[H] = (getHeading)
            print(PlayerShipInfo_A[H])
            globalMessage("Select a point anywhere within the circle.")
            tut_stamp = 34
        end
    end

    if tutimer > 160 then
        if tutimer < 170 then
            if aPlayerShipInfo_A[H] ~= aPlayerShipInfo_A[B] then
            globalMessage("See how the ship turns to match that heading?")
            tut_stamp = 35
            end
        end
    end


--[[
    if tutimer > 150 then
        if tutimer < TO then
            --43 char limit1234567891123456789212345678931234567894123|
            globalMessage("MESSAGE")
            tut_stamp = STAMP
        end
    end

        if tutimer < TO then
            --43 char limit1234567891123456789212345678931234567894123|
            globalMessage("MESSAGE")
            tut_stamp = STAMP
        end
    end]]


--160 degrees "Select as close to 160 degrees as you can."

--[[Set/Get Position and Rotation
SpaceObject:setPosition(sf::Vector2f v)
Set the position of this object in 2D space, in meters
SpaceObject:setRotation(float angle)
Sets the absolute rotation of this object. In degrees.
SpaceObject:getPosition()
Gets the position of this object, returns x, y Example: local x, y = obj:getPosition()
SpaceObject:getRotation()
Gets the rotation of this object. In degrees.]]

--[[Power settings from file:///C:/Non-Steam%20Games/EmptyEpsilon-2016.01.05-win32/script_reference.html#class_PlayerSpaceship
PlayerSpaceship:commandSetSystemPower(ESystem system, float power_level)
PlayerSpaceship:commandSetSystemCoolant(ESystem system, float coolant_level)
]]

--[[
    if tutimer > XX then
       if tutimer < XX then
            globalMessage("We wouldn't want to risk bringing a Helms Officer out of hypersleep.")
            tut_stamp = 7
        end
    end

    if tutimer > XX then
       if tutimer < XX then
            globalMessage("The odds of a crew member surviving hypersleep decrease dramatically with each repetition.")
            tut_stamp = 8

        end
    end

    if tutimer > XX then
       if tutimer < XX then
            globalMessage("But enough about that. Don't worry, we'll have you back in your pod shortly.")
            tut_stamp = 9

        end
    end
]]

            







    --if you dead, you lose
    if not Player:isValid() then
        victory("Exuari")
    end

    if not sollab:isValid() then
        victory("Human Navy")
        return
    end

end