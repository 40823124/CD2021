function moving(x,y)
  
    a1=0.4861386976
    a2=0.3819028766

    if x>0 and y>0 then
 		r=x^2+y^2
  		q2=math.deg(math.acos((r-a1^2-a2^2)/(2*a1*a2)))
  		s2=math.sin(math.rad(q2))
  		c2=math.cos(math.rad(q2))
 		q1=math.deg(math.atan(y/x)-math.atan((a2*s2)/(a1+a2*c2)))
 	end
 		
  	if x<0 and y<0 then
  		q2 = -math.deg(math.acos((x^2+y^2-a1^2-a2^2)/(2*a1*a2)))
  		q1 = math.deg(math.atan2(y, x) + math.atan2((a2*math.sin(q2)), (a1+a2*math.cos(q2))))
       
  	end
  	
  	print(q1)
  	print(q2)

    sim.setJointTargetPosition(joint1,q1*math.pi/180)
    sim.setJointTargetPosition(joint2,q2*math.pi/180)
    
end

function pick_and_place(x,y)
    sim.setIntegerSignal("pad_switch",0)
    moving(x,y)
    sim.wait(t)
    sim.setIntegerSignal("pad_switch",1)
    sim.setJointTargetPosition(joint4,-0.060)
    sim.wait(t)
    sim.setJointTargetPosition(joint4,0)
    sim.wait(t)
end

function sysCall_threadmain()
    t=5
    joint1=sim.getObjectHandle('joint1')
    joint2=sim.getObjectHandle('joint2')
    joint4=sim.getObjectHandle('joint4')

    sim.setIntegerSignal("pad_switch",1)

    while sim.getSimulationState()~=sim.simulation_advancing_abouttostopre do

        x=0.2
        y=0.7
        moving(x,y)
        sim.wait(t)
        pick_and_place(x,y)
        sim.wait(t)
        x=-0.3
        y=-0.55
        moving(x,y)
        sim.wait(t)
        pick_and_place(x,y)
        sim.wait(t)
        
    end
end