Hydration.onReady(function(data){
  console.log('User data:', data.userData);
  function drawImage() {
    var point = new Point(data.userData["link"].length, data.userData["link"].length);
    var size = new Size(30);
    var path = new Path.Rectangle(point, size);
    path.strokeColor = 'red';
  };
  drawImage();
});
