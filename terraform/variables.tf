variable "project_id" {
  default = "dev-gke-359713"
}

variable "region_name" {
    default = "europe-west2"
}

variable "nat_name" {
    default = "nat"
}

variable "port_numbers" {
    type = list(string)
    default = [22,80,443,8443]  
}

variable "source_range" {
    type = list(string)
    default = ["192.168.0.27"]
}

variable "nodea_region" {
    default = "europe-west2-b"
}

variable "nodeb_region" {
  default = "europe-west2-a"
}

variable "workload_pool_name" {
    default = "dev-gke-359713.svc.id.goog"  
}

variable "private_cluster_config_cidrrange" {
    default = "172.5.0.0/28"
}

variable "k8s_cluster_name" {
    default = "dev"
}

variable "subnet_cidr_range" {
    default = "10.0.0.0/18"
}

variable "k8s_podip_range" {
    default = "10.16.0.0/14"
}

variable "k8s_serviceip_range" {
    default = "10.45.0.0/20"
}

variable "router_name" {
    default = "router"
}

variable "node_machine_type" {
    default = "e2-small" 
}
variable "google_service_accountid" {
    default = "dev-k8s"
}
variable "conatiner_nodepool_name" {
    default = "devpool1"
}
variable "containernode_role_name" {
    default = "dev"
}