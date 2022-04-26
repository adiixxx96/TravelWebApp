// Constantes
const close1 = document.getElementById('close1');
const open1 = document.getElementById('open1');
const modal1 = document.getElementById('modal1');


// Mostrar modal
open1.addEventListener('click', () => modal1.classList.add('show-modal'));

// Mostrar modal
open1.addEventListener('click', () => modal1.classList.add('show-modal'));

// Ocultar modal
close1.addEventListener('click', () => modal1.classList.remove('show-modal'));

// Ocultar modal al hacer clic en un elemento externo al modal
window.addEventListener('click', e =>
  e.target == modal1 ? modal1.classList.remove('show-modal') : false
);