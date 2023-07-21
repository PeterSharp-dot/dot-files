/* 
    This script open text files in /files folder 
*/

function isFirstCharDigit(str) {
  return !isNaN(str.charAt(0));
}

function insertSpaceAtIndex(str, index) {
  return str.substring(0, index) + " " + str.substring(index);
}

function capitalizeFirstNonDigitChar(str) {
  for (let i = 0; i < str.length; i++) {
    if (!/\d/.test(str[i])) {
      return str.slice(0, i) + str[i].toUpperCase() + str.slice(i + 1);
    }
  }
  return str;
}

function findVersesNumbersInText(str) {
  const pattern = /\d+:\d+/g;
  const replacedStr = str.replace(pattern, '</spun><em id="num">$&</em><spun>');
  return replacedStr;
}

function testIfFirstSeekingSign(str) {
  if (str.charAt[0] === '"') {
    return true;
  }
}

document.getElementById("text-input").value = ""
const input = document.getElementById("text-input")
input.focus();

function processInput() {
  var searchTerm = document.getElementById("text-input").value;
  console.log("searchTerm: " + searchTerm);
  // if (testIfFirstSeekingSign(searchTerm)) {
  //   var xhr = new XMLHttpRequest();
  //   var filePath = "files/*.txt";
  //   xhr.open("GET", filePath, true);
  //   xhr.responseType = "text";
  //   xhr.onload = function() {
  //     if (xhr.status === 200) {
  //       var fileContent = xhr.responseText;
  //       const pattern = new RegExp('\\b' + wordToSearch + '\\b', 'gi');
  //       const matches = fileContent.match(pattern);
  //       const matchcount = 0;
  //       if (matches) {
  //         // var startIndex = fileContent.indexOf(matches[0]);
  //         while ((matches = pattern.exec(fileContent)) !== null) {
  //           console.log(`Found "${wordToSearch}" in ${filePath} at index ${matches.index}`);
  //           matchcount++;
  //         }
  //       }
  //       console.log(matchcount);
  //     }
  //   }
  // }
  console.log("0wy znak: " + searchTerm.charAt(0));
  //---------------------Search for a word----------------------------
  if (searchTerm.charAt(0) === '"') {
    console.log("jest znak");
    const directoryPath = "./files/";
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
      if (this.readyState === 4 && this.status === 200) {
        const files = JSON.parse(this.responseText);
        // const myString = JSON.stringify(this.responseText);
        // console.log("data: " + myString);

        let totalCount = 0;
        let fileCount = 0;

        files.forEach(function(file) {
          const filePath = directoryPath + '/' + file;

          const xhr2 = new XMLHttpRequest();
          xhr2.onreadystatechange = function() {
            if (this.readyState === 4 && this.status === 200) {
              const contents = this.responseText;

              const pattern = new RegExp('\\b' + wordToSearch + '\\b', 'gi');
              let matches;
              let matchCount = 0;

              while ((matches = pattern.exec(contents)) !== null) {
                matchCount++;
                console.log(`Found "${wordToSearch}" in ${filePath} at index ${matches.index}`);
              }

              if (matchCount > 0) {
                fileCount++;
                totalCount += matchCount;
              }
            }
          };
          xhr2.open('GET', filePath, true);
          xhr2.send();
        });

        console.log(`Found "${wordToSearch}" in ${totalCount} places in ${fileCount} files.`);
      }
    };
    xhr.open('GET', directoryPath, true);
    xhr.send();
  }
  // ------------------------Open a filename--------------------------
  else if (searchTerm.charAt(0) !== '"') {
    console.log("nie ma znaku");

    // const files = ['file1.txt', 'file2.txt', 'file3.txt'];
    // files.forEach(function(file) {
    //   console.log('Processing file:', file);
    //   // Perform operations on the current file
    // });

    if (/\s/g.test(searchTerm)) {
      searchTerm = searchTerm.replace(/\s/g, "");
    }
    searchTerm = capitalizeFirstNonDigitChar(searchTerm);
    // console.log(searchTerm);
    var xhr = new XMLHttpRequest();
    var filePath = "files/" + searchTerm + ".txt";
    xhr.open("GET", filePath, true);
    xhr.responseType = "text";
    xhr.onload = function() {
      if (xhr.status === 200) {
        var fileContent = xhr.responseText;

        if (isFirstCharDigit(searchTerm) === true) {
          searchTerm = insertSpaceAtIndex(searchTerm, 1);
          var index = fileContent.indexOf(searchTerm);
          if (index !== -1) {
            fileContent = fileContent.replace(new RegExp(searchTerm, 'g'), '');
          }
        }
        else {
          index = fileContent.indexOf(searchTerm);
          if (index !== -1) {
            fileContent = fileContent.replace(new RegExp(searchTerm, 'g'), '');
          }
        }
        document.getElementById("head-1").innerHTML = searchTerm;
        fileContent = findVersesNumbersInText(fileContent);
        document.getElementById("file-content").innerHTML = fileContent;
        document.getElementById("text-input").value = "";
      }
    }
    xhr.send();
  }
  input.focus();
}
