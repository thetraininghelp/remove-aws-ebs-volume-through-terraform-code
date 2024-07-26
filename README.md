# Remove AWS EBS volume through terraform code.

# Terraform will perform the following actions:

* aws_iam_role.lambda_exec_role will be created
* aws_iam_role_policy.lambda_policy will be created
* aws_lambda_function.delete_ebs_volume will be created
* aws_lambda_invocation.invoke_delete_ebs_volumes[0] will be created
* aws_lambda_invocation.invoke_delete_ebs_volumes[1] will be created

# Plan: 5 to add, 0 to change, 0 to destroy.

