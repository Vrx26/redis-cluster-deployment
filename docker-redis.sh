 #!/bin/bash
 sudo docker run -d --network host -v /home/vrx26/redis-cluster-deployment/redis.conf:/usr/local/etc/redis/redis.conf --name redis-server-1 redis redis-server /usr/local/etc/redis/redis.conf
