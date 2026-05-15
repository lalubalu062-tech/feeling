FROM feelingsurf/viewer:stable

# Root user switch karein taaki python install ho sake
USER root
RUN apt-get update && apt-get install -y python3 && rm -rf /var/lib/apt/lists/*

ENV access_token=a66728c47adfaacd86291986d9f9827e
EXPOSE 3000

# Dummy page create karein
RUN echo "FeelingSurf is Running" > index.html

# Render ke liye startup command:
# 1. Python server background mein chalu hoga
# 2. Phir viewer chalu hoga (bina path ke, global use karke)
CMD python3 -m http.server 3000 & viewer --no-sandbox --disable-dev-shm-usage
