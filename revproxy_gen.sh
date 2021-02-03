if [ $# != 3 ];
    echo "Default conf must have 3 droplets"
    exit 1
fi

base="upstream dataset {
    server $1:8002;
    server $2:8002;
    server $3:8002;
}

upstream activity {
    server $1:8001;
    server $2:8001;
    server $3:8001;
}

server {
    listen 80;

    location /neural {
        proxy_pass http://dataset/predict;
    }

    location /dataset {
        proxy_pass http://dataset/data;
    }

    location /service {
        proxy_pass http://activity/service;
    }

    location /situation {
        proxy_pass http://activity/situation;
    }
}"