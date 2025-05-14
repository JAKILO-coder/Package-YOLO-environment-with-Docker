# Package-YOLO-environment-with-Docker

# Backend Docker Package  
Create image  
```
cd backend_docker  
docker build -t my-backend .   
```

Start image  
```
docker run --gpus all -v "\static:/app/static" -p 5000:5000 my-backend
```