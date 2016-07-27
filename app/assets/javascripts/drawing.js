Hydration.onReady(function(data){

  var point = new Point(data.fractalParams['x'], data.fractalParams['y']);

  function drawImage(x, y, radius) {
    var path = new Path.Ellipse({
        point: [x, y],
        size: data.fractalParams['size'],
        strokeColor: 'blue'
    });

    if(radius > data.fractalParams['base_case']) {
      drawImage(x + radius/data.fractalParams['rate'], y, radius/data.fractalParams['rate']);
      drawImage(x - radius/data.fractalParams['rate'], y, radius/data.fractalParams['rate']);
      drawImage(x, y + radius/data.fractalParams['rate'], radius/data.fractalParams['rate']);
      drawImage(x, y - radius/data.fractalParams['rate'], radius/data.fractalParams['rate']);
    }
  }

  $('#drawer').click(function() {
    drawImage(data.fractalParams['x'], data.fractalParams['y'], data.fractalParams['radius']);
  });
});
