#!/bin/bash

if [ -z "$GROQ_API_KEY" ]; then
  read -p "Enter Groq API Key: " KEY
  export GROQ_API_KEY="$KEY"
fi

read -p "Ask Groq: " QUESTION

curl -s https://api.groq.com/openai/v1/chat/completions \
  -H "Authorization: Bearer $GROQ_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{
    \"model\": \"llama-3.3-70b-versatile\",
    \"messages\": [
      {\"role\": \"user\", \"content\": \"$QUESTION\"}
    ],
    \"temperature\": 0.5,
    \"max_tokens\": 800
  }" | jq -r '.choices[0].message.content'
