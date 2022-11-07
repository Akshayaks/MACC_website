all clear
linkdata off
% plot_workspace(5,5);
structure=zeros(10,10) %user specified structure 
mobile_agents=zeros(10,10) 
agent_carr=zeros(10,10) %block carried by the agent
scaffolding_black=zeros(10,10) %extra scaffolding placed by the agent
plotcube_use(structure, mobile_agents, agent_carr, scaffolding_black)
%gif('myfile.gif')
filename = 'Animation_decomposition.gif';
% points =
% [5,3,5,4,5,5,5,5,5,4,5,5,6,4,7,4,6,4,5,4,6,5,6,6,6,5,6,4,6,7,6,6,6,5];
% instance 6

% points = [3,3,3,4,3,3,3,5,3,4,3,3,3,6,3,7,3,8,3,8,3,7,3,8,4,3,5,3,6,3,6,4,6,5,6,5,6,4,7,3,8,3,6,5,8,3,
for t=1:17
    mobile_agents=zeros(10,10); %needs to be reassigned every loop
    agent_carr=zeros(10,10); %needs to be reassigned everyloop
%     structure=zeros(10,10);
    %plotcube_use(structure, extra_structure, removed_structure)
    structure(points(2*t-1),points(2*t)) = structure(points(2*t-1),points(2*t)) + 1;
    
%     if t==15
%         structure(4,4) = 2;
%         structure(4,5) = 2;
%     end
 
    %plot from the loaded
    plotcube_use(structure, mobile_agents, agent_carr, scaffolding_black)
   
    %write the data to a gif
    frame = getframe(gcf);
    im{t} = frame2im(frame);
    [A,map] = rgb2ind(im{t},256);
    if t == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.8);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.8);
    end
%     pause(5)
    
    close
end
