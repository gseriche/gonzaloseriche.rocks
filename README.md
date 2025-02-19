# gonzaloseriche.rocks

[![Deploy Blog](https://github.com/gseriche/gonzaloseriche.rocks/actions/workflows/deploy.yml/badge.svg)](https://github.com/gseriche/gonzaloseriche.rocks/actions/workflows/deploy.yml)
[![Infrastructure](https://github.com/gseriche/gonzaloseriche.rocks/actions/workflows/terraform.yml/badge.svg)](https://github.com/gseriche/gonzaloseriche.rocks/actions/workflows/terraform.yml)


Personal tech blog built with Hugo, hosted on AWS with S3/CloudFront, and secured by Cloudflare. Includes complete infrastructure as code using Terraform.

## Infrastructure Overview

The blog infrastructure consists of:
- S3 bucket for static content hosting
- CloudFront for content delivery
- ACM certificate for SSL
- Cloudflare for DNS management

## Repository Structure

```bash
.
├── blog/                  # Hugo blog
├── infrastructure/        # Terraform configs
└── .github/
    └── workflows/        # GitHub Actions

```

## Required GitHub Secrets

For the infrastructure deployment to work, you need to set up these GitHub secrets:

1. `AWS_ACCESS_KEY_ID`: Your AWS access key
2. `AWS_SECRET_ACCESS_KEY`: Your AWS secret key
3. `ACM_CERTIFICATE_ARN`: The ARN of your ACM certificate
4. `CLOUDFRONT_DISTRIBUTION_ID`: The CloudFront distribution ID (after initial deployment)

### Setting up ACM Certificate ARN

1. Create an ACM certificate in the us-east-1 region (required for CloudFront)
2. Copy the certificate ARN
3. Add it as a GitHub secret named `ACM_CERTIFICATE_ARN`
4. Format: `arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012`

## Quick Start

1. Set up required GitHub secrets
2. Deploy infrastructure:

    ```bash

    cd infrastructure
    terraform init
    terraform apply

    ```

3. Run blog locally:

    ```bash

    cd blog
    hugo server -D
    
    ```

## Infrastructure Deployment

The infrastructure deployment happens through GitHub Actions when changes are made to the infrastructure code. The workflow:
1. Validates Terraform configuration
2. Plans the changes
3. Applies the changes if approved

## Blog Deployment

Blog content is automatically deployed when changes are pushed to the main branch. The workflow:
1. Builds the Hugo site
2. Syncs content to S3
3. Invalidates CloudFront cache

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details on the development process and how to submit changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.