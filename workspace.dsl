workspace "MosAiX Deployment" "An example of MosAiX deployment architecture." {
    model {
        user = person "Cloud Architect/Engineer" {
            description "A user who interacts with the GPT Assistant to write Architecture as Code using an IDE."
        }
        
        mosAix = softwareSystem "MosAiX" {
            description "A revolutionary platform for cloud management powered by advanced LLMs, managing multiple cloud vendors agnostically."

            inputInterface = container "Input Interface" {
                description "Provides a user-friendly interface for monitoring, configuration management, and API interactions."
                technology "Web Application"
            }

            gptAssistant = container "Architect GPT Assistant" {
                description "An AI assistant that helps users design and optimize their cloud architecture."
                technology "AI Service"
            }

            modelParser = container "AI-Based Model Parser" {
                description "Processes DSL inputs and transforms them into a structured JSON format, with enhanced AI capabilities for real-time processing and adaptive parsing."
                technology "Microservice"
            }

            mappingEngine = container "AI-Based Mapping Engine" {
                description "Processes JSON inputs to decompose, match, and merge templates into deployable IaC with dynamic and autonomous capabilities."
                technology "Microservice"
            }

            templateRepository = container "Code Template Repository" {
                description "Stores architecture, infrastructure, configuration, and security code templates for various cloud patterns."
                technology "Repository"
            }

            user -> inputInterface "Interacts with"
            inputInterface -> gptAssistant "Utilizes AI assistance"
            inputInterface -> modelParser "Sends DSL inputs"
            modelParser -> mappingEngine "Sends structured JSON"
            mappingEngine -> templateRepository "Stores and retrieves templates"
        }

        git = softwareSystem "Git" {
            description "Version control system where the DSL is stored."
        }

        ciPipeline = softwareSystem "CI Pipeline" {
            description "Continuous Integration Pipeline triggered by gitflow change process."
        }

        mosAix -> git "Stores DSL"
        git -> ciPipeline "Triggers on gitflow change"

        deploymentEnvironment "Production" {
            deploymentNode "Cloud Provider" {
                tags "Cloud"
                properties {
                    "owner" "Cloud Team"
                }

                region = deploymentNode "Region" {
                    tags "Region"

                    ipScheme = deploymentNode "Network" {
                        tags "ipScheme"
                        properties {
                            "networkAdmin" "Network Team"
                            "cidr" "10.0.0.0/16"
                        }

                        publicSubnet = deploymentNode "Public Subnet" "10.0.0.0/24" {
                            tags "Subnet"
                            properties {
                                "availabilityZone" "us-east-multiple"
                            }

                            apiGateway = infrastructureNode "API Gateway" "Routes API requests to backend services." {
                                tags "API Gateway"
                                properties {
                                    "owner" "API Team"
                                    "scheme" "internet-facing"
                                }
                            }
                        }

                        privateSubnet = deploymentNode "Private Subnet" "10.0.1.0/24" {
                            tags "Subnet"
                            properties {
                                "availabilityZone" "us-east-1b"
                            }

                            kubernetes = deploymentNode "Kubernetes Service" {
                                tags "Kubernetes Service"

                                kubernetesCluster = deploymentNode "Kubernetes Cluster" {
                                    tags "Kubernetes Cluster"

                                    kubernetesNodeGroup = deploymentNode "Kubernetes Node Group" {
                                        tags "Kubernetes Node Group"

                                        inputInterfacePod = containerInstance inputInterface
                                        gptAssistantPod = containerInstance gptAssistant
                                        modelParserPod = containerInstance modelParser
                                        mappingEnginePod = containerInstance mappingEngine
                                        templateRepositoryPod = containerInstance templateRepository
                                    }
                                }
                            }

                            monitoring = infrastructureNode "Monitoring" "Monitoring and logging service." {
                                tags "Monitoring"
                            }
                        }

                        identityAccessManagement = infrastructureNode "Identity and Access Management" "Identity and Access Management service." {
                            tags "Identity and Access Management"
                        }
                    }

                    apiGateway -> inputInterfacePod "Forwards requests to" "HTTPS"
                    inputInterfacePod -> monitoring "Sends logs to"
                    inputInterfacePod -> identityAccessManagement "Uses roles and policies from"
                }
            }
        }
    }

    views {
        systemContext mosAix {
            include *
            autolayout lr
        }

        container mosAix {
            include *
            autolayout lr
        }

        deployment mosAix "Production" {
            include *
            autolayout lr
        }

        styles {
            element "Element" {
                shape roundedbox
                background #ffffff
            }
            element "Container" {
                background #ffffff
            }
            element "Application" {
                background #ffffff
            }
            element "Database" {
                shape cylinder
            }
            element "Subnet" {
                background #c0e0ff
                shape roundedbox
                border dashed
            }
        }

        themes https://static.structurizr.com/themes/amazon-web-services-2023.01.31/theme.json
    }
}
