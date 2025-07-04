
# 🚀 AWS ECS with EC2 & Auto Scaling – Infrastructure as Code (IaC)

Proyek ini membangun infrastruktur AWS lengkap untuk menjalankan container berbasis **NGINX** menggunakan **Amazon ECS (EC2 Launch Type)**, dengan dukungan **Auto Scaling Group**, **Launch Template**, dan resource dasar seperti VPC, Security Group, dan lainnya — semuanya didefinisikan menggunakan **AWS CloudFormation**.

---

## 🧭 Arsitektur

![Arsitektur Diagram](./assets/aws-architecture.png)

> Diagram di atas menggambarkan hubungan antar resource seperti VPC, EC2, ECS Cluster, Task Definition, Launch Template, Auto Scaling Group, dan Security Group.

---

## 📁 Struktur Proyek

| File / Folder              | Deskripsi                                                                 |
|---------------------------|---------------------------------------------------------------------------|
| `vpc.yaml`                | Membuat VPC, subnet publik, route table, internet gateway                 |
| `security-group.yaml`     | Mengatur akses HTTP (80), HTTPS (443), dan SSH (22)                       |
| `ecs-cluster.yaml`        | Membuat ECS Cluster                                                       |
| `launch-template.yaml`    | Launch template EC2 dengan ECS agent dan userdata                         |
| `auto-scaling-group.yaml` | Auto Scaling Group dengan ECS capacity                                    |
| `task-definition.yaml`    | Definisi container NGINX                                                  |
| `ecs-service.yaml`        | ECS Service untuk menjalankan task                                        |
| `main-deploy.sh`          | Menjalankan seluruh stack secara berurutan                                |
| `*.params.json`           | File parameter masing-masing stack                                        |

---

## ⚙️ Cara Menjalankan (MacOS)

### 🧱 Prasyarat
- [x] AWS CLI telah dikonfigurasi (`aws configure`)
- [x] Tools: `bash`, `jq`, `Docker`, `zip`
- [x] Hak IAM untuk ECS, EC2, SSM, CloudFormation, ECR

### 🚀 Deploy Infrastruktur
```bash
chmod +x main-deploy.sh
./main-deploy.sh
```

---

## 🧩 Penjelasan Masing-Masing Resource

### 1. VPC & Networking
- **VPC**: Membuat lingkungan virtual network
- **Subnet**: Satu atau lebih subnet publik
- **Internet Gateway** & **Route Table**: Akses ke internet dari subnet

### 2. Security Groups
- HTTP (80): Terbuka untuk publik
- HTTPS (443): Terbuka untuk publik
- SSH (22): Terbuka hanya untuk IP tertentu

### 3. ECS Cluster
- Cluster ECS EC2 launch type

### 4. EC2 Launch Template
- Instance type, ECS-optimized AMI dari SSM
- ECS Agent langsung join ke cluster

### 5. Auto Scaling Group
- Menyediakan kapasitas EC2 berdasarkan template
- EC2 instance akan digunakan sebagai container instance

### 6. ECS Task Definition
- Menjalankan container `nginx:latest` pada port 80
- Menggunakan `bridge` network mode

### 7. ECS Service
- Menjalankan task berbasis TaskDefinition
- Tipe Launch: EC2
- Mengatur jumlah task (`DesiredCount`)

---

## 🌐 Akses Aplikasi

Jika belum menggunakan Load Balancer:
```
http://<PUBLIC_IP_EC2>
```

---

## 📦 Build & Deploy Image ke ECR (Saya Menggunakan AZURE Pipelines)

Jika frontend image dibangun dari project lokal (misal via Azure Pipeline):
1. Build Docker image:
   ```bash
   docker build -t frontend-app .
   ```
2. Tag & push ke ECR:
   ```bash
   docker tag frontend-app:latest <your_ecr_repo_url>:latest
   docker push <your_ecr_repo_url>:latest
   ```

---

## 🧹 Jalankan Semua Resource

```bash
./main-deploy.sh
```

---

## 📌 Catatan

- Gunakan pendekatan modular (per stack) agar mudah dikelola
- Jika menggunakan CDK: bisa memigrasikan YAML ini ke TypeScript/Python CDK construct
- Diagram arsitektur dibuat manual via draw.io (atau dapat digenerate via AWS Perspective)

---

## 👤 Kontributor

- 🧑‍💻 @ginanjar.nugroho – Infrastruktur, Automation, Deployment

---

## 📄 Lisensi

[MIT](LICENSE)
