#!/bin/bash

# AWS region and instance details
REGION="us-east-1"
AMI_ID="ami-0abcdef1234567890"   # Amazon Linux 2 AMI, replace with your preferred AMI ID
INSTANCE_TYPE="t2.micro"

# Start the instance
echo "Creating EC2 instance..."
instance_id=$(aws ec2 run-instances \
  --region $REGION \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP_ID \
  --query 'Instances[0].InstanceId' \
  --output text)

echo "Instance $instance_id created."

# Wait for instance to be running
echo "Waiting for instance to be in running state..."
aws ec2 wait instance-running --region $REGION --instance-ids $instance_id

# Get the public IP address of the instance
public_ip=$(aws ec2 describe-instances \
  --region $REGION \
  --instance-ids $instance_id \
  --query 'Reservations[0].Instances[0].PublicIpAddress' \
  --output text)

echo "Instance is now running. Public IP: $public_ip"