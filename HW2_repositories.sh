#!/usr/bin/sh

#Making a repository and putting HW 1 on it

#Make homework directory
cd ~/Desktop/DataScience2
mkdir BioHW
cd BioHW

#Make into repository
git init

#Now to add my Homework1 file to this HW repository 
#(for some reason I wasn't automatically in new directory after the git init command)
mv ~/Desktop/DataScience2/Homework1 ~/Desktop/DataScience2/BioHW

cd ~/Desktop/DataScience2/BioHW

#The git add will just stage the file, no commits are done yet
git add Homework1

###### NOTE FOR CIARA: before I could first commit I had to git config user.name "github username" 
## and then git config user.email "github email address"######

#Now we commit with a message to clue us in about our goal for the commit
git commit -m "Move HW1 to HW repository on github"

#Now we link the repo to github (git remote add origin "repo url")
git remote add origin https://github.com/cnsheets95/BioHW.git

#Check that it worked
git remote -v

#Now we just push to our github so that Julie can see and comment/grade
git push origin master

### nice job!
