Channel Rebalancer

This script helps rebalance Lightning Network channels by transferring funds between specified sender and receiver channels.
Features

    Automated Rebalancing: Automatically rebalances Lightning Network channels based on specified sender and receiver channels.
    Retry Mechanism: Implements a retry mechanism to ensure successful rebalancing.
    Telegram Notifications: Sends notifications via Telegram with rebalancing results.

Prerequisites

    Python 3.x installed on your system.
    A virtual environment set up with necessary dependencies.
    Telegram Bot token and chat ID for receiving notifications.

Usage

    Clone this repository to your local machine:

    bash

git clone https://github.com/d3xplo1t/channel-rebalancer.git

Navigate to the project directory:

bash

cd channel-rebalancer

Activate your virtual environment:

bash

source /path/to/your/venv/bin/activate

Replace the placeholders in the script with your actual Telegram Bot token, chat ID, and channel IDs and names.

Run the script:

bash

    bash rebalance.sh

    Sit back and let the script handle the rebalancing for you!

Configuration

    TELEGRAM_BOT_TOKEN: Your Telegram Bot token.
    TELEGRAM_CHAT_ID: Your Telegram chat ID.
    receive_channels: Dictionary mapping receiver channel IDs to their names.
    send_channels: Dictionary mapping sender channel IDs to their names.

