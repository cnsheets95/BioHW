#! /usr/bin/python3

#For question 2A: add 1 to items in a list using for loop

#Make my list
list1 = [45,465,164,89]
#For loop to add 1 to every item (x) in my list
for x in list1:
    l1= x+1
#Print to verify it worked
    print(l1)
    
#For question 2B: make up a dictionary and assign keys/values then do an if/else statement to show size relation in simple category

#Making the dictionary
an_dict = {}
an_dict['dog']= 22679
an_dict['bird']= 68
an_dict['frog']= 18
an_dict['horse']= 408233
an_dict['butterfly']= 8

#ok.... so I started the next part trying to do the whole if/else statement within a loop for the dictionary items and values
#....but I could not figure out how to do it with each dictionary item in the loop....so I did the less elegant way....I miss R sometimes

if an_dict['dog'] > 20: 
    print(animal[0], "Big")
else:
    print(animal[0], "Small")
        
if an_dict['bird'] > 20:
    print(animal[1], "Big")
else:
    print(animal[1], "Small")
        
if an_dict['frog'] > 20:
    print(animal[2], "Big")
else:
    print(animal[2], "Small")
        
if an_dict['horse'] > 20:
    print(animal[3], "Big")
else:
    print(animal[3], "Small")
        
if an_dict['butterfly'] > 20:
    print(animal[4], "Big")
else:
    print(animal[4], "Small")