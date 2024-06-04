# aws-cicd
An example on how to create a cicd pipeline using AWS CodeBuild

Prerequisits:
- CodeBuild is linked with GitHub using OAuth (Not set via CloudFormation template)

# Provision AWS CodeBuild using Cloud Formation


1. Deploy a stack set to provision CodeBuild

```
make cloudformation_deploy
```

