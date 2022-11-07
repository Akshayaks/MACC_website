import numpy as np

import pandas
import pdb

df = pandas.read_csv('/home/akshaya/Downloads/7x7_results - EA.csv')
# 100_7x7.csv')

# s_idx = df['Structure']
# d_idx = df['Substructure']
# M = df['Makespan'] 
# no_agents = df['No_of_agents']
# S = df['Obj']
# print(s_idx)
# print("s_idx[0]: ", s_idx[0])

makespan = np.zeros(100)
sum_of_costs = np.zeros(100)
max_agents = np.zeros(100)
makespan = df['M']
sum_of_costs = df['Sum of Costs']
solve_time = df['Solve Time for all Ts']

# l = 0
# for i in range(len(s_idx)):
#     makespan[s_idx[i]] += M[i]
#     sum_of_costs[s_idx[i]] += S[i]
#     if max_agents[s_idx[i]] < no_agents[i]:
#         max_agents[s_idx[i]] = no_agents[i]


df = pandas.read_csv('/home/akshaya/Downloads/7x7_results - EA_with_decomp.csv')
# 100_7x7_EA.csv')

# s_idx_ea = df['Structure']
# M_ea = df['T'] 
# S_ea = df['Obj']
# sol_time = df['Solve Time for all Ts']
# print(s_idx)
# print("s_idx[0]: ", s_idx[0])

makespan_EA = np.zeros(100)
sum_of_costs_EA = np.zeros(100)
max_agents_EA = np.zeros(100)
sol_time_EA = np.zeros(100)

makespan_EA = df['Makespan']
sum_of_costs_EA = df['Sum of costs']
sol_time_EA = df['Total solve Time']

# l = 0
# for i in range(100):
#     makespan_EA[i] = M_ea[i]
#     sum_of_costs_EA[i] = S_ea[i]
#     sol_time_EA[i] = sol_time[i]


# print("Average makespan: ", makespan)
# print("Average sum_of_costs: ", sum_of_costs[1],sum_of_costs[2])
# pdb.set_trace()
# print("Average computation_time: ", sum(computation_time)/76)

# file = open('indv_webpage_template.html')
with open('indv_webpage_template.html') as f:
    lines = f.readlines()
f.close()
# print("lines ", lines)

for i in range(100):
    with open('page_'+str(i)+'.html', 'w') as f:
        # print("lines: ", lines)
        print(i,sum_of_costs[i],makespan[i],max_agents[i])
        # pdb.set_trace()
        for lidx,l in enumerate(lines):
            # print("i: ",i)
            # print("\n")
            if lidx == 87:
                l = "  <h1>Action sequence for building Structure " + str(i) + " in 7X7 base grid world</h1>"
            elif lidx == 103:
                l = "    <img src=\"./visualization/random_"+str(i)+".gif\" width=90%>"
            elif lidx == 109:
                l = "    <img src=\"./visualization/7x7_decomp_random_"+str(i)+".gif\" width=90%>"
            elif lidx == 122:
                l = "            <td>"+str(round(solve_time[i],2))+"</td>"
            elif lidx == 127:
                l = "            <td>"+str(int(sum_of_costs[i]))+"</td>"
                # print("sum: ",i,sum_of_costs[i],makespan[i],max_agents[i])
            elif lidx == 132:
                l = "            <td>"+str(makespan[i])+"</td>"
                # print("m: ",i,sum_of_costs[i],makespan[i],max_agents[i])
            # elif lidx == 103:
            #     l = "            <td>"+str(max_agents[i])+"</td>"
                # print("m: ",i,sum_of_costs[i],makespan[i],max_agents[i])
                # pdb.set_trace()
            elif lidx == 128:
                l = "            <td>"+str(sum_of_costs_EA[i])+"</td>"
                # print("sum: ",i,sum_of_costs[i],makespan[i],max_agents[i])
            elif lidx == 133:
                l = "            <td>"+str(makespan_EA[i])+"</td>"
                # print("m: ",i,sum_of_costs[i],makespan_EA[i],max_agents[i])
            elif lidx == 123:
                l = "            <td>"+str(round(sol_time_EA[i],2))+"</td>"
                # print("m: ",i,sum_of_costs[i],makespan[i],max_agents[i])
            f.write(str(l))
    f.close()


