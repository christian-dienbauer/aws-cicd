# Default values for variables
REPOSITORY_NAME ?= my-app
TAG ?= latest
AWS_REGION ?= eu-central-1
AWS_ACCOUNT_ID ?= 058264264767


run:
	poetry run uvicorn src.main:app --host 0.0.0.0 --port 8000 --reload

test_unit:
	poetry run pytest tests/unit -v

test_api:
	poetry run pytest tests/api -v

provision_codebuild:
	aws cloudformation create-stack --stack-name my-codebuild-stack --template-body file://iac/codebuild_project.yml --capabilities CAPABILITY_IAM

delete_codebuild:
	aws cloudformation delete-stack --stack-name my-codebuild-stack

provision_oidc:
	aws cloudformation create-stack --stack-name github-oidc --template-body file://iac/github_oidc.yml --capabilities CAPABILITY_NAMED_IAM

delete_oidc:
	aws cloudformation delete-stack --stack-name github-oidc

provision_ecr:
	aws cloudformation create-stack --stack-name my-ecr-repo-stack --template-body file://iac/ecr_repository.yml

delete_ecr:
	aws cloudformation delete-stack --stack-name my-ecr-repo-stack

docker_login:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

docker_build:
	docker build -f docker/.Dockerfile -t $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(REPOSITORY_NAME):$(TAG) .

docker_push:
	docker push $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(REPOSITORY_NAME):$(TAG)
