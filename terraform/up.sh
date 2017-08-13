#!/usr/bin/env bash
terraform apply
gcloud compute instances list
ansible-playbook -u ubuntu --inventory-file=`which terraform-inventory` swarm.yml
LEADER=$(gcloud compute ssh consul-1 --command "sudo docker node list -f \"role=manager\" --format \"{{.Hostname}} {{.ManagerStatus}}\"" | grep Leader | awk '{print $1}')
gcloud compute scp ../docker-compose.yaml $LEADER:
gcloud compute scp ../compose-config $LEADER:
gcloud compute ssh consul-2 --command "sudo docker stack deploy --compose-file=docker-compose.yaml hadoop"
