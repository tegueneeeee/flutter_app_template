## Overview

This project includes a preconfigured GitHub workflow that automatically assigns reviewers when a Pull Request is created.

The current workflow requires proper configuration of GitHub access tokens to function correctly.

> [!NOTE]
> For smaller teams not using GitHub Teams for reviewer assignment, you may alternatively use [hkusu/review-assign-action].

## Configuration Instructions

### 1. GitHubアクセストークンの設定

In [.github/workflows/auto-assign.yaml], configure the appropriate GitHub App `app-id` and `private-key` in the `Generate a token` step under `jobs.request-reviewers`.

If you don't have a GitHub App for token generation, create one first.

```yaml
  request-reviewers:
    ...

    steps:
      - name: Generate a token
        id: app-token
        uses: actions/create-github-app-token@vX.X.X
        with:
          app-id: #Enter the proper values
          private-key: #Enter the proper values
```

### 2. Configure GitHub Repository Variables

Set up the `REVIEWERS` and `TEAM_REVIEWERS` variables in your GitHub repository settings. ([GitHub Variables] Documentation)

You can specify multiple entries using comma-separated values:

- `REVIEWERS`: `username1,username2,username3`
- `TEAM_REVIEWERS`: `team1,team2,team3`

<!-- Links -->
[hkusu/review-assign-action]: https://github.com/hkusu/review-assign-action

[.github/workflows/auto-assign.yaml]: /.github/workflows/auto-assign.yaml

[GitHub Variables]: https://docs.github.com/en/actions/learn-github-actions/variables
