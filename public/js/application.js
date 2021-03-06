Event.observe(window, 'load', function() {
  var img = document.createElement('img');
  document.body.appendChild(img);
  img.id = 'loading-image';
  img.alt = 'loading...';
  with (img.style) {
    display = 'none';
    position = 'fixed';
    top = '50%';
    left = '50%';
  }
  img.src = '/images/indicator.gif?1282544318';
  if (img.width) {
    img.style.marginLeft = String(-(img.width / 2)) + 'px';
    img.style.marginTop = String(-(img.height / 2)) + 'px';
  }
});

