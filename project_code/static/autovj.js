function init() {
  myObject = {}; // use as field template for presets on client
  presets = {}; // presets done on client
  user = {'1':{'h':0.25, 's':0, 'v':0.5}, '2':{'h':0.75, 's':0.5, 'v':0.5}};
  var rgb = HSVtoRGB(user['1']['h'], user['1']['s'], user['1']['v']);
  document.getElementById('bkg1').style.backgroundColor = "rgb(" + 
                          rgb.r + ", " + rgb.g + "," + rgb.b + ")";
  rgb = HSVtoRGB(user['2']['h'], user['2']['s'], user['2']['v']);
  document.getElementById('bkg2').style.backgroundColor = "rgb(" +
                          rgb.r + ", " + rgb.g + "," + rgb.b + ")";
}

function slider(index, val)
{
  //check if user colour, in which case have to convert hsv to rgb
  if (index.substring(0,4) == 'user') {
    var cnum = index.substring(4,5);
    var clet = index.substring(5,6);
    user[cnum][clet] = val / 19;
    if (user[cnum]['h'] == 0 && user[cnum]['s'] == 0 && user[cnum]['v'] == 0) {
      val = [-255, -255, -255];
    }
    else {
      var rgb = HSVtoRGB(user[cnum]['h'], user[cnum]['s'], user[cnum]['v']);
      document.getElementById('bkg' + cnum).style.backgroundColor = "rgb(" +
         rgb.r + ", " + rgb.g + "," + rgb.b + ")";
      val = [rgb.r, rgb.g, rgb.b];
    } 
    index = 'user' + cnum;
  }
  //if presets done on client do this
  //if (index == 'preset_set') {
  //  var preset = {};
  //  for (var key in myObject) {
  //    preset[key] = myObject[key];
  //  }
  //  presets[val] = preset;
  //}
  var msg = {};
  //if (index == 'preset_get' && val in presets) {
  //  for (var key in presets[val]) {
  //    msg[key] = presets[val][key];
  //  }
  //}
  //else {
    msg[index] = val;
  //}
  //XMLHttpRequest done here
  var jsonMsg = JSON.stringify(msg);
  xmlhttp = new XMLHttpRequest();
  xmlhttp.open("GET","/update/?msg=" + jsonMsg, false);
  xmlhttp.send();
  //use returned state info to update page
  myObject = JSON.parse(xmlhttp.responseText);
  for (var key in myObject) {
    var elmnt = document.getElementsByName(key);
    i = parseInt(myObject[key]);
    if (i < elmnt.length && i >= 0 && key != index) {
      elmnt[i].checked = true;
    }
  }
}

//Convert HSV representation to RGB, may use this if colour mixing
//is included TODO do we need to feed colours back to contoller?
//Credits to http://www.raphaeljs.com
function HSVtoRGB(h, s, v) {
  var r, g, b, i, f, p, q, t;
  i = Math.floor(h * 6);
  f = h * 6 - i;
  p = v * (1 - s);
  q = v * (1 - f * s);
  t = v * (1 - (1 - f) * s);
  switch (i % 6) {
    case 0: r = v, g = t, b = p; break;
    case 1: r = q, g = v, b = p; break;
    case 2: r = p, g = v, b = t; break;
    case 3: r = p, g = q, b = v; break;
    case 4: r = t, g = p, b = v; break;
    case 5: r = v, g = p, b = q; break;
  }
  return {
    r: Math.floor(r * 255),
    g: Math.floor(g * 255),
    b: Math.floor(b * 255)
  };
}
