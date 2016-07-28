Hydration.onReady(function(data){
  var circleSize = data.fractalParams['size'];
  var circleColor = data.fractalParams['color'];
  var baseCase = data.fractalParams['base_case'];
  var rate = data.fractalParams['rate'];
  var startX = data.fractalParams['x'];
  var startY = data.fractalParams['y'];
  var radius = data.fractalParams['radius'];

  function drawImage(x, y, radius) {
    var path = new Path.Ellipse({
        point: [x, y],
        size: circleSize,
        strokeColor: circleColor
    });

    if(radius > baseCase) {
      drawImage(x + radius/rate, y, radius/rate);
      drawImage(x - radius/rate, y, radius/rate);
      drawImage(x, y + radius/rate, radius/rate);
      drawImage(x, y - radius/rate, radius/rate);
    }
  }

  $('#drawer').click(function() {
    drawImage(startX, startY, radius);
  });
});
