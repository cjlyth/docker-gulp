FROM cjlyth/nodenv
MAINTAINER  Christopher Lyth <cjlyth@gmail.com>

# gulp-livereload gulp-watch

RUN npm install -gy gulp | tee /var/log/gulp-install.log

WORKDIR /gulp-app
ONBUILD ADD . /gulp-app
ONBUILD RUN npm install --save gulp
ONBUILD RUN npm install gulp
ADD default_gulpfile.js /gulp-app/gulpfile.js

ENTRYPOINT ["/usr/local/bin/gulp"]
CMD ["-v"]
