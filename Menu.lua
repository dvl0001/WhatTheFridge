local composer = require("composer")

local scene = composer.newScene()

local options = {
	effect = "fade",
	time = 500
}

local function stockTouch ( event )
	if event.phase == "ended" then
		composer.gotoScene("Stock", options)
		composer.removeScene("Menu", true)
	end
end

function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

	tabNames = {}
	tabNums = {}
 
end

function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

	menuback = display.newImage("food8bit.jpg", display.contentCenterX, display.contentCenterY)
	sceneGroup:insert(menuback)

	Stock = display.newImage("WhatTheFridge.png", display.contentCenterX, display.contentCenterY)
	Stock.width = Stock.width/2
	Stock.height = Stock.height/2
	Stock:addEventListener("touch", stockTouch)
	sceneGroup:insert(Stock)
	
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