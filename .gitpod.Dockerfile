# In this example, we use the default gitpod/workspace-full image here, but feel free to change.
FROM gitpod/workspace-full

# Step 0: Make sure we're using bash instead of plain sh
# Related Moby and Docker Docs issues:
# - https://github.com/moby/moby/issues/7281
# - https://github.com/moby/moby/pull/22489
# - https://github.com/moby/moby/pull/7489
SHELL ["/bin/bash", "-c"]

# Step 1: Upgrade Node.js to latest LTS verson and get latest npm cli stable release,
# and then install some tolls from npm like Prettier, ESLint and DangerJS
RUN source ~/.nvm/nvm-lazy.sh \
    && nvm install 'lts/*' --reinstall-packages-from=default --latest-npm \
    && npm i -g prettier eslint danger typescript

# Step 2: Install ShellCheck, Hadolint, direnv and HTTPie through Linuxbrew.
# There'll be mandatory `brew update && brew upgrade` to make sure our local index aren't going stale.
RUN brew update \
    && brew upgrade \
    && brew install shellcheck hadolint direnv httpie

# Step 3: Install both HashiCorp Vault and Doppler CLIs. Remember to take your pick or even
# update this with your secrets management soultion if that's the case.
RUN brew install vault \
    && curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | sudo apt-key add -\
    && echo "deb https://packages.doppler.com/public/cli/deb/debian any-version main" | sudo tee /etc/apt/sources.list.d/doppler-cli.list \
    && sudo install-packages doppler
