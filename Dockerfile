FROM electronuserland/builder:wine-mono

# Add chrome repo
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN apt-get update
RUN apt-get install xvfb -y
RUN apt-get install google-chrome-stable -y

RUN export ELECTRON_ENABLE_STACK_DUMPING=true
RUN export ELECTRON_ENABLE_LOGGING=true

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]