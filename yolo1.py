from ultralytics import YOLO
import sys
import io

import shutil
shutil.rmtree('runs/detect')

# https://docs.ultralytics.com/modes/predict/#working-with-results
# Load a model
model = YOLO('yolov8n.pt')  # pretrained YOLOv8n model

source = sys.argv[1]

results = model.predict(source, stream=False, save=True, imgsz=320, conf=0.5)

for r in results:
	print(r.tojson())
