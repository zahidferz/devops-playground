# devops-playground
Thank you for taking the time to read this assessment. This repo simulates a provisioning and configuration management code life cycle. It gives a starting point for candidates to demonstrate skills in certain areas like:
- Configuration as code
- Infrastructure as code
- Infrastructure design
- Peer reviews
- Testing
- Cloud providers and cloud-native solutions

## Setup

### Prerequisites
- Kubernetes 1.19+ (Tested with Docker Desktop, but any local Kubernetes cluster will do)
- Helm 3.2.0+
- Terraform v1.4.6
- aws cli
- jq-1.6
- curl
- wget
- kubectl
- helmfile
- helmfdiff

### Fork the repo
In order to share the assessment with us please **fork** this project in your personal Github account (forking is necessary for the Github actions to work). Please also clone your fork locally - needed for later steps.

Although we will be using a public repo in Github you will need a token to download artifacts from workflows. You can create one from:
`Profile -> Settings -> Developer setting -> Tokens (classic) 
`
## How does it work?
The idea is to interact with a local Kubernetes cluster using Github actions. Normally, the Github workflows would interact with a cloud service, however, for the sake of simplicity, workflows will only produce a shell script with Terraform and Helm commands, *for you to run them locally* (in other words, you will be the human component of the CI/CD pipeline). You have already an example at `.github/workflows/push-branch.yml`. 

Once the workflow is finished (for the workflow to start, push any commit to your fork, for example update the README), the following script will download the resultant artifact and it will run it against your local cluster:

`./run-pipeline.sh OWNER REPO ARTIFACT_NAME TOKEN
`

i.e.:

`./run-pipeline.sh jdelarosaizq devops-playground push-branches [TOKEN HERE]
`

What this workflow does is to provision a Neo4j instance and imports data from S3 into it. You can check if the pipeline worked running a query to Neo4j:

```
curl  \                                   
-H "Accept: application/json;charset=UTF-8" \
-H "Content-Type: application/json" \
-H "Authorization: Basic bmVvNGo6bXlTZWNyZXRQYXNzd29yZA==" \
-d  "{\"statements\":[{\"statement\":\" MATCH (p:Person) RETURN count(p) \"}]}" \
http://localhost:7474/db/neo4j/tx/commit
```

## Technical Stories
We are looking to improve the given starting point and continue adding more stages to the life cycle. As a devops engineer you could contribute on these:
- As a developer, I want to test my branches before merging to main, so I don't make untested changes in live infrastructure. 
- As an infrastructure engineer, I want Neo4j to hold state in a persistent volume, so when pod restarts I keep the data.
- As a devops engineer, I want a workflow for merging into main that applies infra changes, so we avoid manual changes.
- As a devops engineer, I want to test that the data was loaded, so my confidence increases. 
- As a service manager, I want to provision new Neo4j instances by using blue-green deployment, so that, there is no downtime. Use the two data releases provided.

**Note we don't expect you to deliver all of them as long as you will be able to demostrate the key skills**

## Discussion
- What would we need to change to deal with very large data files?
- What would be a good choice for our volumes?
- If we use this import process in a real environment. Is there any risk that our data could get stolen?
- What networking assets you would put in place in order to minimise risk of unauthorised connections?  

## Assumptions
You can make any assumptions at any time, remember you are free to choose they way you want to demonstrate skills to team, just keep track of them for later discussion with the team.



test
