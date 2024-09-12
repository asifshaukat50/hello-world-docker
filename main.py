from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "App Version: 1.0"}


@app.get("/hello")
async def root():
    return {"message": "Hello World"}


@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}
