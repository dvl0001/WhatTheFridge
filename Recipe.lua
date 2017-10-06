local composer = require("composer")

local scene = composer.newScene()


		
function scene:create( event )
 
	local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end

function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

		local background = display.newImage("recipepage.png", display.contentCenterX, display.contentCenterY)

		local path = system.pathForFile( "Recipe.txt", system.DocumentsDirectory )
		sumString = ""

		-- Open the file handle
		local file, errorString = io.open( path, "r" )

		if not file then
			-- Error occurred; output the cause
			print( "File error: " .. errorString )
		else
			-- Output lines
			for line in file:lines() do
				print( line )
				--display.newText("[[\n\n]]", display.contentCenterX, 50, native.systemFont, 15);
				if (sumString==nil)then
				sumString=line
				else
				sumString=sumString.."\n"..line
				end
				
				--newText:setFillColor( 0, 0.5, 1 )
				--display.newText("[[\n\n]]", display.contentCenterX, 50, native.systemFont, 15);
				--display.newText("[[\nline\n]], display.contentCenterX, 50, native.systemFont, 15);s
				--display.newText("\nline\n", display.contentCenterX, 50, native.systemFont, 15);

				
			end
			rcp = display.newText(sumString,display.contentCenterX, display.contentCenterY, native.systemFont, 14)
			rcp.width = 250
			rcp:setFillColor(0,0,0)
			
			--for line in file:lines()do
			--display.newText(line, display.contentCenterX, 50, native.systemFont, 15);
			--end
		-- Close the file handle
			io.close( file )
		end
		
		file = nil
	
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