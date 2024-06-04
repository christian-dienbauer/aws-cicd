

run:
	uvicorn src.main:app --host 127.0.0.1 --port 8080 --reload

test_unit:
	pytest tests/unit -v

test_api:
	pytest tests/api -v

cloudformation_deploy:
	aws cloudformation create-stack --stack-name my-codebuild-stack --template-body file://iac/codebuild_project.yml --capabilities CAPABILITY_IAM

cloudformation_delete:
	aws cloudformation delete-stack --stack-name my-codebuild-stack
