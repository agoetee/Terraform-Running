## Activities Undertaken in Chapter One

### Instance AMI ID

The `ami-id` for the instance have been categorised into AWS regions.
The id for `us-east-1` was found to be: `"ami-0b0ea68c435eb488d"`

[ami locator](https://cloud-images.ubuntu.com/locator/ec2/)

### Modify Resource

The initial instance did not have a tag that gives it a specific name.

What can be done? Add the tags to the resource, save and run   `terraform apply`. This will identify the changes in the resource and type YES.

### Added Resource 'Security Group'

### Terraform Expressions

A terraform expression is anything that returns a value. Terraform supports many types of expressions such as numbers(5), string literal(ami=231ffmvhbalif), reference, etc. 
In this case, __reference__ allows access of **values** from other parts of the code.

This is very useful in the `instance`-`security_group`sections where the instance have to utilise the security group ID for their pair to work well.

It is done with the syntax _resource-attribute-reference_, such as 
```s
<PROVIDER>_<TYPE>.<NAME>.<ATTRIBUTE>
```

PROVIDER is AWS here
TYPE is security_group
NAME is the name of the resource
ATTRIBUTE is either one of the arguments of the resource (name) or one of the attributes _exported_

In this case, the syntax in the Instance resource is `vpc_security_group_ids = [aws_security_group.instance.id]`.

### OUTPUT VARIABLES

Output variables have the following components: 
- *NAME*, the name of the output variable 
- *VALUE*, can be any Terraform expression
- *CONFIG*. can contain **2** additional parameters:
    * __description__ Used to document what type of data is contained in the output variable
    * __sensitive__ Set this to `true` to instruct terraform not to log this output after `terraform apply`. 
    Especially is the output contains sensitive data such as passwords.
```js
output "puplic_ip" {
  value =  aws_instance.my_instance.public_ip
  description = "The public IP address of the web server"
}
```
With this output block working, The `terraform apply` command will produce the stated output.

```s
Outputs:

puplic_ip = "54.158.54.148"

```