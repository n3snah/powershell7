# CONTRIBUTING
We warmly welcome you to assist and contribute to this repository, all you need is a Github account and an associated issue registered in the repository issues register for the associated change you would like made.

## Reporting an issue/feature
Please visit https://github.com/n3snah/powershell7/issues and ensure that your issue/feature doesn't already exist. Once this has been confirmed, please click the `New Issue` button and fill out one of the appropriate templates. These templates have been created to try help provide any necessary information that would be required for a developer/contributor to understand. If there isn't an appropriate template please open a blank issue.

## Your development environment
This is a puppet module leveraging the Puppet Development Kit (PDK). Please ensure that you have at least the version of PDK referenced in the `metadata.json` or newer installed on your system along with Git and an appropriate code editor of your choice.

## Forking this repository
To get started with contributing to this module, please fork the repository to your own Github account by clicking on the fork button located in the top right hand of this git repository while viewing the `code` tab. Follow the prompts to have it forked to your account.

## Pull Request Process
Please follow the steps below when submitting your pull request.
1. Added the required code with sufficent rspec tests for unit testing.
1. Updated the CHANGELOG.md & README.md to reflect the changes you have made.
1. Ensure you have successfully run `pdk validate` and `PDK test unit` with no received errors.
1. Create a pull request from your fork back to this repository's "development" branch.
