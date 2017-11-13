import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from math import ceil

def sawed_bar_plot(DataFrame,BreakValue=350):
    # replace infinity values with reasonable values that can be ploted
    MaxNotInfValue = DataFrame['Max'].loc[DataFrame['Max']!=np.inf].max()
    Upper_yLim = np.ceil(MaxNotInfValue*1.5)
    DataFrame = DataFrame.replace(np.inf,Upper_yLim)
    #create a 3 part plot 
    f, ax = plt.subplots(3, 1, sharex=True, gridspec_kw = {'height_ratios':[11, 3,11]})
    f.set_figwidth(12.0)
    f.set_figheight(9.0)
    f.set_facecolor("lightcyan")
   
    
    #glue the 3 parts of plot    
    for axi in ax: axi.set_facecolor("lightcyan")
        
    ax[2].set_ylim(0,BreakValue)
    ax[1].set_ylim(0,1)
    ax[0].set_ylim(BreakValue,Upper_yLim)
        
    ax[0].spines['bottom'].set_visible(False)
    ax[0].spines['top'].set_visible(False)
    ax[1].spines['bottom'].set_visible(False)
    ax[1].spines['top'].set_visible(False)
    ax[2].spines['top'].set_visible(False)
        
    ax[0].tick_params(
            axis='x',  
            which='both',      
            bottom='off',      
            top='off',         
            labelbottom='off') 
       
    ax[1].axis('off')
    ax[2].tick_params(
            axis='x',          
            which='both',
            bottom='off',
            top='off',
            labelbottom='on')
    plt.subplots_adjust(hspace=0)
    
    #draw the upper subplot
    DataFrame.plot.bar(ax=ax[0], legend=False, edgecolor = "none")

    #calculate the saw coordinates for the middle subplot
    no_of_ticks = len(ax[0].get_xticks())
    x_range = [x for x in range(-1,no_of_ticks+1)]
    upper = [1]+[0.9,0.6]*(ceil(no_of_ticks/2)-1)+[0.9,0.9,1]
    bottom =[-0.2]+[0.4,0.1]*(ceil(no_of_ticks/2)-1)+[0.5,0.5,-0.1]
    #draw the middle subplot
    ax[1].plot(x_range,upper,  color='lightgrey',linestyle=(0, (5, 5)))
    ax[1].plot(x_range,bottom, color='lightgrey',linestyle=(0, (5, 5)))
    ax[1].fill_between(x_range, bottom, upper,facecolor='teal', color='white')
    ax[1].set_facecolor("lightcyan")
    ax[1].axes.get_yaxis().set_visible(False)
        
    #draw the bottom subplot        
    DataFrame.plot.bar(ax=ax[2], legend=False, edgecolor = "none")
    ax[2].set_xticklabels(DataFrame.index.values.tolist(),rotation="horizontal")
    #f.autofmt_xdate()
    ax[2].legend(loc=9, bbox_to_anchor=(0.1, -0.1), ncol=2)
    
    plt.show()
