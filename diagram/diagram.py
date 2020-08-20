# diagram.py
from diagrams import Cluster, Diagram
from diagrams.aws.compute import ECR

with Diagram("Registry", show=False):
          ECR("ECR")
