workspace extends https://path-to-common-elements.dsl {

    views {
        systemContext mosAiX {
            include *
            exclude gitRepo
        }

        container mosAiX {
            include *
            include ciCdPipeline
            include aws
            include azure
            include gcp
            exclude gitRepo
        }

        component mosAiX.inputInterface {
            include *
        }

        component mosAiX.architectGPTAssistant {
            include *
        }

        component mosAiX.modelParser {
            include *
            include gitRepo
            include ciCdPipeline
        }

        component mosAiX.mappingEngine {
            include *
            include mosAiX.apiHandlerParser
            include mosAiX.templateVersionControl
            include mosAiX.templateReviewSystem
            include ciCdPipeline.deploymentManager
            include mosAiX.jsonDecomposer
            include mosAiX.dynamicTemplateMatcher
            include mosAiX.templateMatcher
            include mosAiX.patternMerger
            include mosAiX.autonomousPatternGenerator
            include mosAiX.selfHealingModuleMapping
            include mosAiX.llmInterfaceMapping
        }

        component mosAiX.codeTemplateRepo {
            include *
        }

        component mosAiX.monitoringService {
            include *
        }

        component mosAiX.aiMlAnalytics {
            include *
        }

        component mosAiX.detectionRemediation {
            include *
        }

        component mosAiX.chaosTesting {
            include *
        }

        container llm {
            include *
        }

        styles {
            element "Robot" {
                shape Robot
            }

            relationship "standardChange" {
                color #00994C
            }

            relationship "selfhealingChange" {
                color #FF0000
            }

            relationship "CircuitBreaker" {
                color #0000FF
                dashed true
            }

            relationship "default" {
                color #707070
                dashed true
                routing Direct
            }
        }

        theme default
    }
}
