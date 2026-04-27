resource "aws_instance" "web" {
   ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"

  subnet_id              = data.aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd

              echo "<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>ShopEase - eCommerce Landing</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

  <style>
    body {
      scroll-behavior: smooth;
    }
    .hero {
      background: linear-gradient(to right, #0d6efd, #6f42c1);
      color: white;
      padding: 100px 0;
    }
    .product-card img {
      height: 200px;
      object-fit: cover;
    }
    .feature-icon {
      font-size: 40px;
      color: #0d6efd;
    }
    footer {
      background: #111;
      color: #bbb;
      padding: 40px 0;
    }
  </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
    <a class="navbar-brand fw-bold" href="#">ShopEase</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="nav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#products">Products</a></li>
        <li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<section id="home" class="hero text-center">
  <div class="container">
    <h1 class="display-4 fw-bold">Best Deals on Latest Products</h1>
    <p class="lead">Shop smart, save more, and enjoy premium quality products at your fingertips.</p>
    <a href="#products" class="btn btn-light btn-lg mt-3">Shop Now</a>
  </div>
</section>

<!-- Products Section -->
<section id="products" class="py-5">
  <div class="container">
    <h2 class="text-center mb-5">Featured Products</h2>

    <div class="row g-4">

      <!-- Product 1 -->
      <div class="col-md-4">
        <div class="card product-card shadow-sm">
          <img src="https://source.unsplash.com/400x300/?shoes" class="card-img-top" alt="">
          <div class="card-body text-center">
            <h5>Running Shoes</h5>
            <p>$49.99</p>
            <button class="btn btn-primary">Buy Now</button>
          </div>
        </div>
      </div>

      <!-- Product 2 -->
      <div class="col-md-4">
        <div class="card product-card shadow-sm">
          <img src="https://source.unsplash.com/400x300/?watch" class="card-img-top" alt="">
          <div class="card-body text-center">
            <h5>Smart Watch</h5>
            <p>$89.99</p>
            <button class="btn btn-primary">Buy Now</button>
          </div>
        </div>
      </div>

      <!-- Product 3 -->
      <div class="col-md-4">
        <div class="card product-card shadow-sm">
          <img src="https://source.unsplash.com/400x300/?headphones" class="card-img-top" alt="">
          <div class="card-body text-center">
            <h5>Headphones</h5>
            <p>$29.99</p>
            <button class="btn btn-primary">Buy Now</button>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- Features -->
<section id="features" class="bg-light py-5">
  <div class="container text-center">
    <h2 class="mb-5">Why Choose Us?</h2>

    <div class="row g-4">

      <div class="col-md-4">
        <i class="bi bi-truck feature-icon"></i>
        <h5 class="mt-3">Free Delivery</h5>
        <p>Fast and free shipping worldwide.</p>
      </div>

      <div class="col-md-4">
        <i class="bi bi-shield-check feature-icon"></i>
        <h5 class="mt-3">Secure Payment</h5>
        <p>100% secure online transactions.</p>
      </div>

      <div class="col-md-4">
        <i class="bi bi-headset feature-icon"></i>
        <h5 class="mt-3">24/7 Support</h5>
        <p>We are here for you anytime.</p>
      </div>

    </div>
  </div>
</section>

<!-- Contact -->
<section id="contact" class="py-5">
  <div class="container">
    <h2 class="text-center mb-4">Contact Us</h2>

    <div class="row justify-content-center">
      <div class="col-md-6">
        <form>
          <input type="text" class="form-control mb-3" placeholder="Your Name">
          <input type="email" class="form-control mb-3" placeholder="Your Email">
          <textarea class="form-control mb-3" rows="4" placeholder="Message"></textarea>
          <button class="btn btn-primary w-100">Send Message</button>
        </form>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="text-center">
  <div class="container">
    <p class="mb-0">© 2026 ShopEase. All rights reserved.</p>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>" > /var/www/html/index.html
              EOF
}