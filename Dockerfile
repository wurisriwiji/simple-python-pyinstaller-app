# Gunakan image Python sebagai base
FROM python:2-alpine

# Set direktori kerja di dalam container
WORKDIR /app

# Salin semua file dari folder sources ke dalam container
COPY sources/ /app/

# Tentukan perintah default untuk menjalankan aplikasi
CMD ["sh", "-c", "python add2vals.py && tail -f /dev/null"]


