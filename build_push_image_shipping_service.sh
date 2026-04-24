#!/bin/sh

# Menginisialisasi variabel untuk nama image, tag image, dan username GitHub
image_name="shipping-service"
image_tag="latest"
github_username="orgbelajar"
github_package_name="$github_username/$image_name:$image_tag"

# Perintah untuk build Docker image dari berkas Dockerfile
docker build . -t $github_package_name

# Mengubah nama image agar sesuai dengan format GitHub Packages
docker tag $github_package_name ghcr.io/$github_package_name

# Perintah untuk login ke GitHub Package
echo $A433_MICROSERVICES_PAT | docker login ghcr.io -u $github_username --password-stdin

# Perintah untuk push image ke Github Package
docker push ghcr.io/$github_package_name