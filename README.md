# multi-cloud-control-tools

This repository contains various scripts and wrappers for my multi-cloud control plane.

# configuration

Each of the tools may make reference to a configuration file. This is located in *~/.multi-cloud-config.yaml*.

You can reference the [example](multi-lcoud-config-example.yaml) in this repository. Note that there are minimal checks on the settings - it's on you to configure the settings.

# The scripts

## *_run_tf wrappers

These scripts are wrappers around terraform itself. The idea is to fetch the creds necessary to run terraform, invoke terraform with whatever args the script itself was called with and then simply exit.

Future plan is maybe to wrap crafting of the terraform state configuration. At the moment that stuff is hard-coded for lab only. This may also switch to running terragrunt instead of terraform.

## get_*_creds

These wrappers look up credentials stored in vault and print out export statements for the calling shell to eval into their environment. At the moment only aws and azure have been created - gcp script will be written in time.

## standup_clouds

This is a wrapper script to automate standing up all cloud providers all stages in the proper order. This is to save time of manual invocation. This script will likely be replaced in the future. The thinking is some kind of git-ops style pipeline when a provider/tenant is modified we would trigger a plan/apply cycle on it.

For now this is manually invoked whenever I want to bringn up the entire setup.

## nuke_clouds

This is a wrapper script intended to be run via a cron job. The idea here is to tear down all cloud resources when not in use to save money.

## store_*_creds

These are simple scripts used to manually populate the credentials per cloud provider / profile. I don't run them enough to have made better scripts - these are likely to change in the future.