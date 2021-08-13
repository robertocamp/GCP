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