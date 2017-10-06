-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")

local scene = composer.newScene()



local function myTouchListener( event )
	if (event.phase == "began") then
		event.target:scale( 1.1, 1.1);
	elseif (event.phase =="ended") then
		event.target:scale( .909,.909);
	end
end

local function touchPrev ( event )
	if (event.phase == "ended") then
		local options = {
			effect = "fade",
			time = 500
		}
		
		composer.gotoScene("Stock", options)
		composer.removeScene("Fridge2", true)
	end
end
	
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
	sceneGroup:insert(background)
	
	bread = display.newImage("bread.png")
	bread.x=60
	bread.y=140
	bread:addEventListener( "touch", myTouchListener )
	sceneGroup:insert(bread)

	butter = display.newImage("butter.png", 100, 100)
	butter.x=150
	butter.y=140
	butter:addEventListener( "touch", myTouchListener )
	sceneGroup:insert(butter)

	cheese = display.newImage("cheese.png")
	cheese.x=250
	cheese.y=130
	cheese:addEventListener( "touch", myTouchListener )
	sceneGroup:insert(cheese)

	popsicle = display.newImage("popsicle.png")
	popsicle.x=30
	popsicle.y=365
	popsicle:addEventListener( "touch", myTouchListener )
	sceneGroup:insert(popsicle)

	stack = display.newImage("stack.png")
	stack.x=125
	stack.y=325
	stack:addEventListener( "touch", myTouchListener )
	sceneGroup:insert(stack)

	drpush = display.newImage("drpush.png")
	drpush.x=75
	drpush.y=350
	drpush:addEventListener( "touch", myTouchListener )
	sceneGroup:insert(drpush)

	sunpop = display.newImage("sunpop.png")
	sunpop.x=155
	sunpop.y=375
	sunpop:addEventListener( "touch", myTouchListener )
	sceneGroup:insert(sunpop)

	pb = display.newImage("pb.png")
	pb.x=208
	pb.y=350
	pb:addEventListener( "touch", myTouchListener )
	sceneGroup:insert(pb)

	jelly = display.newImage("jelly.png")
	jelly.x=248
	jelly.y=350
	jelly:addEventListener( "touch", myTouchListener )
	sceneGroup:insert(jelly)
	
	Prev = display.newImage("arrowflip.png")
	Prev.x = 40
	Prev.y = 278
	Prev:addEventListener("touch", touchPrev)
	sceneGroup:insert(Prev)

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