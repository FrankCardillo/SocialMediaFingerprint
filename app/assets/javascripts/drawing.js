function drawImage() {
  var point = new Point(10, 10);
  var size = new Size(30);
  var path = new Path.Rectangle(point, size);
  path.strokeColor = 'red';
};

drawImage();
