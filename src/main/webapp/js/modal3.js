// Constantes
const close3 = document.getElementById('close3');
const open3 = document.getElementById('open3');
const modal3 = document.getElementById('modal3');


// Mostrar modal
open3.addEventListener('click', () => modal3.classList.add('show-modal'));

// Mostrar modal
open3.addEventListener('click', () => modal3.classList.add('show-modal'));

// Ocultar modal
close3.addEventListener('click', () => modal3.classList.remove('show-modal'));

// Ocultar modal al hacer clic en un elemento externo al modal
window.addEventListener('click', e =>
  e.target == modal3 ? modal3.classList.remove('show-modal') : false
);