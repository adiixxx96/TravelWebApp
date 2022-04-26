// Constantes
const close2 = document.getElementById('close2');
const open2 = document.getElementById('open2');
const modal2 = document.getElementById('modal2');


// Mostrar modal
open2.addEventListener('click', () => modal2.classList.add('show-modal'));

// Mostrar modal
open2.addEventListener('click', () => modal2.classList.add('show-modal'));

// Ocultar modal
close2.addEventListener('click', () => modal2.classList.remove('show-modal'));

// Ocultar modal al hacer clic en un elemento externo al modal
window.addEventListener('click', e =>
  e.target == modal2 ? modal2.classList.remove('show-modal') : false
);