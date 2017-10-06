local composer = require("composer")

local scene = composer.newScene()

local options = {
	effect = "fade",
	time = 500
}

pinPizRam = string.byte("Pineapple", 2) + string.byte("Pizza", 2) + string.byte("Ramen", 2)

local function myTouchListener( event )
	if (event.phase == "began") then
		event.target:scale( 1.1, 1.1);
		
	elseif (event.phase =="ended") then
		local options = {
			effect = "fade",
			time = 500
		}
		composer.gotoScene("Recipe", options)
		composer.removeScene("StoR", true)
	end
end

--[[
local function myTouchListener( event )
	local flag = true
	if (event.phase == "began") then
		--event.target:scale(1.1,1.1)
	elseif (event.phase == "moved") then
		if event.target.flag == false then
			--event.target:setFillColor(105,105,105)
		else
			--event.target:setFillColor(0,0,1)
		end
		
		--event.target:scale(0.909,0.909)
	
	elseif (event.phase == "ended") then
		--event.target:scale(0.909,0.909)
		if Add.flag == true then
			local sumStr
			event.target.flag = true
			for k, v in ipairs(tabNames) do
				if v == event.target.name then 
					flag = false
					tabNums[k] = tabNums[k] + 1
				end
			end
			if flag then
				table.insert(tabNames, event.target.name)
				table.insert(tabNums, 1)				
			end
			for k, v in ipairs(tabNames) do
				print(v, tabNums[k])
				if sumStr == nil then
					sumStr = string.byte(v, 2)
				else
					sumStr = sumStr + string.byte(v, 2)
				end
			end
			if sumStr == pinPizPop then
				print("pinPizPop")
			elseif sumStr == pinPizRam then
				print("pinPizRam")
			elseif sumStr == pinRamPop then
				print("pinRamPop")
			end
		else
			if next(tabNames) then
				for k, v in ipairs(tabNames) do
					if v == event.target.name then
						if tabNums[k] == 1 then
							table.remove(tabNames, k)
							table.remove(tabNums, k)

							--event.target:setFillColor(105,105,105)
							event.target.flag = false
						else
							tabNums[k] = tabNums[k] - 1

							--event.target:setFillColor(0,0,1)
						end
					else
						--event.target:setFillColor(105,105,105)
					end
				end
				for k, v in ipairs(tabNames) do
					print(v, tabNums[k])
				end
			else 
				--event.target:setFillColor (105,105,105)
			end
		end
	end
  end

local function addTouch( event )
	if (event.phase == "began") then
		Add:setFillColor(1,0,0)
	elseif (event.phase == "moved") then
		if event.target.flag == false then
			event.target:setFillColor(105,105,105)
		else
			event.target:setFillColor(0,0,1)
		end
	elseif (event.phase == "ended") then
		if Add.flag == false then
			Add.flag = true
			Add:setFillColor(0,0,1)

			Rem.flag = false
			Rem:setFillColor(105,105,105)
		end
	end
end

local function remTouch( event )
	if (event.phase == "began") then
		Rem:setFillColor(1,0,0)
	elseif (event.phase == "moved") then
		if event.target.flag == false then
			event.target:setFillColor(105,105,105)
		else
			event.target:setFillColor(0,0,1)
		end
	elseif (event.phase == "ended") then
		if Rem.flag == false then
			Rem.flag = true
			Rem:setFillColor(0,0,1)

			Add.flag = false
			Add:setFillColor(105,105,105)
		end
	end
end

--]]

function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end

function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

	background = display.newImage("BackFridge.png", display.contentCenterX, display.contentCenterY)
	sceneGroup:insert (background)

	pineapple = display.newImage("Pineapple.png")
	pineapple.x=60
	pineapple.y=140
	pineapple.alpha = 1
	pineapple.name = "pineapple"
	pineapple.flag = true
	sceneGroup:insert (pineapple)
	
	ramen = display.newImage("Ramen.png", 100, 100)
	ramen.x=150
	ramen.y=140
	ramen.alpha = 1
	ramen.name = "ramen"
	ramen.flag = true
	sceneGroup:insert (ramen)

	popcorn = display.newImage("Popcorn.png")
	popcorn.x=250
	popcorn.y=130
	popcorn.alpha = 0.5
	popcorn.name = "popcorn"
	popcorn.flag = true
	sceneGroup:insert (popcorn)

	pizza = display.newImage("Pizza.png")
	pizza.x=150
	pizza.y=350
	pizza.alpha = 1
	pizza.name = "pizza"
	pizza.flag = true
	sceneGroup:insert (pizza)
	
	newRecipe = display.newRect(display.contentCenterX, display.contentCenterY, 240, 240)
	newRecipe:setFillColor(0.8, 0.8, 0.8)
	newRecipe.strokeWidth = 6;
	newRecipe:addEventListener ("touch", myTouchListener)
	sceneGroup:insert (newRecipe)
	
	local options = {
		text = "New recipe found!",
		x = display.contentCenterX,
		y = display.contentCenterY,
		width = 220,
		height = 220,
		fontSize = 40,
		align = "center"
	}
	
	txtNR = display.newText (options)
	txtNR:setFillColor(0,0,0)
	sceneGroup:insert(txtNR)

	--[[
	local options = {
		text = "Add",
		x = 80,
		y = 455,
		width = 140,
		height = 40,
		fontSize = 36,
		align = "center"
	}

	Add = display.newRect(80, 455, 150, 40);
	Add.strokeWidth = 6;
	Add:setFillColor(0,0,1);
	Add.alpha = 0.45
	Add.isSensor = true;
	Add.flag = true;
	Add:addEventListener( "touch", addTouch )
	sceneGroup:insert(Add)

	txtAdd = display.newText(options)
	txtAdd:setFillColor(0,0,0)
	sceneGroup:insert(txtAdd)

	Rem = display.newRect(240, 455, 150, 40);
	Rem.strokeWidth = 6;
	Rem:setFillColor(105,105,105);
	Rem.alpha = 0.45
	Rem.isSensor = true;
	Rem.flag = false;
	Rem:addEventListener( "touch", remTouch )
	sceneGroup:insert(Rem)

	options.text = "Remove"
	options.x = 240

	txtRem = display.newText(options)
	txtRem:setFillColor(0,0,0)
	sceneGroup:insert(txtRem)	

	Menu = display.newRect(160, 20, 300, 30)
	Menu:setFillColor(1,1,1)
	Menu.alpha = 0.5
	Menu:addEventListener("touch", menuTouch)
	sceneGroup:insert(Menu) 
	
	options.text = "Menu"
	options.x = 160
	options.y = 20
	options.width = 300
	options.height = 30
	options.fontSize = 26
	
	txtMenu = display.newText(options)
	txtMenu:setFillColor(0,0,0)
	sceneGroup:insert(txtMenu)
	--]]
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end

function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end

function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene