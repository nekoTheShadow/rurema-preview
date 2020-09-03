FROM ruby:2.7.1-alpine3.12

RUN gem update --system \
      && gem install bitclust-core \
      && mkdir "/script"
COPY main.rb "/script"
WORKDIR "/src"
CMD ["ruby", "/script/main.rb"]