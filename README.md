# GCP: Getting started with Terraform
## creating new ssh key
  1. check for an existing ssh key: usuallly in ~/.ssh
  2. over-write the existingn key with a new key:
  3. `ssh-keygen -t ed25519 -C "your_email@example.com"`

  > Your identification has been saved in /Users/robert/.ssh/id_ed25519.
  > Your public key has been saved in /Users/robert/.ssh/id_ed25519.pub.

  4. start the ssh-agent in the background: `eval "$(ssh-agent -s)"`
  5. check to see if **~/.ssh/config** exists: `open ~/.ssh/config`
  6. `touch ~/.ssh/config`

  ```
  Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
  ```
  7. Add your SSH private key to the ssh-agent and store your passphrase in the keychain.
  `$ ssh-add -K ~/.ssh/id_ed25519`
  > Enter passphrase for /Users/robert/.ssh/id_ed25519: 
  
## PROJECT SETUP ON GCP
  1. create new project: ptf-1-322802
  2. setup a Service Account for TF to use:
      1. Go to the create service account key page. 
      2. Select the default service account or create a new one
  3. if you are storing the key file in your project , **DO NOT** add it to .gitignore
  4. provider code can be in either "versions.tf" or "main.tf"

## TERRAFORM 
- The random_id Terraform plugin allows you to create a somewhat random instance name that still complies with the Google Cloud instance naming requirements but requires an additional plugin.

  1. terraform init
  2. terraform plan
  3. terraform apply

- There is now a new instance running in Google Cloud, so your next steps are getting a web 
application created, deploying it to the instance, and exposing an endpoint for consumption.

- the instance can be reached via the GCP cosole over ssh
- external ssh access requires a public ssh key be added to the terraform resource


## Getting started with Go on Compute Engine
- GCP construted used:
  1. compute engine
  2. cloud build


### Cloud Billing
- A Cloud Billing account is used to define who pays for a given set of resources, and it can be linked to one or more projects
- Project usage is charged to the linked Cloud Billing account.
- If you are a billing administrator on only one Cloud Billing account, new projects you create are automatically linked to your existing Cloud Billing account


#### Cloud Build: Example app
1. identify (create) a new project
2. make sure billing is enabled on the Project 
3. enable the Compute Engine and Cloud Build APIs
4. open the Cloud Shell (set your Cloud Shell to the Project ID) `gcloud config set project YOUR_PROJECT_ID`


---
> Cloud Shell provides command-line access to your cloud resources directly from the browser.

- run the example app:

```
go build -o app
./app
```

## Links
https://github.com/GoogleCloudBuild
https://cloud.google.com/shell/docs/quickstart