variable "username" {
  default = "root"
}

variable "password" {
  default = "12345678"
}

variable "vpc-cidr" {
  default = "10.0.0.0/16"
  description = "VPC CIDR Block"
  type = string
}

variable "first-public-subnet-cidr" {
  default = "10.0.0.0/24"
  description = "The First Public Subnet CIDR Block"
  type = string
}

variable "second-public-subnet-cidr" {
  default = "10.0.1.0/24"
  description = "The Second Public Subnet CIDR Block"
  type = string
}

variable "first-private-subnet-cidr" {
  default = "10.0.2.0/24"
  description = "The First Private Subnet CIDR Block"
  type = string
}

variable "second-private-subnet-cidr" {
  default = "10.0.3.0/24"
  description = "The Second Private Subnet CIDR Block"
  type = string
}

variable "third-private-subnet-cidr" {
  default = "10.0.4.0/24"
  description = "The Third Private Subnet CIDR Block"
  type = string
}

variable "fourth-private-subnet-cidr" {
  default = "10.0.5.0/24"
  description = "The Fourth Private Subnet CIDR Block"
  type = string
}

variable "ssh-location" {
  default = "0.0.0.0/0"
  description = "IP Address That Can SSH Into the EC2 Instance"
  type = string
}

variable "database-snapshot-identifier" {
  default = "arn:aws:rds:us-east-1:292842536810:snapshot:mysqldatabase-final-snapshot"
  description = "The Database Snapshot ARN"
  type = string
}

variable "database-instance-class" {
  default = "db.t2.micro"
  description = "The Database Instance Type"
  type = string
}

variable "database-instance-identifier" {
  default = "mysql57db"
  description = "The Database Instance Identifier"
  type = string
}

variable "multi-az-deployment" {
  default = false
  description = "Creating a Standby Database Instance"
  type = bool
}