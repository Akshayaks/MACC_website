all clear
linkdata off
structure = zeros(7,7); 
mobile_agents = zeros(7,7); 
agent_carr = zeros(7,7);
scaffolding_black = zeros(7,7);
structure_to_be_built = zeros(7,7);
all_structures = load('/opt/gurobi952/linux64/examples/python/Exact-Approach/test.mat');
plotcube_use(structure, structure_to_be_built, mobile_agents, agent_carr, scaffolding_black,1,1,0)
found = 1;

for i = 56:85
    if i == 28 || i == 29
        continue
    end
    filename = 'random_'+string(i)+'.gif';
    display(filename);
    structure = zeros(7,7);
    structure_to_be_built = all_structures.('S'+string(i));
    mobile_agents = zeros(7,7);
    agent_carr = zeros(7,7);
    found = 1;
    
    for t=1:40
        if found == 0
%             display('Read all timesteps');
            break
        end
        mobile_agents=zeros(7,7);
        agent_carr=zeros(7,7);

        fid = fopen('/opt/gurobi952/linux64/examples/python/Exact-Approach/7x7_input_sequences/random_'+string(i)+'.txt');
        if fid == -1
            error('Author:Function:OpenFile', 'Cannot open file');
        end
        found = 0;
        while ~feof(fid)
            thisline = fgetl(fid);
            ip = thisline(2:end-1);
        
            input = strsplit(ip,","); 
        
            if str2double(cell2mat(input(1))) == t-1
                found = 1;
%                 display(ip);
%                 display("Timestep matches");
                action = input(6);
%                 display(str2double(input(1)));
                if strcmp(action{1}(3),'M') == 1
%                     display("Robot moving");
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
                    mobile_agents(str2double(input(2))+1,str2double(input(3))+1) = 1;
                    structure(str2double(input(7))+1,str2double(input(8))+1) = structure(str2double(input(7))+1,str2double(input(8))+1) + 1;
%                     display(structure(str2double(input(7))+1,str2double(input(8))+1));
%                     display(structure);
                end
            end
        end
 
        %plot from the loaded
        plotcube_use(structure, structure_to_be_built, mobile_agents, agent_carr, scaffolding_black,i,0,t)
   
        %write the data to a gif
        frame = getframe(gcf);
%       text(10,11,'time = '+string(t),'FontSize',14);
        im{t} = frame2im(frame);
        [A,map] = rgb2ind(im{t},256);
        if t == 1
            imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',1.5);
        else
            imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',1.5);
        end
%         saveas(gcf,int2str(t)+".jpg");
%         pause(10)
    
        close
    end
end



