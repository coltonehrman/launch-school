function rleEncode(data) {
  var chars = data.split('');
  var lastChar;
  var charGroups = [];

  chars.forEach(function(char){
    if (lastChar == char) {
      charGroups[charGroups.length - 1].push(char);
    }
    else {
      lastChar = char;
      charGroups.push([char]);
    }
  });

  return charGroups.map(function(group){
    return (group.length != 1) ? [group.length + group[0]] : [group[0]]
  }).join('');
}

function rleDecode(data) {
  var currentNumber = '';
  var chars = data.split('');
  output = '';

  chars.forEach(function(char){
    if (char.match(/\d/)) {
      currentNumber += char;
    }
    else {
      currentNumber = currentNumber || '1';
      output += char.repeat(+currentNumber);
      currentNumber = '';
    }
  });

  return output;
}

console.log(rleDecode('24A20WXYZS5G8DL'));
