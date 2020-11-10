# Hackathon instructions

1. Create a private repo under your user name called terraform-google-cloud-build 
2. Mirror this repo to your new private repo by following these instructions:

Open Git Bash
Create a variable for your username:
```
github_user=<your-github_user>
```
Create a bare clone of the repository: 
```
git clone --bare https://github.com/supersmo/terraform-google-cloud-build.git
```
Mirror-push to the new repository: 
```
git push --bare https://github.com/${your-github_user}/terraform-google-cloud-build.git
```
Remove the temporary local repository you created earlier. 
```
cd ..
rm -rf old-repository.git
```

5. Clone the repository: 
```git clone https://github.com/${github_user}/terraform-google-cloud-build.git```
