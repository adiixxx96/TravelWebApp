//declaración de variables
const arrowLeft = document.querySelector('.arrow-left');
const arrowRight = document.querySelector('.arrow-right');
const imgCarousel = document.querySelector('#img');
const indicators = document.querySelectorAll('.indicators > span');
const images = ['images/slider1.jpg', 'images/slider2.jpg', 'images/slider4.jpg']; //array de imágenes para irlas mostrando

//funciones para obtener y modificar el artibuto de la imagen
const setAttr = (el, attr, value) => el.setAttribute(attr, value);
const getAttr = (el, attr) => el.getAttribute(attr);

//obtener index de la imagen
const getImageIndex = (image) => images.indexOf(image)

const getCurrentImageIndex = () => {
  const currentImage = getAttr(imgCarousel, 'src');
  return getImageIndex(currentImage);
};

const getArrowLeftImageIndex = (currentIndex) => {
  return currentIndex === 0 ? 2 : currentIndex - 1;
};

const getArrowRightImageIndex = (currentIndex) => {
  return currentIndex === 2 ? 0 : currentIndex + 1;
};

//actualizar al indicador de clase correcto
const activateIndicator = (index) => {
  indicators.forEach((el, i) => {
    if (el.classList.contains('active')) {
      el.classList.remove('active')
    };
    if (index === i) el.classList.add('active');
  })
};

//animación del slider al hacer clic en fechas
const intervalSlider = (direction, delay = 5000) => { //delay de 5sg para la transición automática entre slides
    let callback = null, getNewIndexFunc = null;
    if (direction === 'left') {
      getNewIndexFunc = () => getArrowLeftImageIndex(getCurrentImageIndex());
  
    } else {
      getNewIndexFunc = () => getArrowRightImageIndex(getCurrentImageIndex());
    }
  
    callback = () => {
      let newIndex = getNewIndexFunc();
      activateIndicator(newIndex);
      setAttr(imgCarousel, 'src', images[newIndex]);
    }
  
    return () => setInterval(callback, delay);
  }

//funciones de intervalo al clicar en las flechas de cambio de slide 
const leftInterval = intervalSlider('left');
const rightInterval = intervalSlider('right');

let left = null, right = null;

arrowLeft.addEventListener('click', (e) => {
  const newIndex = getArrowLeftImageIndex(getCurrentImageIndex());
  activateIndicator(newIndex);
  right && clearInterval(right);
  if (!left) {
    left = leftInterval()
  }
  setAttr(imgCarousel, 'src', images[newIndex]);
});
arrowRight.addEventListener('click', (e) => {
  const newIndex = getArrowRightImageIndex(getCurrentImageIndex());
  activateIndicator(newIndex);

  left && clearInterval(left);
  if (!right) {
    right = rightInterval();
  }
  setAttr(imgCarousel, 'src', images[newIndex]);
});