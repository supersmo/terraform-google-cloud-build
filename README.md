# Hackathon instructions
Welcome hackathoners!

## Rules ##
* Use a **private** repo!  
You don't want to risk having anyone out there create merge requests that create stuff in your gcp project.
* No secrets in the code!

## Intro to this repo ##
This repo is used to quickly get you up to speed with deploying to your gcp project from github. 
If you're up to the task with also working with Terraform you can use this repo as a starting pointfor that as well.

The terraform module creates:
* pubsub topic
* service account
* permission for the service acount to publish to the pubsub topic

## Mirror this repo to your own private repo
1. Create a **private** repo in GitHub under your user name called terraform-google-cloud-build
1. Mirror  the supersmo/terraform-google-cloud-build repo to your new private repo by following these instructions:

Open Git Bash
Create a variable for your username:
```
github_user=<your-github_user>
```

Change directory to where you want to create your repo (/c is c: if you're on windows) e.g.:
```shell script
cd /c/ws/github.com
```

Create a bare clone of the repository: 
```shell script
git clone --bare https://github.com/supersmo/terraform-google-cloud-build.git
```
Mirror-push to the new repository: 
```shell script
git push --bare https://github.com/${github_user}/terraform-google-cloud-build.git
```
Remove the temporary local repository you created earlier. 
```shell script
cd ..
rm -rf terraform-google-cloud-build.git
```

Clone the repository: 
```shell script
git clone https://github.com/${github_user}/terraform-google-cloud-build.git
```

Git will use the username and e-mail stored in the git global config which probably already is configured to be your work e-mail. If you wish to change the commit username and email only for this repo:
```shell script
cd terraform-google-cloud-build
git config user.name <your name>
git config user.email <your e-mail>
```

## Set up Github to Cloud Build integration ##
1. Log in to gcp and go to your gcp project: https://console.google.com  
![](images/0_select_project.png)  

1. Go to Cloud Build –> Triggers and click Connect Repository  
![](images/1_connect_repository.png)  

1. Select source:  
![](images/2_select_source.png)  

1. Log in to your GitHub account (if you're not already logged in)    

1. Install the cloud build app on your **private** repo  
![](images/3_install_google_cloud_build_on_repo.png)  

1. Select the google project to connect to  
![](images/4_select_google_project_to_connect_to.png)  

1. Connect your repository  
![](images/5_select_github_repo.png)  

1. Create a default push trigger  
![](images/6_create_push_trigger.png)  

### Modify default trigger ###
1. Edit the default push trigger to:
* support different triggers for main and feature branches
* add an environment variable  
![](images/7_edit_trigger_1.png)
![](images/7_edit_trigger_2.png)

### Create a trigger for the main branch ###
1. Create a trigger for the main branch:Duplicate the trigger to create a separate trigger and cloudbuild.yaml for the main branch
![](images/8_duplicate_trigger.png)

1. Edit the trigger to only trigger on the main branch
![](images/9_edit_trigger_for_main1.png)
![](images/9_edit_trigger_for_main2.png)

1. Make a branch and push the branch to trigger a terraform plan

1. Inspect the plan in cloud build

1. If you are satisfied with the plan create a pull request to merge the branch to main.

1. Check the terraform apply log in cloud build

1. Navigate in your gcp project to see that the resources were created.