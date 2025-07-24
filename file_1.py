from fastapi import FastAPI
from fastapi.responses import JSONResponse
import uvicorn

print("This is file_1.py 🟡")

app = FastAPI()

@app.get("/status")
async def status():
    return JSONResponse(content={"status": "ok","message": "File 1 in Wrap Audio is running!"})

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)