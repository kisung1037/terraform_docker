terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

# image 
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_image" "jenkins" {
  name         = "jenkins/jenkins:lts"
  keep_locally = false
}

resource "docker_image" "ubuntu" {
  name         = "ubuntu:latest"
  keep_locally = false
}

resource "docker_image" "busybox" {
  name         = "busybox:latest"
  keep_locally = false
}


# docker container

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_container" "jenkins" {
  image = docker_image.jenkins.latest
  name ="jenkins"
  ports {
    internal = 8080
    external = 8080
  }
}

resource "docker_container" "ubuntu" {
  image = docker_image.ubuntu.latest
  name ="ubuntu"
  command = ["sleep","3600"]
}

resource "docker_container" "busybox" {
  image = docker_image.busybox.latest
  name ="busybox"
  command = ["sleep","3600"]
}