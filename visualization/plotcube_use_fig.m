function plotcube_use_fig(structure, structure_to_be_built, mobile_agents, agent_carr) %t)
s=7;
% display('t: '+string(t));

plotcube_fig([1 1 1],[3 3 2],1,[0.8 0.5 0.8]);
plotcube_fig([1 1 1],[3 3 0],1,[0.8 0.5 0.8]);
plotcube_fig([1 1 1],[3 3 1],1,[0.8 0.5 0.8]);
plotcube_fig([1 1 1],[3 4 0],1,[0.8 0.5 0.8]);
plotcube_fig([1 1 1],[3 5 0],1,[0.8 0.5 0.8]);
plotcube_fig([1 1 1],[4 3 0],1,[0.8 0.5 0.8]);
plotcube_fig([1 1 1],[4 4 0],1,[0.8 0.5 0.8]);
plotcube_fig([1 1 1],[5 3 0],1,[0.8 0.5 0.8]);

% plotcube_fig([1 1 1],[3 4 1],0.5,[0.4 0.4 0.1]);

plotcube_fig([1 1 1],[3 5 2],1,[0.8 0.4 0.3]);
plotcube_fig([1 1 1],[3 5 1],1,[0.8 0.4 0.3]);
plotcube_fig([1 1 1],[4 5 0],1,[0.8 0.4 0.3]);
plotcube_fig([1 1 1],[5 5 0],1,[0.8 0.4 0.3]);

plotcube_fig([1 1 1],[5 3 2],1,[0.2 0.4 0.8]);
plotcube_fig([1 1 1],[5 3 1],1,[0.2 0.4 0.8]);
plotcube_fig([1 1 1],[5 4 0],1,[0.2 0.4 0.8]);

plotcube_fig([1 1 1],[5 5 2],1,[0.2 0.4 0.8]);
plotcube_fig([1 1 1],[5 5 1],1,[0.2 0.4 0.8]);


plotcube_fig([1 1 1],[4 4 1],1,[0.2 0.4 0.8]);


% plotcube_fig([1 1 1],[2 2 1],1,[0.8 0.1 0.1]);
% plotcube_fig([1 1 1],[2 2 0],1,[0.8 0.1 0.1]);
% plotcube_fig([1 1 1],[2 3 0],1,[0.8 0.1 0.1]);
% plotcube_fig([1 1 1],[3 2 0],1,[0.8 0.1 0.1]);



% plotcube_fig([1 1 1],[5 8 0],1,[0.8 0.1 0.1]);
% plotcube_fig([1 1 1],[4 7 0],1,[0.8 0.1 0.1]);
% plotcube_fig([1 1 1],[3 6 0],1,[0.8 0.1 0.1]);
% plotcube_fig([1 1 1],[7 6 0],1,[0.8 0.1 0.1]);
% plotcube_fig([1 1 1],[6 7 0],1,[0.8 0.1 0.1]);
% 
% plotcube_fig([1 1 1],[2 4 1],1,[0.1 0.8 0.1]);
% plotcube_fig([1 1 1],[2 4 0],1,[0.1 0.8 0.1]);
% plotcube_fig([1 1 1],[3 4 0],1,[0.1 0.8 0.1]);
% plotcube_fig([1 1 1],[7 4 0],1,[0.1 0.8 0.1]);
% plotcube_fig([1 1 1],[7 5 1],1,[0.1 0.8 0.1]);
% plotcube_fig([1 1 1],[8 5 0],1,[0.1 0.8 0.1]);
% 
% plotcube_fig([1 1 1],[3 3 1],1,[0.1 0.8 0.8]);
% plotcube_fig([1 1 1],[3 3 0],1,[0.1 0.8 0.8]);
% plotcube_fig([1 1 1],[4 3 0],1,[0.1 0.8 0.8]);
% plotcube_fig([1 1 1],[7 6 1],1,[0.1 0.8 0.8]);
% plotcube_fig([1 1 1],[7 7 0],1,[0.1 0.8 0.8]);
% plotcube_fig([1 1 1],[8 6 0],1,[0.1 0.8 0.8]);
% 
% plotcube_fig([1 1 1],[4 2 1],1,[0.8 0.8 0.1]);
% plotcube_fig([1 1 1],[4 2 0],1,[0.8 0.8 0.1]);
% plotcube_fig([1 1 1],[4 3 0],1,[0.8 0.8 0.1]);

% plotcube_fig([1 1 1],[4 4 1],1,[0.8 0.1 0.8]);
% plotcube_fig([1 1 1],[4 4 0],1,[0.8 0.1 0.8]);
% plotcube_fig([1 1 1],[4 8 0],1,[0.8 0.1 0.8]);
% 
% plotcube_fig([1 1 1],[7 4 1],1,[0.6 0.1 0.6]);
% plotcube_fig([1 1 1],[7 3 0],1,[0.6 0.1 0.6]);
% plotcube_fig([1 1 1],[8 4 0],1,[0.6 0.1 0.6]);
% 
% plotcube_fig([1 1 1],[7 7 1],1,[0.6 0.6 0.1]);
% plotcube_fig([1 1 1],[7 8 0],1,[0.6 0.6 0.1]);
% plotcube_fig([1 1 1],[8 7 0],1,[0.6 0.6 0.1]);
% % 
% plotcube_fig([1 1 1],[8 8 0],1,[0.1 0.6 0.6]);
% % 
% plotcube_fig([1 1 1],[3 8 0],1,[0.1 0.4 0.4]);
% % 
% plotcube_fig([1 1 1],[3 3 0],1,[0.4 0.1 0.4]);
% % 
% plotcube_fig([1 1 1],[8 3 0],1,[0.4 0.4 0.1]);

% for c = 1:s
%     for r = 1:s
%         h=structure(c,r);
%         if h>0
%             for k = 0:h-1
%                 plotcube_fig([1 1 1],[c r k],1,[0.5 0.5 0.8]);
%             end
%         end
%     end
% end
% 


%defining the edges of the map
plotcube_fig([0 0 0],[1 1 1],1,[1 1 1]);
plotcube_fig([0 0 0],[1 s 1],1,[1 1 1]);
plotcube_fig([0 0 0],[s 1 1],1,[1 1 1]);
plotcube_fig([0 0 0],[s s 1],1,[1 1 1]);
plotcube_fig([0 0 0],[1 1 4],1,[1 1 1]);
plotcube_fig([0 0 0],[1 s 4],1,[1 1 1]);
plotcube_fig([0 0 0],[s 1 4],1,[1 1 1]);
plotcube_fig([0 0 0],[s s 4],1,[1 1 1]);