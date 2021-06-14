-- just test joints turning by 40823124
function moving1()

    sim.setJointTargetPosition(joint1,45*math.pi/180)
    sim.setJointTargetPosition(joint2,-45*math.pi/180)

    
end
function moving2()

    sim.setJointTargetPosition(joint1,-45*math.pi/180)
    sim.setJointTargetPosition(joint2,45*math.pi/180)

    
end


function sysCall_threadmain()
    
    t=5
    joint1=sim.getObjectHandle('joint1')
    joint2=sim.getObjectHandle('joint2')
    sim.setJointTargetPosition(joint1,0)
    sim.setJointTargetPosition(joint2,0)

    sim.wait(t)
    while sim.getSimulationState()~=sim.simulation_advancing_abouttostopre do
        moving1()
        sim.wait(t)
        moving2()
        sim.wait(t)
        sim.setJointTargetPosition(joint1,0)
        sim.setJointTargetPosition(joint2,0)
        sim.wait(t)
    end

end