resource "aws_eks_cluster" "k8-cluster" {
  name     = "k8-cluster"
  role_arn = "arn:aws:iam::338665245618:role/eks-cluster-role"
  version  = "1.28"

  vpc_config {
    subnet_ids         = ["subnet-0c542ada8b39ab9cc", "subnet-0b686a2f50c5f6be2"]
    security_group_ids = ["sg-06caed9cd6d6f3e7c"]
  }
}

resource "aws_eks_node_group" "k8-cluster-node-group" {
  cluster_name    = aws_eks_cluster.k8-cluster.name
  node_group_name = "k8-cluster-node-group"
  node_role_arn   = "arn:aws:iam::338665245618:role/node-role"
  subnet_ids      = ["subnet-0c542ada8b39ab9cc", "subnet-0b686a2f50c5f6be2"]

  scaling_config {
    desired_size = 3
    min_size     = 2
    max_size     = 5
  }
}