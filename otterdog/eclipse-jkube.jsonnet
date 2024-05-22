local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-jkube') {
  settings+: {
    blog: "https://www.eclipse.dev/jkube/",
    description: "Successor of the deprecated Fabric8 Maven Plugin",
    email: "jkube-dev@eclipse.org",
    location: "the cloud",
    members_can_change_project_visibility: false,
    name: "Eclipse JKube",
    packages_containers_internal: false,
    packages_containers_public: false,
    twitter_username: "jkubeio",
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('ci') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Reporitory to host and automate CI pipelines",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('GH_ACCESS_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('GH_ACCESS_TOKEN_USER') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('jkube') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Build and Deploy java applications on Kubernetes",
      has_discussions: true,
      homepage: "https://www.eclipse.dev/jkube/",
      topics+: [
        "cloud-native-java",
        "docker",
        "gradle-plugin",
        "hacktoberfest",
        "java",
        "kubernetes",
        "maven-plugin",
        "openshift"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://circleci.com/hooks/github') {
          events+: [
            "fork",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://webhook-router.marcnuri.vercel.app/api/github') {
          content_type: "json",
          events+: [
            "*"
          ],
        },
        orgs.newRepoWebhook('https://ci.eclipse.org/jkube/github-webhook/') {
          content_type: "json",
          events+: [
            "pull_request",
            "push"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          required_status_checks+: [
            "any:eclipse-jkube/java-8",
            "any:eclipse-jkube/sonar"
          ],
          requires_pull_request: false,
        },
      ],
    },
    orgs.newRepo('jkube-images') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Container images for Eclipse JKube",
      homepage: "https://quay.io/organization/jkube",
      topics+: [
        "eclipse-jkube",
        "jkube"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('QUAY_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USER') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('jkube-integration-tests') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "E2E/integration/regression tests for Eclipse JKube project",
      homepage: "https://eclipse.dev/jkube",
      topics+: [
        "eclipse-jkube",
        "jkube"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('OPENSHIFT_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          required_status_checks+: [
            "any:License Check"
          ],
          requires_pull_request: false,
        },
      ],
    },
    orgs.newRepo('jkube-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Website for Eclipse JKube",
      homepage: "https://www.eclipse.dev/jkube",
      topics+: [
        "eclipse-jkube",
        "jkube"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('GIT_EMAIL') {
          value: "********",
        },
        orgs.newRepoSecret('GIT_NAME') {
          value: "********",
        },
        orgs.newRepoSecret('PAT_GITHUB') {
          value: "********",
        },
        orgs.newRepoSecret('SSH_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('SSH_USER') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          required_status_checks+: [
            "any:Checks"
          ],
          requires_pull_request: false,
        },
      ],
    },
    orgs.newRepo('jkube-website-publish') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "jkube published website",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('katacoda-scenarios') {
      archived: true,
      dependabot_security_updates_enabled: true,
      description: "Katacoda Scenarios for Eclipse JKube",
      homepage: "https://katacoda.com/jkubeio/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://editor.katacoda.com/scenarios/updated') {
          content_type: "json",
          events+: [
            "push"
          ],
          secret: "********",
        },
      ],
    },
    orgs.newRepo('kport') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Thanks to the seamless integration of port-forwarding and a proxy, developers can experience the sensation of effortlessly teleporting their applications into a development mode within a remote Kubernetes cluster, seamlessly replacing the existing remote app.",
      has_discussions: true,
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('PAT') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('team') {
      allow_forking: false,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Issue repository to manage cross-project or member-specific tasks and issues",
      has_wiki: false,
      private: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('vscode-kport') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
  ],
}
