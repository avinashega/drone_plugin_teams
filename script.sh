#!/bin/sh

if [ -z "$PLUGIN_WEBHOOK" ]; then
	if [ -z "$TEAMS_WEBHOOK_URL" ]; then
		echo "Need to set teams_webhook_url value"
		exit 1
	else
		WEBHOOK="$TEAMS_WEBHOOK_URL"
	fi
else
	WEBHOOK="$PLUGIN_WEBHOOK"
fi

if [ -z "$PLUGIN_CONTENT" ]; then
    echo "Need to set Content !"
    exit 1
fi

echo "Launch curl request" 
echo "-H \"Content-Type: application/json\""
echo "-X POST" 
echo "-d $PLUGIN_CONTENT"
echo "to  $WEBHOOK"


curl -H "Content-Type: application/json" -X POST -d "$PLUGIN_CONTENT" "$WEBHOOK"
