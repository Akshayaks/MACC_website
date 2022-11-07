function plotcube_use(structure, structure_to_be_built, mobile_agents, agent_carr, scaffolding_black,i,j,t) %t)
s=7;
% display('t: '+string(t));

for c = 1:s
    for r = 1:s
        h=structure(c,r);
        if h>0
            for k = 0:h-1
                plotcube([1 1 1],[c r k],1,[0.5 0.5 0.8],i,j,t);
            end
        end
    end
end

for c = 1:s
    for r = 1:s
        h=structure_to_be_built(c,r);
        if h>0
            for k = 0:h-1
                plotcube([1 1 1],[c r k],0.1,[0.5 0.5 0.8],i,j,t);
            end
        end
    end
end

% display("hiiiiiiii");
for c = 1:s
    for r = 1:s
        h=mobile_agents(c,r);
        s_h=structure(c,r);
        if h>0
            for k = 0:h-1
                plotcube([1 1 1],[c r 0+s_h+k],1,[0.9 0.5 0.5],i,j,t);
            end
        end
    end
end

for c = 1:s
    for r = 1:s
        h=agent_carr(c,r);
        s_h=structure(c,r);
        m_h=mobile_agents(c,r);
        if h>0
            for k = 1:h
%                  display(k+m);
                 plotcube([1 1 1],[c r 0+m_h+s_h],1,[0.25 0.25 1.0],i,j,t);
%                  0.1,[0.9 0.1 0.1],i,j,t);
            end
        end
    end
end

for c = 1:s
    for r = 1:s
        h=scaffolding_black(c,r);
        if h>0
            for k = 1:h
                plotcube([1 1 1],[c r k],1,[0.2 0.2 0.3],i,j,t);
            end
        end
    end
end


%defining the edges of the map
plotcube([0 0 0],[1 1 1],1,[1 1 1],i,j,t);
plotcube([0 0 0],[1 s 1],1,[1 1 1],i,j,t);
plotcube([0 0 0],[s 1 1],1,[1 1 1],i,j,t);
plotcube([0 0 0],[s s 1],1,[1 1 1],i,j,t);
plotcube([0 0 0],[1 1 6],1,[1 1 1],i,j,t);
plotcube([0 0 0],[1 s 6],1,[1 1 1],i,j,t);
plotcube([0 0 0],[s 1 6],1,[1 1 1],i,j,t);
plotcube([0 0 0],[s s 6],1,[1 1 1],i,j,t);


