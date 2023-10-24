## Activities Undertaken in Chapter One

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