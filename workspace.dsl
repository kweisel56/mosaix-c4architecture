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

                ui = component "UI" {
                    description "Provides the graphical user interface for user interactions."
                    technology "React"
                }

                apiInput = component "API Input" {
                    description "Handles API requests for user interactions."
                    technology "FastAPI"
                }

                monitoringDashboard = component "Monitoring Dashboard" {
                    description "Displays system health, performance metrics, and alerts."
                    technology "React, Grafana"
                }

                configurationManagement = component "Configuration Management" {
                    description "Manages system configurations, settings, and access controls."
                    technology "React, FastAPI"
                }

                user -> ui "Uses"
                ui -> apiInput "Sends API requests"
                ui -> monitoringDashboard "Displays system health and performance metrics"
                ui -> configurationManagement "Manages configurations and access controls"
            }

            architectGPTAssistant = container "Architect GPT Assistant" {
                description "An AI assistant that helps users design and optimize their cloud architecture."
                technology "Python, OpenAI GPT-4o"
                tags "Robot"
                
                requestHandler = component "Request Handler" {
                    description "Handles incoming requests from the Input Interface."
                    technology "FastAPI"
                }

                llmInterfaceAGPT = component "LLM Interface AGPT" {
                    description "Connects to the underlying large language model (GPT-4o) to process and generate responses."
                    technology "Python"
                }

                architectureGenerator = component "Architecture Generator" {
                    description "Generates cloud architecture designs based on user requirements."
                    technology "Custom algorithms, Python"
                }

                sessionManager = component "Session Manager" {
                    description "Manages user sessions and state across interactions."
                    technology "Redis, Python"
                }

                requestHandler -> llmInterfaceAGPT "Forwards to LLM for processing"
                llmInterfaceAGPT -> architectureGenerator "Uses generated responses to create architectures"
                requestHandler -> sessionManager "Manages user sessions and states"
            }

            modelParser = container "AI-Based Model Parser" {
                description "Processes DSL inputs and transforms them into a structured JSON format, with enhanced AI capabilities for real-time processing and adaptive parsing."
                technology "Microservice"

                dslProcessor = component "DSL Processor" {
                    description "Processes the DSL input to extract defined elements and their metadata."
                    technology "Python, NLP"
                }

                metadataExtractor = component "Metadata Extractor" {
                    description "Extracts metadata from the DSL for further processing."
                    technology "Python, Machine Learning"
                }

                jsonTransformer = component "JSON Transformer" {
                    description "Converts the processed DSL and metadata into a structured JSON format."
                    technology "Python, Rule-based Systems, ML"
                }

                llmInterfaceParser = component "LLM Interface Parser" {
                    description "Connects to the underlying large language model to assist in parsing and transforming DSL to JSON."
                    technology "Python"
                }

                apiHandlerParser = component "API Handler Parser" {
                    description "Handles API requests and responses."
                    technology "FastAPI, ML"
                }

                realTimeDataIngestion = component "Real-time Data Ingestion" {
                    description "Handles streaming data inputs for real-time processing."
                    technology "Kafka, Apache Flink, ML"
                }

                feedbackLoopIntegrator = component "Feedback Loop Integrator" {
                    description "Integrates feedback from deployment outcomes back into the parsing process."
                    technology "Python, Reinforcement Learning"
                }

                contextualAnalyzer = component "Contextual Analyzer" {
                    description "Analyzes context from historical data to improve parsing accuracy."
                    technology "Python, NLP"
                }

                apiHandlerParser -> dslProcessor "Processes DSL inputs"
                dslProcessor -> metadataExtractor "Extracts metadata"
                metadataExtractor -> jsonTransformer "Transforms into JSON"
                jsonTransformer -> llmInterfaceParser "Assists in transformation"
                realTimeDataIngestion -> dslProcessor "Streams data for real-time processing"
                feedbackLoopIntegrator -> dslProcessor "Integrates feedback"
                contextualAnalyzer -> dslProcessor "Analyzes context for better accuracy"
            }

            mappingEngine = container "AI-Based Mapping Engine" {
                description "Processes JSON inputs to decompose, match, and merge templates into deployable IaC with dynamic and autonomous capabilities."
                technology "Microservice"

                jsonDecomposer = component "JSON Decomposer" {
                    description "Decomposes the JSON received from the Model Parser into individual elements."
                    technology "Java"
                }

                dynamicTemplateMatcher = component "Dynamic Template Matcher" {
                    description "Dynamically matches JSON elements to templates using real-time data."
                    technology "Java, Machine Learning"
                }

                templateMatcher = component "Template Matcher" {
                    description "Matches decomposed elements to appropriate Infrastructure as Code (IaC) templates from the repository."
                    technology "Java, Spring Boot"
                }

                patternMerger = component "Pattern Merger" {
                    description "Merges multiple IaC templates into a cohesive deployment pattern."
                    technology "Java"
                }

                autonomousPatternGenerator = component "Autonomous Pattern Generator" {
                    description "Generates new IaC patterns autonomously based on identified issues."
                    technology "Java, AI algorithms"
                }

                selfHealingModuleMapping = component "Self-healing Module Mapping" {
                    description "Implements self-healing capabilities to automatically correct deployment issues."
                    technology "Java, Kubernetes"
                }

                llmInterfaceMapping = component "LLM Interface Mapping" {
                    description "Connects to the underlying large language model to assist in mapping and merging processes."
                    technology "Python"
                }

                apiHandlerMapping = component "API Handler Mapping" {
                    description "Handles API requests and responses."
                    technology "Spring Boot"
                }

                modelParser -> jsonDecomposer "Receives JSON from Model Parser"
                jsonDecomposer -> dynamicTemplateMatcher "Sends decomposed JSON elements"
                dynamicTemplateMatcher -> templateMatcher "Sends dynamically matched JSON elements"
                templateMatcher -> patternMerger "Sends matched templates"
                patternMerger -> autonomousPatternGenerator "Provides merged patterns"
                autonomousPatternGenerator -> selfHealingModuleMapping "Sends generated patterns"
                llmInterfaceMapping -> jsonDecomposer "Assists in decomposition"
                llmInterfaceMapping -> dynamicTemplateMatcher "Assists in matching"
                llmInterfaceMapping -> templateMatcher "Assists in template matching"
                llmInterfaceMapping -> patternMerger "Assists in merging"
                llmInterfaceMapping -> autonomousPatternGenerator "Assists in pattern generation"
                llmInterfaceMapping -> selfHealingModuleMapping "Assists in self-healing"
                apiHandlerMapping -> patternMerger "Handles API requests"
            }

            templateRepository = container "Code Template Repository" {
                description "Stores architecture, infrastructure, configuration, and security code templates for various cloud patterns."
                technology "Repository"

                templateVersionControl = component "Template Version Control" {
                    description "Manages version control and tracking of templates."
                    technology "Git"
                }

                templateReviewSystem = component "Template Review System" {
                    description "Handles review and approval of updated templates before merging."
                    technology "GitHub Actions"
                }

                deploymentTracking = component "Deployment Tracking" {
                    description "Tracks deployments of template versions across the organization."
                    technology "Custom solution"
                }
            }

            inputInterface -> architectGPTAssistant "Utilizes AI assistance"
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

                            apiGateway = infrastructureNode "API Gateway" "Routes API requests to backend services and supports A/B testing." {
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
                                "availabilityZone" "us-east-multiple"
                            }

                            kubernetes = deploymentNode "Kubernetes Service" {
                                tags "Kubernetes Service"

                                kubernetesCluster = deploymentNode "Kubernetes Cluster" {
                                    tags "Kubernetes Cluster"

                                    kubernetesNodeGroup = deploymentNode "Kubernetes Node Group" {
                                        tags "Kubernetes Node Group"

                                        inputInterfacePod = containerInstance inputInterface
                                        gptAssistantPod = containerInstance architectGPTAssistant
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

        component inputInterface {
            include *
            autolayout lr
        }

        component architectGPTAssistant {
            include *
            autolayout lr
        }

        component modelParser {
            include *
            autolayout lr
        }

        component mappingEngine {
            include *
            autolayout lr
        }

        component templateRepository {
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
