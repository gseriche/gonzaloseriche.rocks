---
title: "Hosting a Hugo Site on AWS with S3, CloudFront, and Cloudflare"
date: 2024-02-18
draft: false
tags: ["aws", "terraform", "hugo", "cloudfront", "s3", "cloudflare", "devops"]
categories: ["AWS", "Infrastructure"]
---

As an AWS enthusiast and infrastructure engineer, I want to share how I deployed this website using AWS services and Cloudflare, all managed with Infrastructure as Code. This setup combines AWS's reliable hosting with Cloudflare's security and performance features.

## Architecture Overview

Our infrastructure includes:
- S3 bucket for static content hosting
- CloudFront for AWS content delivery
- Cloudflare for DNS, SSL, and additional security
- Terraform for infrastructure management

## Why This Architecture?

1. **Performance**: Dual CDN setup with CloudFront and Cloudflare
2. **Security**: Cloudflare's WAF and DDoS protection
3. **Cost-Effective**: S3 and CloudFront pay-as-you-go pricing
4. **Maintainable**: Everything defined in Terraform

## Implementation Steps

### 1. S3 Bucket Setup

{{< highlight hcl >}}
resource "aws_s3_bucket" "website" {
  bucket = "gonzaloseriche.rocks"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}
{{< /highlight >}}

### 2. CloudFront Distribution

{{< highlight hcl >}}
resource "aws_cloudfront_distribution" "website" {
  enabled             = true
  is_ipv6_enabled    = true
  default_root_object = "index.html"
  
  origin {
    domain_name = aws_s3_bucket_website_configuration.website.website_endpoint
    origin_id   = "S3-${aws_s3_bucket.website.bucket}"
    # ... configuration continues
  }
}
{{< /highlight >}}

### 3. Cloudflare Configuration

After applying the Terraform configuration, set up Cloudflare:

1. Add your domain to Cloudflare
2. Update your domain's nameservers to Cloudflare's
3. Create DNS record:
   {{< highlight text >}}
   Type: CNAME
   Name: gonzaloseriche.rocks
   Target: [CloudFront Distribution Domain]
   Proxy status: Proxied
   {{< /highlight >}}

4. Configure Cloudflare settings:
   - SSL/TLS mode: Full
   - Always Use HTTPS: On
   - Auto Minify: Enable for HTML, CSS, JS
   - Brotli compression: On

## Deployment Process

1. Initialize and apply Terraform:
```bash
terraform init
terraform apply
```

2. Build and upload Hugo site:
```bash
hugo
aws s3 sync public/ s3://gonzaloseriche.rocks/
```

3. Verify Cloudflare configuration:
   - Check DNS propagation
   - Verify SSL certificate
   - Test CDN caching

## Cost Breakdown

This setup is cost-effective:
- S3: ~$0.023 per GB/month
- CloudFront: ~$0.085 per GB
- Cloudflare: Free tier features
- Total: Usually under $5/month for personal blogs

## Maintenance and Updates

### Content Updates
```bash
hugo
aws s3 sync public/ s3://gonzaloseriche.rocks/ --delete
```

### Infrastructure Updates
```bash
terraform plan
terraform apply
```

## Security Features

1. **Cloudflare Security**:
   - DDoS protection
   - Web Application Firewall
   - Bot protection
   - SSL encryption

2. **AWS Security**:
   - CloudFront private content
   - S3 bucket policies
   - Region restriction options

## Future Improvements

1. GitHub Actions for automatic deployment
2. Custom Cloudflare Workers
3. Enhanced caching strategies
4. Content backup automation

## Conclusion

This infrastructure provides a robust, secure, and performant solution for hosting a Hugo site. By combining AWS and Cloudflare, we get the best of both worlds: reliable hosting and enhanced security.

The complete Terraform configuration is available on [GitHub](https://github.com/gseriche).

---

Questions or want to implement this yourself? Feel free to reach out!