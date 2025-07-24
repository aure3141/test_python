
#!/bin/bash

echo "🚀 Starting audio pipeline services..."

# Activate venv if exists
if [ -d "venv" ]; then
    source venv/bin/activate
fi

# Create log folder if needed
mkdir -p logs

# Step 0: Uvicorn API
nohup uvicorn file_1:app --host 0.0.0.0 --port 8777 > logs/step0_upload.log 2>&1 &


echo "✅ All services started. Logs are in the 'logs/' folder."