FROM java:21

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 80

CMD ["java", "src\main\java\com\rentacar\rentacar\RentacarApplication.java"]


