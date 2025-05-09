#!/bin/bash

LOG_FILE="/var/log/user_process_tracker.log"

echo "----------------------------" >> $LOG_FILE
echo "User Process Tracker - $(date)" >> $LOG_FILE
echo "----------------------------" >> $LOG_FILE

# List all logged-in users
echo "Logged-in Users:" >> $LOG_FILE
who | awk '{print $1}' | sort | uniq >> $LOG_FILE
echo "" >> $LOG_FILE

# For each user, list their running processes
for user in $(who | awk '{print $1}' | sort | uniq)
do
    echo "Processes for user: $user" >> $LOG_FILE
    ps -u $user >> $LOG_FILE
    echo "" >> $LOG_FILE
done

echo "Tracking complete at $(date)" >> $LOG_FILE
echo "----------------------------" >> $LOG_FILE
echo "" >> $LOG_FILE

