function sysCall_init() 
    b1=sim.getObjectHandle('joint1')
    m1=sim.getObjectHandle('joint2')
    s1=sim.getObjectHandle('joint4')
    suctionPad=sim.getObjectHandle('suctionPad')
    BaseFrame=sim.getObjectHandle("BaseFrame")
    block =sim.getObjectHandle("BOX")
    r1 = 0
    r2 = 0
    d3 = 0
    deg = math.pi/180
end
function sysCall_actuation() 

    message, auxiliaryData=sim.getSimulatorMessage()
        while message ~= -1 do
            key=auxiliaryData[1]
            if (message==sim.message_keypress) then
                if (auxiliaryData[1]==101) then 
                    --press e to open the suctionpad
sim.setScriptSimulationParameter(sim.getScriptAssociatedWithObject(suctionPad),'active','true')
                end 
                
                if (auxiliaryData[1]==113) then 
                    --press q to close the suctionpad
sim.setScriptSimulationParameter(sim.getScriptAssociatedWithObject(suctionPad),'active','false')
                end 
                
                if (auxiliaryData[1]==068) then 
                    --press D to turn joint1
                     r1 = r1 + 5*deg
                     sim.setJointPosition(b1, r1)
                end 
                if (auxiliaryData[1]==065) then 
                    --press A to turn joint1
                     r1 = r1  - 5*deg
                     sim.setJointPosition(b1, r1)
                end 
                if (auxiliaryData[1]==100) then 
                    --press d to turn joint2
                     r2 = r2 + 5*deg
                     sim.setJointPosition(m1, r2)
                end 
                if (auxiliaryData[1]==097) then 
                    -- press a to turn joint2
                     r2 = r2 - 5*deg
                     sim.setJointPosition(m1, r2)
                end 
                if (auxiliaryData[1]==119) then 
                    --press s to control joint4
                     d3 =-0.058
                     sim.setJointPosition(s1, d3)
                end 
                if (auxiliaryData[1]==115) then 
                    --press w to control joint4
                     sim.setJointPosition(s1, 0)
                end 
                
           end  
    message, auxiliaryData=sim.getSimulatorMessage()
        end 
end 

