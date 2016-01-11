function isValidWalk(walk,min=10) {
  var lon = lat = 0;
  for(var i=0, l = walk.length; i < l; i++){
    switch (walk[i]) {
      case "n": lat += 1; break;
      case "s": lat -= 1; break;
      case "e": lon += 1; break;
      case "w": lon -= 1; break;
    }
  }
  return (lon + lat) === 0 && walk.length === min;
}