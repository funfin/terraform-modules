variable "vpc_id" {
  description = "The vpc_id to add the security group into"
  default     = null
}

variable "name" {
  description = "The name of the security group"
  type        = string
  default     = "from-cloudflare-sg"
}

variable "from_port" {
  description = "The starting port for the security group rule"
  type        = number
  default     = 0
}

variable "to_port" {
  description = "The ending port for the security group rule"
  type        = number
  default     = 65535
}

variable "protocol" {
  description = "The protocol for the security group rule"
  type        = string
  default     = "tcp"
}