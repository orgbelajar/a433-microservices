# Menggunakan base image Node.js versi 25 dengan OS Alpine yang ringan
FROM node:25-alpine

# Menetapkan direktori kerja di dalam container pada folder /app
WORKDIR /app

# Mengatur environment variable bawaan untuk port aplikasi
ENV PORT=3001

# Mengatur environment variable bawaan untuk URL koneksi RabbitMQ Cluster Operator
ENV AMQP_URL="amqp://default_user_NFWFbePXgIldKO2eDFn:xaoEbawTzMWElGKsWo1cziXSywUu61__@rmq-cluster-operator-server.ecommerce-app.svc:5672"

# Menyalin file package.json dan package-lock.json ke dalam direktori kerja
COPY package*.json ./

# Menjalankan perintah instalasi dependensi berdasarkan package.json
RUN npm install

# Menyalin file source code utama aplikasi (index.js) ke dalam direktori kerja
COPY index.js ./

# Memberi tahu Docker bahwa container ini akan mendengarkan port 3001
EXPOSE 3001

# Menentukan perintah utama yang akan dieksekusi ketika container dijalankan
CMD ["npm", "start"]
