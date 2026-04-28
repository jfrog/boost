# Changelog

Boost releases are published on [GitHub Releases](https://github.com/jfrog/boost/releases).

Each release note should make the project pulse visible to users:

- what changed for CLI, coding-agent, or CI workflows;
- user-facing fixes and known limitations;
- upgrade notes, especially when changing the `jfrog/boost@v1` action or install behavior;
- security credits when coordinated disclosure applies.

## Release note checklist

Before publishing a release:

1. Confirm the tag follows semantic versioning, for example `v1.0.1`.
2. Generate notes with GitHub Releases using `.github/release.yml`.
3. Add a short "Highlights" section for the top user-visible changes.
4. Attach or verify signed binaries and checksums.
5. Promote the rolling major tag after the release is published.
