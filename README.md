# gonzaloseriche.rocks

![Deploy Blog](https://github.com/[your-username]/gonzaloseriche.rocks/actions/workflows/deploy.yml/badge.svg)
![Infrastructure](https://github.com/[your-username]/gonzaloseriche.rocks/actions/workflows/terraform.yml/badge.svg)

Personal blog about AWS, DevOps, and Cloud Engineering.

## Repository Structure

```bash

.
├── blog/                  # Hugo blog
├── infrastructure/        # Terraform configs
└── .github/
    └── workflows/        # GitHub Actions

```

## Quick Start

1. Set up infrastructure:

    ```bash

    cd infrastructure
    terraform init
    terraform apply

    ```

2. Run blog locally:

    ```bash

    cd blog
    hugo server -D

    ```

## Infrastructure

- AWS S3 for hosting
- CloudFront for CDN
- Cloudflare for DNS/SSL
- Terraform for IaC

## Blog

- Hugo static site
- PaperMod theme
- AWS/DevOps content
