# Base image wahi feelingsurf wali rahegi
FROM feelingsurf/viewer:stable

# Apna token yahan set kar do
ENV ACCESS_TOKEN=ee73e8d92bbcfd652e9796b5da3e1be7

# Browser crash (shared memory issue) rokne ke liye flags
ENTRYPOINT ["./viewer", "--no-sandbox", "--disable-dev-shm-usage"]
