# A simple project That triggers Infrastructure through Code

## Instance AMI ID

The `ami-id` for the instance have been categorised into AWS regions.
The id for `us-east-1` was found to be: `"ami-0b0ea68c435eb488d"`

[ami locator](https://cloud-images.ubuntu.com/locator/ec2/)

## Modify Resource

The initial instance did not have a tag that gives it a specific name.

What can be done? Add the tags to the resource, save and run   `terraform apply`. This will identify the changes in the resource and type YES.