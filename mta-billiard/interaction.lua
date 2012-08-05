addEvent("setPedAnimation", true)
addEventHandler("setPedAnimation", root, function(block,anim,time,loop,updatePosition,interruptable, freezeLastFrame)
	time, loop, updatePosition, interruptable, freezeLastFrame = time or -1, loop and true or false, updatePosition and true or false, interruptable and true or false, freezeLastFrame and true or false
--	bool setPedAnimation ( ped thePed [, string block=nil, string anim=nil, int time=-1, bool loop=true, bool updatePosition=true, bool interruptable=true, bool freezeLastFrame = true] )
	setPedAnimation(source, block, anim, time, loop, updatePosition, interruptable, freezeLastFrame)

end)

-- sends message to players near source
addEvent("broadcastCaptionedEvent", true)
addEventHandler("broadcastCaptionedEvent", root, function(descr, lifetime, range, includesource)
    if (not source or not isElement(source)) then return end

    local x,y,z=getElementPosition(source)
    local area=createColSphere(x,y,z,range)
    local players=getElementsWithinColShape(area, "player")
    for i,v in ipairs(players) do
	if ((includesource or (source~=v)) and getElementInterior(v)==getElementInterior(source) and getElementDimension(v)==getElementDimension(source)) then
	    outputChatBox("* " .. descr, v)
	end
    end
    destroyElement(area)
end)