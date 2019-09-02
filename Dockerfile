FROM ubuntu:16.04
EXPOSE 8080
RUN mkdir /algorand
WORKDIR /algorand
RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl build-essential ca-certificates git mercurial runit
RUN curl -L https://github.com/algorand/go-algorand-doc/raw/master/downloads/installers/linux_amd64/install_master_linux-amd64.tar.gz --output /algorand/install_master_linux-amd64.tar.gz
RUN tar -xf install_master_linux-amd64.tar.gz
RUN mkdir node
RUN ./update.sh -i -c stable -p node -d node/data -n
COPY ./entrypoint.sh .
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
