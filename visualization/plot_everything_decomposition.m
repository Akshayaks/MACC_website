all clear
linkdata off
structure = zeros(7,7); 
mobile_agents = zeros(7,7); 
agent_carr = zeros(7,7);
scaffolding_black = zeros(7,7);
all_structures = load('/opt/gurobi952/linux64/examples/python/Exact-Approach/test.mat');
display('Loaded all structures');
structure_to_be_built = zeros(7,7);
plotcube_use(structure, structure_to_be_built, mobile_agents, agent_carr, scaffolding_black,1,1,0)
found = 1;

for i = 7:99
%     if i == 92
%         continue
%     end
    structure = zeros(7,7);
    structure_to_be_built = all_structures.('S'+string(i));
    filename = 'new_7x7_decomp_random_'+string(i)+'.gif';
    display(filename);
    ts = 1;
    for j = 0:20
        
        found = 1;
        for t=1:40
            display('t = '+string(t-1));
            if found == 0
                break
            end
            display('found not 0');
            mobile_agents=zeros(7,7);
            agent_carr=zeros(7,7);
            
            found = 0;
            fid = fopen('/opt/gurobi952/linux64/examples/python/Exact-Approach/7x7_decomp_removing_scaff_input_sequencing/random_'+string(i)+'_'+string(j)+'.txt');
            if fid == -1
                display('Finished all substructures');
                break;
            end
            while ~feof(fid)
                thisline = fgetl(fid);
                ip = thisline(2:end-1);
        
                input = strsplit(ip,",");
                
%                 display('ip: '+string(ip));
%                 display('time: '+string(str2double(cell2mat(input(1)))));
        
                if str2double(cell2mat(input(1))) == t-1
                    found = 1;
%                     display('Timestep match '+string(t-1));
                    action = input(6);
                    if strcmp(action{1}(3),'M') == 1
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
                    end
                end
            end
 
            %plot from the loaded
            plotcube_use(structure, structure_to_be_built, mobile_agents, agent_carr, scaffolding_black,i,j,t)
   
            %write the data to a gif
            frame = getframe(gcf);
            im{ts} = frame2im(frame);
            [A,map] = rgb2ind(im{ts},256);
            if ts == 1
                imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',1.5);
            else
                imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',1.5);
            end
            ts = ts + 1;
%             display('displayed one timestep');
%           saveas(gcf,int2str(t)+".jpg");
%             pause(2)
    
            close
        end
    end
end