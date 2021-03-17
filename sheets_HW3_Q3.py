#! /usr/bin/python3

#Couldn't get the pathway for this csv to open in python or in jupyter, the read and write functions weren't working
#so I joined the pathway of the jupyter with the file Bloom that I need to open and read it in
import os
Homework3_path1 = os.path.abspath("Homework3.ipynb")
print(Homework3_path1)
bloom_path = os.path.join(os.path.dirname(Homework3_path1), "Bloom_etal_2018_Reduced_Dataset.csv")
print(bloom_path)

#Now make an outfile to put in the 2 columns of data I want to use
outfile = open("taxa_dia_bloom_filename.csv", 'w')
# open the bloom file in a loop to make the first line into a variable so it doesn't get counted with data
with open(bloom_path) as bloom_file:
    #print(bloom_file.readline())
    bloom_file_header = bloom_file.readline()
    print(bloom_file_header)
#Now print out taxon name and diadromous status (I'm using outfile to print out to)
    count=0
    for line in bloom_file:
        count+=1
        stripped_line = line.strip("\n")
        requested_output = stripped_line.split(",")
        outfile.write("%s,%s\n" % (requested_output[0], requested_output[3]))
    outfile.close()

#then in my ubuntu I just go to the right directory and look at those variable by doing less file_name


##use pandas to get sum of column for total log body size and print total
import pandas as pd
#So I'm really struggling with this part and wish it was R so things were just already df
df = pd.read_csv("Bloom_etal_2018_Reduced_Dataset.csv")
df
#I used google and the most common way to do this is using pandas, so I went with this method for getting the total
Total = df.logbodysize.sum()
Total
