#!/bin/bash

echo "🎙️ Iniciando setup completo de Voces Invisibles v1.0..."

# Crear carpetas necesarias
mkdir -p assets/css assets/js assets/img

# Archivo index.html
cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Voces Invisibles</title>
  <link rel="stylesheet" href="assets/css/style.css" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
  <header>
    <h1>Voces Invisibles</h1>
    <p>Historias que merecen ser escuchadas</p>
  </header>

  <nav>
    <a href="#">Inicio</a>
    <a href="#">Historias</a>
    <a href="#">¿Cómo participar?</a>
    <a href="#">Contacto</a>
  </nav>

  <section class="hero-banner">
    <img src="assets/img/banner.jpg" alt="Banner Voces Invisibles" />
    <div class="texto-banner">
      <h1>Haz visible lo invisible</h1>
      <p>Comparte tu historia en video</p>
    </div>
  </section>

  <section>
    <h2>Historias reales</h2>
    <div class="video-grid">
      <iframe src="https://www.youtube.com/embed/Refy8t2G7pM" allowfullscreen></iframe>
      <iframe src="https://www.youtube.com/embed/NDwaXh-dE5E" allowfullscreen></iframe>
      <iframe src="https://www.youtube.com/embed/jLfbocn_BOY" allowfullscreen></iframe>
    </div>
  </section>

  <section>
    <h2>¿Cómo puedes participar?</h2>
    <ol>
      <li>Graba un video contando tu historia o la de tu comunidad.</li>
      <li>Súbelo a YouTube o Google Drive.</li>
      <li>Llena el formulario para compartirlo con nosotros.</li>
    </ol>
    <p><a href="#">Enviar video</a></p>
  </section>

  <section id="impacto">
    <h2>Impacto de Voces Invisibles</h2>
    <div class="impacto-metricas">
      <div><strong id="total-count">0</strong><br>Voces compartidas</div>
      <div><strong id="aprobados-count">0</strong><br>Aprobadas</div>
      <div><strong id="pendientes-count">0</strong><br>Pendientes</div>
      <div><strong id="paises-count">0</strong><br>Países distintos</div>
    </div>
    <canvas id="grafico-estado"></canvas>
    <canvas id="grafico-paises"></canvas>
  </section>

  <footer>
    <p>Correo: vocesinvisibles@email.com | Instagram & TikTok: @vocesinvisibles</p>
    <p>Hecho con 💜 desde las voces olvidadas | © Voces Invisibles 2025</p>
  </footer>

  <script type="module" src="assets/js/firebase.js"></script>
</body>
</html>
EOF

# Archivo style.css (resumen por espacio, puedes pegar aquí el tuyo completo)
cat > assets/css/style.css <<'EOF'
body { font-family: 'Roboto', sans-serif; margin: 0; padding: 0; background: #f8f4f0; color: #333; }
/* 🎨 Agrega aquí el contenido completo de style.css tal como lo corregimos */
EOF

# Archivo firebase.js (usa las claves reales de tu proyecto)
cat > assets/js/firebase.js <<'EOF'
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.0/firebase-app.js";
import { getDatabase, ref, onValue } from "https://www.gstatic.com/firebasejs/10.12.0/firebase-database.js";

const firebaseConfig = {
  apiKey: "TU_API_KEY",
  authDomain: "TU_DOMINIO.firebaseapp.com",
  databaseURL: "https://TU_DOMINIO.firebaseio.com",
  projectId: "TU_ID",
  storageBucket: "TU_DOMINIO.appspot.com",
  messagingSenderId: "TU_SENDER_ID",
  appId: "TU_APP_ID"
};

const app = initializeApp(firebaseConfig);
const db = getDatabase(app);

// Aquí sigue la lógica de conteo, frases y gráficos que ya preparamos
EOF

# Archivo README.md con imagen banner
cat > README.md <<'EOF'
<p align="center">
  <img src="assets/img/banner.jpg" alt="Banner Voces Invisibles" width="100%">
</p>

# 🌎 Voces Invisibles

**Una plataforma digital que hace visibles las historias que muchos prefieren ignorar.**  
Impulsada por HTML, CSS, Firebase y narración emocional, *Voces Invisibles* amplifica testimonios reales sobre la pobreza, creando un puente entre la empatía y la acción.

---

## 🎯 Propósito

Dar voz a personas que viven en condiciones de pobreza, permitiéndoles compartir sus historias a través de video, gráficos interactivos y métricas en tiempo real.

---

## 🛠️ Tecnologías utilizadas

- HTML + CSS
- Firebase Realtime Database
- JavaScript (ES Modules)
- Chart.js
- Diseño responsive y multimedia

---

## 🚀 Sitio en línea

👉 [Accede a la plataforma aquí](https://johnjairo-cell.github.io)

---

## 👥 ¿Cómo participar?

1. Graba tu testimonio o el de tu comunidad.
2. Sube el video a YouTube o Google Drive.
3. Envíanos tu historia mediante el formulario.

---

## 📫 Contacto

📧 vocesinvisibles@email.com  
📱 Instagram / TikTok: **@vocesinvisibles**

---

> Hecho con 💜 desde las voces olvidadas.  
> Proyecto sin fines de lucro — John Jairo Montoya, 2025.
EOF
chmod +x setup_v1_completo.sh
./setup_v1_completo.sh

echo "✅ Proyecto Voces Invisibles v1.0 desplegado localmente."
