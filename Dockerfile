FROM hasura/graphql-engine
RUN mkdir /data
COPY metadata.json /data/metadata.json
ENV HASURA_GRAPHQL_DATABASE_URL=postgres://postgres:keyboardcat@database:5432/postgres
ENV HASURA_GRAPHQL_ENABLE_CONSOLE="true"
ENV HASURA_GRAPHQL_ADMIN_SECRET=keyboardcat
RUN curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash
WORKDIR /data
RUN hasura metadata apply
EXPOSE 8080
