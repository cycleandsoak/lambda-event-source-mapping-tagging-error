# Reproducing a Lambda Event Source Mapping Tagging error

This is the bug report we opened: https://github.com/hashicorp/terraform-provider-aws/issues/39820 (resolution: the terraform provider seems fine, it's probably a permission issue on our side)

Related: https://github.com/aws/aws-cdk/issues/31774

## Summary

The Terraform AWS Provider v5.70 errors when creating lambda event source mappings with tags.

## Reproduction

- Terraform init and apply with the code in its current state -- it fails
- Comment out the default tags and try again -- it succeeds
- Put the tags back -- it fails
- Switch from v5.70 to 5.69 -- it succeeds

## Related release notes

For v5.70

> resource/aws_lambda_event_source_mapping: Add tags argument and tags_all attribute (#39535)
