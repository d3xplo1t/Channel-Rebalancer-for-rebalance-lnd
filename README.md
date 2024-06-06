Channel Rebalancer for rebalance-lnd
Description

This Bash script automates the process of rebalancing Lightning Network channels using rebalance-lnd, a script by C-Otto. It transfers funds between specified sender and receiver channels, ensuring your channels remain balanced.
Features

    Automated Rebalancing: Automatically rebalances Lightning Network channels based on dynamically determined sender and receiver channels.
    Retry Mechanism: Implements a retry mechanism to ensure successful rebalancing.
    Telegram Notifications: Sends notifications via Telegram with rebalancing results and channel liquidity information.

Prerequisites

    Python 3.x installed on your system.
    A virtual environment set up with necessary dependencies.
    rebalance-lnd script by C-Otto installed and accessible.
    Telegram Bot token and chat ID for receiving notifications.

Usage

    Clone this repository to your local machine:

    bash

git clone https://github.com/d3xplo1t/channel-rebalancer-for-rebalance-lnd.git

Navigate to the project directory:

bash

cd channel-rebalancer

Activate your virtual environment:

bash

source /path/to/your/venv/bin/activate

Install rebalance-lnd if not already installed. Follow the instructions on the rebalance-lnd repository.

Replace the placeholders in the script with your actual Telegram Bot token and chat ID.

Run the script:

bash

    bash rebalance.sh

    Sit back and let the script handle the rebalancing for you!

Configuration

    TELEGRAM_BOT_TOKEN: Your Telegram Bot token.
    TELEGRAM_CHAT_ID: Your Telegram chat ID.
