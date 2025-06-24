import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.0/firebase-app.js";
import { getDatabase, ref, onValue } from "https://www.gstatic.com/firebasejs/10.12.0/firebase-database.js";

// 🔧 Configura aquí tus credenciales de Firebase
const firebaseConfig = {
  apiKey: "TU_API_KEY",
  authDomain: "TU_DOMINIO.firebaseapp.com",
  databaseURL: "https://TU_DOMINIO.firebaseio.com",
  projectId: "TU_ID_PROYECTO",
  storageBucket: "TU_DOMINIO.appspot.com",
  messagingSenderId: "TU_SENDER_ID",
  appId: "TU_APP_ID"
};

// 🔌 Inicializar Firebase
const app = initializeApp(firebaseConfig);
const db = getDatabase(app);

// 🔢 Referencias a los contadores
const totalSpan = document.getElementById("total-count");
const aprobadosSpan = document.getElementById("aprobados-count");
const pendientesSpan = document.getElementById("pendientes-count");
const paisesSpan = document.getElementById("paises-count");

// 🎯 Contadores e información
let total = 0, aprobados = 0, pendientes = 0;
const paisesMap = new Map();
const frases = [];

onValue(ref(db, "testimonios/"), snapshot => {
  total = aprobados = pendientes = 0;
  paisesMap.clear();
  frases.length = 0;

  snapshot.forEach(child => {
    const d = child.val();
    total++;
    if (d.aprobado) {
      aprobados++;
      if (d.mensaje) frases.push(d.mensaje);
    } else {
      pendientes++;
    }

    const pais = (d.pais || "Desconocido").trim();
    paisesMap.set(pais, (paisesMap.get(pais) || 0) + 1);
  });

  totalSpan.textContent = total;
  aprobadosSpan.textContent = aprobados;
  pendientesSpan.textContent = pendientes;
  paisesSpan.textContent = paisesMap.size;

  renderCharts();
  mostrarFraseAleatoria();
});

// 📊 Visualización de gráficos con Chart.js
function renderCharts() {
  new Chart(document.getElementById("grafico-estado"), {
    type: "doughnut",
    data: {
      labels: ["Aprobados", "Pendientes"],
      datasets: [{
        label: "Estado",
        data: [aprobados, pendientes],
        backgroundColor: ["#2ecc71", "#f39c12"]
      }]
    },
    options: {
      plugins: {
        title: {
          display: true,
          text: "Estado actual de los testimonios"
        },
        legend: {
          position: "bottom"
        }
      }
    }
  });

  new Chart(document.getElementById("grafico-paises"), {
    type: "bar",
    data: {
      labels: Array.from(paisesMap.keys()),
      datasets: [{
        label: "Testimonios por país",
        data: Array.from(paisesMap.values()),
        backgroundColor: "#2e3a59"
      }]
    },
    options: {
      indexAxis: 'y',
      plugins: {
        title: {
          display: true,
          text: "Origen geográfico de los testimonios"
        }
      },
      scales: {
        x: {
          beginAtZero: true
        }
      }
    }
  });
}

// ✨ Mostrar frase aleatoria
function mostrarFraseAleatoria() {
  const frase = frases.length
    ? frases[Math.floor(Math.random() * frases.length)]
    : "Todavía no hay testimonios aprobados.";
  const contenedor = document.getElementById("texto-frase");
  if (contenedor) contenedor.textContent = `“${frase}”`;
}
