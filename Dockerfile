FROM ubuntu 
RUN apt-get install service
EXPOSE 9324
CMD ["service"]