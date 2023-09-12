FROM node:14

# Install global packages
RUN npm install -g gulp-cli mocha

# Clone Habitica repo and install dependencies
RUN mkdir -p /usr/src/habitrpg
WORKDIR /usr/src/habitrpg
RUN git clone --branch release --depth 1 https://github.com/HabitRPG/habitica.git /usr/src/habitrpg
RUN git config --global url."https://".insteadOf git://
RUN npm set unsafe-perm true
RUN npm install

# Start Habitica
EXPOSE 80 8080 36612
CMD ["node", "./website/transpiled-babel/index.js"]
