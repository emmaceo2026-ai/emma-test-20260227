Auto-Deploy Locked: Yes

Proposed Skills:

GitHubManager:
  Purpose: Manage GitHub repositories and automate actions like PRs and issues.
  Triggers: On-demand and scheduled tasks.
  Cost: Low API call rates.
  Risk: Unauthorized changes if poorly configured.
  Approval Gate: Requires oversight for major actions.

VercelDeployer:
  Purpose: Automate deployment to Vercel for web applications.
  Triggers: After successful builds or scheduled updates.
  Cost: Minimal with per deploy pricing.
  Risk: Deployment failures impacting live sites.
  Approval Gate: Must pass testing before public deployment.