workspace {

    !identifiers hierarchical

    model {
        cloudArchitectEngineer = person "Cloud Architect/Engineer" {
            description "The Cloud Architect/Engineer who pair programs with the Architect GPT Assistant on the architecture as code and approves significant changes."
        }

        gitRepo = softwareSystem "Git Repository" {
            description "Stores version-controlled Architecture as Code (AaC)."
        }

        ciCdPipeline = softwareSystem "CI/CD Pipeline" {
            description "Manages the build, test, and deployment processes."

            buildManager = container "Build Manager" {
                description "Handles the build process."
                technology "Jenkins"
            }

            testAutomation = container "Test Automation" {
                description "Automates the testing process."
                technology "Selenium, JUnit"
            }

            deploymentManager = container "Deployment Manager" {
                description "Manages the deployment process."
                technology "Ansible, Kubernetes"
            }

            securityAndCompliance = container "Security and Compliance" {
                description "Ensures security and compliance of IaC."
                technology "HashiCorp Sentinel"
            }
        }

        aws = softwareSystem "AWS" {
            description "Amazon Web Services cloud platform."
        }

        azure = softwareSystem "Azure" {
            description "Microsoft Azure cloud platform."
        }

        gcp = softwareSystem "GCP" {
            description "Google Cloud Platform."
        }

        llm = softwareSystem "LLM" {
            description "Large Language Model system."

            architectLLM = container "Architect LLM" {
                description "Large language model used by Architect GPT Assistant."
                technology "OpenAI GPT-4o, OpenAI API"
            }

            parserLLM = container "Parser LLM" {
                description "Large language model used by LLM-Based Model Parser."
                technology "OpenAI GPT-4o, OpenAI API"
            }
        }
    }
}
