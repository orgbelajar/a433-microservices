#!/bin/sh

# Menginisialisasi variabel nama image, tag, dan username github.
image_name="item-app"
image_tag="v1"
github_username="orgbelajar"

# Membuat Docker image dari Dockerfile.
docker build . -t $image_name:$image_tag

# Melihat daftar image di lokal.
docker images

# Mengubah nama image agar sesuai dengan format GitHub Packages
docker tag $image_name:$image_tag ghcr.io/$github_username/$image_name:$image_tag

# Login ke GitHub Packages via Terminal.
docker login ghcr.io -u $github_username

# Mengunggah image ke Github Packages.
docker push ghcr.io/$github_username/$image_name:$image_tag

echo -e "\nSelesai."