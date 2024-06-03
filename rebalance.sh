#!/bin/bash

# Telegram bot token
TELEGRAM_BOT_TOKEN="your_telegram_bot_token_here"

# Telegram chat ID to send messages to
TELEGRAM_CHAT_ID="your_telegram_chat_id_here"

# Activate the virtual environment
source /path/to/your/venv/bin/activate

# Function to send a message on Telegram
function send_telegram_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
        -d "chat_id=$TELEGRAM_CHAT_ID" \
        -d "text=$message" >/dev/null
}

# Function to perform a rebalance attempt with retry
function rebalance_with_retry() {
    local from_channel_id="$1"
    local from_channel_name="$2"
    local to_channel_id="$3"
    local to_channel_name="$4"
    local amount="$5"
    local attempt=1

    while [[ $attempt -le 3 ]]; do
        # Replace "./rebalance.py" with the path to your rebalance script
        ./rebalance.py -t "$to_channel_id" -f "$from_channel_id" -a "$amount"
        if [[ $? -eq 0 ]]; then
            ((successful_rebalances++))
            send_telegram_message "Rebalance successful: from $from_channel_name to $to_channel_name with amount $amount satoshis"
            ((attempt++))
            if [[ $amount -eq 10000 ]]; then
                amount=20000
                attempt=1
            else
                break
            fi
        else
            break
        fi
    done
}

# Channels to receive
declare -A receive_channels=(
    ["your_receiver_channel_id_1"]="Receiver Channel Name 1"
    ["your_receiver_channel_id_2"]="Receiver Channel Name 2"
)

# Channels to send
declare -A send_channels=(
    ["your_sender_channel_id_1"]="Sender Channel Name 1"
    ["your_sender_channel_id_2"]="Sender Channel Name 2"
)

# Main loop
while true; do
    # Initialize variables to keep track of the total number of attempts and successful attempts
    total_attempts=0
    successful_rebalances=0

    # Get the channel liquidity information and send it to Telegram
    # Replace "./rebalance.py -c" with the command to get liquidity information from your script
    liquidity_info=$(./rebalance.py -c)
    send_telegram_message "Channel liquidity information before rebalancing:\n$liquidity_info"

    # Attempt rebalancing for each pair of send and receive channels
    for to_channel_id in "${!receive_channels[@]}"; do
        to_channel_name="${receive_channels[$to_channel_id]}"
        for from_channel_id in "${!send_channels[@]}"; do
            from_channel_name="${send_channels[$from_channel_id]}"
            ((total_attempts++))
            rebalance_with_retry "$from_channel_id" "$from_channel_name" "$to_channel_id" "$to_channel_name" 10000
        done
    done

    # Send the total attempts and successful rebalances to Telegram
    send_telegram_message "Total attempts: $total_attempts\nTotal successful rebalances: $successful_rebalances"

    # Sleep for 1 hour (3600 seconds)
    sleep 3600
done

# Deactivate the virtual environment
deactivate
