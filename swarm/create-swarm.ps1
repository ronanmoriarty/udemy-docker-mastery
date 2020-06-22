aws cloudformation create-stack `
    --stack-name udm-swarm-vpc `
    --template-body file://c:/code/third-party/udemy-docker-mastery/swarm/docker-swarm-network.yml `
    --parameters ParameterKey=Environment,ParameterValue=development

aws cloudformation create-stack `
    --stack-name udm-swarm `
    --template-body file://c:/code/third-party/udemy-docker-mastery/swarm/docker-swarm-boxes.yml `
    --parameters ParameterKey=NetworkStack,ParameterValue=udm-swarm-vpc