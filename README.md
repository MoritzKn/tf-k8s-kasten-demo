# Demo Terraform Setup for K8s + Kasten.io

**See**: Working with Kubernetes and Terraform (not yet published) on the [Kasten](https://www.kasten.io/) blog.

## Structure

- `./cluster` contains cluster level Terraform code. Apply this first.
- `./applications` contains Terraform code for things inside the cluster. Apply this second.
- `./demo-app` contains a minimal database to demonstrate back-up & restore with Kasten.

## Building on top of this

If you read the blog posts and would like to use this code as the foundation for your own work, you are welcome to do so.
The code is published under the MIT license and you are free to use it.

But there are a couple of things to consider:

- You'd probably want to add a [backend configuration](https://www.terraform.io/docs/language/settings/backends/configuration.html). Otherwise, yes, commit the `.tfstate` files.
- This isn't a production ready cluster. See the section "Further Optimisation" in the second blog post.

## Getting Help

Feel free to message me (contact info on [my website](https://kneilmann.tech/)) if you have any questions or need
guidance with implementing Infrastructure as Code in your company.

The people at Kasten are also amazing and [their support](https://www.kasten.io/contactus/) can help you with questions regarding Kasten.
