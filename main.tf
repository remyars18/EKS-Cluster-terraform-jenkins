resource "aws_eks_cluster" "k8-cluster" {
  name     = "k8-cluster"
  role_arn = "arn:aws:iam::670004487191:role/eks-cluster-role"
  version  = "1.30"

  vpc_config {
    subnet_ids         = ["subnet-02c0b12e8618deb13", "subnet-030450037e10aaf44"]
    security_group_ids = ["sg-0d881e3b78f8ca1fc"]
  }
}

resource "aws_eks_node_group" "k8-cluster-node-group" {
  cluster_name    = aws_eks_cluster.k8-cluster.name
  node_group_name = "k8-cluster-node-group"
  node_role_arn   = "arn:aws:iam::670004487191:role/node-role"
  subnet_ids      = ["subnet-02c0b12e8618deb13", "subnet-030450037e10aaf44"]

  scaling_config {
    desired_size = 3
    min_size     = 2
    max_size     = 5
  }
}