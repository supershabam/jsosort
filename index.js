'use strict';

function jsosort(obj, sortfunction) {
  var result = {};
  Object.keys(obj).sort(sortfunction).forEach(function(key) {
    var value = obj[key];
    if (Object.prototype.toString.call(value) === '[object Object]') {
      value = jsosort(value, sortfunction);
    }
    result[key] = value;
  });
  return result;
}

module.exports = jsosort;
