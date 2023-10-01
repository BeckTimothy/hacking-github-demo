
# Purpose

I've built this repo to support some presentations shared with **Albuquerque Lowtech's Anonymous** (a hacker collective located in Albuquerque, New Mexico,) **Albuquerque Software Social Club** (a meetup group for Albuquerque developers,) and for the **Albuquerque chapter of Google Developer Groups**.
The purpose of this information is to bring awareness to Git, Git variables, some ethical grey areas in the use of git variables. The information here is for educational use only. I am in no way encouraging finding shady ways to use your knowledge. Do what you will at your own risk.

# Git vs GitHub

Similarly to how JavaScript is a programming language and Java is the first layer of hell; Git and GitHub are two completely different things.

Git is an open-source distributed version control software. It's used to allow people to coordinate and develop projects in conjunction asynchronously and manage a protocol for syncing their work together and managing versions of that work. GitHub, is a product trying to be many things, but it's built on top of Git, utilizing it as cloud storage. While trying to be many things, it's important to always remember, GitHub is just the graveyard where dead projects go to die.

# Git Environment Variables

When I talk about Git environment variables I'm talking about two different things:
1. [Configuration Variables](https://git-scm.com/docs/git-config#_variables) you set for your Git client. The git-config docs' variable section has a word count exceeding 33,000 and lists a whole bunch of different useful configuration variables for controlling the behavior of git on your machine.  
2. [Environment variables](https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables) you set for your CLI instance. Git runs inside a bash shell, and looks for specific environment variables set to change Git's behavior in certain ways.

For the purpose of this Repo we are exploring the behaviors of a specific few environment/config variables:

1. Environment variables GIT_AUTHOR_DATE and GIT_COMMITTER_DATE and explore a hack to contribution time travel within [CONTRIBUTION_FRAUD.md](https://github.com/BeckTimothy/dontTrustContributionCharts/blob/master/CONTRIBUTION_FRAUD.md) 
2. Config Variables user.email and user.name and a content spoofing hack within [CONTENT_SPOOFING.md](https://github.com/BeckTimothy/dontTrustContributionCharts/blob/master/CONTENT_SPOOFING.md)
   
     
