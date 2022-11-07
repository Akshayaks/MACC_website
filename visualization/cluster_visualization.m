all clear
linkdata off
plot_workspace(9,9);

filename = 'myAnimation_demo.gif';

contents =readmatrix('visualization_output.txt')
t=0
j=9*t+1
structure = contents(j:j+8,1:9);
cluster = contents(j+9:j+17,1:9);
    %fprintf('\n \n \n \n')
    
    %plot from the loaded
plotcube_use_cluster(structure, cluster)
shg