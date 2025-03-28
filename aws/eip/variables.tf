variable "address" {
  description = "The Elastic IP address."
  type        = string
  default     = null
}

variable "associate_with_private_ip" {
    description = "The private IP address to associate with the Elastic IP."
    type        = string
    default     = null
}

variable "customer_owned_ipv4_pool" {
  description = "The customer-owned IPv4 pool to associate with the Elastic IP."
  type        = string
  default     = null
}

variable "instance" {
  description = "The ID of the instance to associate with the Elastic IP."
  type        = string
  default     = null
  
}

variable "network_border_group" {
  description = "The network border group for the Elastic IP."
  type        = string
  default     = null
  
}

variable "network_interface" {
  description = "The ID of the network interface to associate with the Elastic IP."
  type        = string
  default     = null
}

variable "public_ipv4_pool" {
  description = "The public IPv4 pool to associate with the Elastic IP."
  type        = string
  default     = null
}

variable "domain" {
  description = "The domain name for the EIP."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

