#!/bin/bash

# Funzione per aggiornare e aggiornare i pacchetti
update_system() {
  echo "Aggiornamento del sistema..."
  sudo apt-get update -y
  sudo apt-get upgrade -y
}

# Funzione per installare Vim
install_vim() {
  echo "Installazione di Vim..."
  sudo apt-get install vim -y
}

# Funzione per installare Git
install_git() {
  echo "Installazione di Git..."
  sudo apt-get install git -y
}

# Funzione per installare Docker
install_docker() {
  echo "Installazione di Docker..."
  sudo apt-get remove docker docker-engine docker.io containerd runc -y
  sudo apt-get update -y
  sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update -y
  sudo apt-get install docker-ce docker-ce-cli containerd.io -y

  # Aggiunge l'utente corrente al gruppo docker per eseguire docker senza sudo
  sudo usermod -aG docker $USER
  echo "Docker è stato installato. E' necessario fare logout e login per usare Docker senza sudo."
}

# Eseguire le funzioni
update_system
install_vim
install_git
install_docker

echo "Installazione completata."

