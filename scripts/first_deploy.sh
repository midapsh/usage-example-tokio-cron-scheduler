#!/bin/bash

# First time
PROJECT_HOME="/opt"
PROJECT_HOWTO_TCS_HOME="$PROJECT_HOME/how-to-tokio-cron-scheduler"
pushd $PROJECT_HOME
git config --global user.name "Henrique Spadim"
git config --global user.email "henrique@spadim.com.br"
git config --global credential.helper cache
git clone -b $PROJECT_HOWTO_TCS_GIT_BRANCH --single-branch https://github.com/midapsh/usage-example-tokio-cron-scheduler how-to-tokio-cron-scheduler
pushd "$PROJECT_HOWTO_TCS_HOME"
git checkout $PROJECT_HOWTO_TCS_GIT_BRANCH

# Rust things
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
sudo apt-get install -y pkg-config
sudo apt-get install -y libssl-dev
sudo apt-get install -y build-essential
cargo check
cargo build --release

# Systemd things
sudo systemctl enable "$PROJECT_HOWTO_TCS_HOME/services/debank-extractor.service"
sudo systemctl daemon-reload
sudo systemctl start debank-extractor
popd
popd