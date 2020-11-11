# Hackathon instructions

## Mirror this repo to your own private repo
1. Create a **private** repo in GitHub under your user name called terraform-google-cloud-build
2. Mirror  the supersmo/terraform-google-cloud-build repo to your new private repo by following these instructions:

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
git push --bare https://github.com/${github_user}/terraform-google-cloud-build.git
```
Remove the temporary local repository you created earlier. 
```
cd ..
rm -rf terraform-google-cloud-build.git
```

Clone the repository: 
```
git clone https://github.com/${github_user}/terraform-google-cloud-build.git
```

Git will use the username and e-mail stored in the git global config which probably already is configured to be your work e-mail. If you wish to change the commit username and email only for this repo:
```
cd terraform-google-cloud-build
git config user.name <your name>
git config user.email <your e-mail>
```

## Make pushes to your repo trigger cloud build ##
### Setup Github to Cloud Build integration ###
1. Log in to gcp and go to your gcp project: https://console.google.com  
![](images/0_select_project.png)  

2. Go to Cloud Build –> Triggers and click Connect Repository  
![](images/1_connect_repository.png)  

3. Select source:  
![](images/2_select_source.png)  

4. Log in to your GitHub account (if you're not already logged in)    

5. Install the cloud build app on your **private** repo  
![](images/3_install_google_cloud_build_on_repo.png)  

6. Select the google project to connect to  
![](images/4_select_google_project_to_connect_to.png)  

7. Connect your repository  
![](images/5_select_github_repo.png)  

8. Create a default push trigger  
![](images/6_create_push_trigger.png)  

### Modify default trigger ###
9. Edit the default push trigger to:
* support different triggers for main and feature branches
* add an environment variable  
![](images/7_edit_trigger_1.png)
![](images/7_edit_trigger_2.png)

### Create a trigger for the main branch ###
10. Create a trigger for the main branch:Duplicate the trigger to create a separate trigger and cloudbuild.yaml for the main branch
![](images/8_duplicate_trigger.png)

11. Edit the trigger to only trigger on the main branch
![](images/9_edit_trigger_for_main1.png)
![](images/9_edit_trigger_for_main2.png)
