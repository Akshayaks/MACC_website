all clear
linkdata off
% plot_workspace(5,5);
structure=zeros(7,7); %user specified structure 
mobile_agents=zeros(7,7); 
agent_carr=zeros(7,7); %block carried by the agent
scaffolding_black=zeros(7,7); %extra scaffolding placed by the agent
structure_to_be_built=zeros(7,7);
plotcube_use(structure, structure_to_be_built, mobile_agents, agent_carr, scaffolding_black,0,0,0)
%gif('myfile.gif')
filename = 'solar_panel2.gif';

structure = [[0,0,0,0,0,0,0]
             [0,0,0,0,0,0,0]
             [0,0,3,1,1,0,0]
             [0,0,1,1,0,0,0]
             [0,0,1,0,0,0,0]
             [0,0,0,0,0,0,0]
             [0,0,0,0,0,0,0]]

% structure = [[0,0,0,0,0,0,0,0,0, 0]
%             [0,0,0,0,0,0,0,0,0, 0]
%             [0,1,0,1,0,0,1,0,1, 0]
%             [0,1,0,1,0,0,1,0,1, 0]
%             [0,1,0,1,0,0,1,0,1, 0]
%             [0,1,1,1,1,1,1,1,1, 0]
%             [0,1,0,1,0,0,1,0,1, 0]
%             [0,1,0,1,0,0,1,0,1, 0]
%             [0,1,0,1,0,0,1,0,1, 0] 
%             [0,0,0,0,0,0,0,0,0, 0]];
% 
% display(structure);
% pause(7);

for t=1:10
    mobile_agents=zeros(7,7); %needs to be reassigned every loop
    agent_carr=zeros(7,7); %needs to be reassigned everyloop
%     structure=zeros(10,10);
%     fid = fopen('/opt/gurobi952/linux64/examples/python/Exact-Approach/solar_panel_2_input_sequence.txt','rt');
    fid = fopen('/home/akshaya/Downloads/multi-agent-collaborative-construction/visualization/running_exp_input.txt');
    if fid == -1
        error('Author:Function:OpenFile', 'Cannot open file: %s', 'out_simple_test_input_sequence.txt');
    end
    while ~feof(fid)
        thisline = fgetl(fid);
        ip = thisline(2:end-1);
        
        input = strsplit(ip,","); 
        
        if str2double(cell2mat(input(1))) == t-1
            display(ip);
            display("Timestep matches");
%             pause(5);
            action = input(6);
            display(str2double(input(1)));
            if strcmp(action{1}(3),'M') == 1
                display("Robot moving");
%                 pause(5);
                if str2double(cell2mat(input(9))) == -2
                    continue
                end
                mobile_agents(str2double(input(7))+1,str2double(input(8))+1) = 1;
                if str2double(cell2mat(input(5))) == 1
                    agent_carr(str2double(input(7))+1,str2double(input(8))+1) = 1;
                end
            end
            if strcmp(action{1}(3),'P') == 1
                mobile_agents(str2double(input(2))+1,str2double(input(3))+1) = 1;
                agent_carr(str2double(input(2))+1,str2double(input(3))+1) = 1;
                structure(str2double(input(7))+1,str2double(input(8))+1) = structure(str2double(input(7))+1,str2double(input(8))+1) - 1;
            end
            if strcmp(action{1}(3),'D') == 1
%                 display(str2double(input(7)));
%                 display(str2double(input(8)));
                
                display(structure(str2double(input(7))+1,str2double(input(8))+1));
                mobile_agents(str2double(input(2))+1,str2double(input(3))+1) = 1;
                structure(str2double(input(7))+1,str2double(input(8))+1) = structure(str2double(input(7))+1,str2double(input(8))+1) + 1;
                display(structure(str2double(input(7))+1,str2double(input(8))+1));
                display(structure);
            end
        end
    end
%     display(mobile_agents);
    display(structure);
%     pause(10);
 
    %plot from the loaded
    plotcube_use(structure, structure_to_be_built, mobile_agents, agent_carr, scaffolding_black,0,1,t)
   
    %write the data to a gif
    frame = getframe(gcf);
    
%     text(10,11,'time = '+string(t),'FontSize',14);
    im{t} = frame2im(frame);
    insertText(im{t}, [1,1], 'Peppers are good for you!');
    [A,map] = rgb2ind(im{t},256);
    if t == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',2.0);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',2.0);
    end
    saveas(gcf,int2str(t)+".jpg");
%     pause(1)
    
    close
end
