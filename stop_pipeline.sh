#!/bin/bash

echo "🛑 Stopping audio pipeline services..."

# รายชื่อ script ที่จะหยุด
scripts=(
  "uvicorn file_1:app"
  # "services/step1_convert_to_wave.py"
  # "services/step2_diarize_wave.py"
  # "services/step3_split_into_chunk.py"
  # "services/step4_check_memory.py"
  # "services/step5_transcribe.py"
  # "services/step6_convert_to_mp3.py"
  # "services/step7_notify.py"
)

# วนลูปเพื่อ kill process
for script in "${scripts[@]}"; do
  pkill -f "$script" && echo "✔️ Stopped: $script"
done

echo "📦 Stopping RabbitMQ (via stop_rabbit.sh)..."
if [[ -f "./stop_rabbit.sh" ]]; then
  chmod +x ./stop_rabbit.sh
  ./stop_rabbit.sh
else
  echo "⚠️ stop_rabbit.sh not found!"
fi

echo "✅ All services stopped."