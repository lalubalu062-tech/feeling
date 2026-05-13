# 1. Base image wahi rahegi
FROM feelingsurf/viewer:stable

# 2. Token aur Port set karein
ENV access_token=ee73e8d92bbcfd652e9796b5da3e1be7
EXPOSE 3000

# 3. Ek simple Welcome page banayein jise Back4app check karega
RUN echo "<h1>Welcome! FeelingSurf Bot is Alive and Running!</h1>" > index.html

# 4. Ek startup script banayein jo pehle Dummy Website (Port 3000) chalaye, aur fir Bot chalaye
RUN echo '#!/bin/bash \n\
echo "Starting Dummy Website for Back4app..." \n\
python3 -m http.server 3000 & \n\
echo "Starting FeelingSurf..." \n\
./viewer --no-sandbox --disable-dev-shm-usage \n\
' > start.sh

# 5. Script ko run karne ki permission dein
RUN chmod +x start.sh

# 6. Container start hote hi is script ko chala dein
ENTRYPOINT ["./start.sh"]
