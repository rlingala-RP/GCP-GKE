variable "project_id" {
  default = "gcp-gke-dev-360209"
}

variable "region_name" {
    default = "europe-west2"
}

variable "nat_name" {
    default = "nat"
}

variable "vpcname" {
    default = "devkube"
  
}

variable "port_numbers" {
    type = list(string)
    default = [22,80,443,8443]  
}

variable "source_range" {
    type = list(string)
    default = ["0.0.0.0"]
}

variable "nodea_region" {
    default = "europe-west2-b"
}

variable "nodeb_region" {
  default = "europe-west2-a"
}

variable "workload_pool_name" {
    default = "gcp-gke-dev-360209.svc.id.goog"  
}

variable "private_cluster_config_cidrrange" {
    type = string
    default = "172.6.0.0/28"
}

variable "k8s_cluster_name" {
    default = "devkube"
}

variable "subnet_cidr_range" {
    type = string
    default = "10.0.0.0/18"
}

variable "k8s_podip_range" {
    type = string
    default = "10.16.0.0/14"
}

variable "k8s_serviceip_range" {
    type = string
    default = "10.46.0.0/20"
}

variable "router_name" {
    default = "router"
}

variable "node_machine_type" {
    default = "e2-small" 
}
variable "google_service_accountid" {
    default = "devkube"
}
variable "conatiner_nodepool_name" {
    default = "devpool"
}
variable "containernode_role_name" {
    default = "dev"
}