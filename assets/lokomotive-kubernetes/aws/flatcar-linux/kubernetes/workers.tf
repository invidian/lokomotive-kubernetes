module "workers" {
  source = "./workers"
  name   = var.cluster_name

  # AWS
  vpc_id          = aws_vpc.network.id
  subnet_ids      = aws_subnet.public.*.id
  security_groups = [aws_security_group.worker.id]
  worker_count    = var.worker_count
  instance_type   = var.worker_type
  os_name         = var.os_name
  os_channel      = var.os_channel
  os_version      = var.os_version
  disk_size       = var.disk_size
  spot_price      = var.worker_price
  target_groups   = var.worker_target_groups
  tags            = var.tags

  # configuration
  kubeconfig            = module.bootkube.kubeconfig-kubelet
  ssh_keys              = var.ssh_keys
  service_cidr          = var.service_cidr
  cluster_domain_suffix = var.cluster_domain_suffix
  clc_snippets          = var.worker_clc_snippets
}
