The vpc id and subnet id needs to be inputed in the autoscaling module variable. You can eith do this or tag the vpc on the aws account and create a vpc filter block under the data for vpc and reference the tagged vpc there.

All backend resources are commented out. 

Please check the security module to adjust the the egress and ingress as per your infrastructure requirements.
