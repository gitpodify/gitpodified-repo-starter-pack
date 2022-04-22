# Gitpodified Repo Starter Pack

An GitHub template usually Recap Time Squad uses on our fresh projects, with preloaded extensions and cuustom Dockerfile, for your next project with Gitpod.

While it might be a bit opinionated on our case (setting `DOCKER_BUILDKIT=1`, using Node.js gitignore template, using `package-lock.json` for npm instead of Yarn Modern/pnpm, etc.), we made this repo so you'll be easily get a new project up and running in Gitpod, together with some utility scripts to help you maintain your custom workspace image.

Note that CI part of things and even Hadolint configuration are not part of this template, so you may need to write them manually.

## Getting started

**GitHub users**: Either duplicate this repo through the regular repo creation workflow OR use the repo generator by clicking `Use this template` button.

**GitLab SaaS users**: Fork the repo then remove its fork association from Settings -> General -> Advanced OR `git clone`, `git remote set-url origin`, then `git push`.

## License

**Template repo and contributions**: MIT, although you don't need to credit us but that's also fine too if you will.
