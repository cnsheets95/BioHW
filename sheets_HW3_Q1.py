#! /usr/bin/python3

#For problem a) count all the 2s in a string

#First save string as variable
a = "112345678911234566"
#Then print out the number of 2s in the string using count function
print(a.count("2"))


#For problem b) input a sentence and turn to lower case and take out white spaces and count length

#Import any functions needed like re
import re

#save input as a variable so I can make up a sentence
b = input("Type Sentence Here")
#use lower function to make my sentence lower case and save as new variable
b1 = b.lower()
print(b1)
#Now use re.sub to find a pattern to replace all spaces (\s) with nothing "" in my sentence
b2 = re.sub("\s", "", b1)
print(b2)
#Now just print length with len() function
print(len(b2))