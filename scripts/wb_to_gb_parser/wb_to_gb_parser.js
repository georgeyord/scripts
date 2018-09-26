// ./run.sh -i ~/Documents/AccountStatement-google.csv -o ~/Documents/AccountStatement-google.out.csv

/**
 * Command line arguments handling
 */
const commandLineArgs = require('command-line-args')
const optionDefinitions = [{
    name: 'input',
    alias: 'i',
    type: String
  },
  {
    name: 'out',
    alias: 'o',
    type: String
  }
]
const options = commandLineArgs(optionDefinitions)

if (!options.input) {
  console.log("The source CSV file is required.");
  console.log("example: ./run.sh -i /tmp/input.csv -o /tmp/output.csv");
  return
}
const inputFilepath = options.input;

if (!options.out) {
  console.log("The target CSV file is required.");
  console.log("example: ./run.sh -i /tmp/input.csv -o /tmp/output.csv");
  return
}
const outputFilepath = options.out;

/**
 * Init CSV parse mechanism
 */
const csv = require('csv-streamify')
const fs = require('fs')
const moment = require('moment');

const parser = csv({
  delimiter: ',', // comma, semicolon, whatever
  newline: '\r\n', // newline character (use \r\n for CRLF files)
  quote: '"', // what's considered a quote
  empty: '', // empty fields are replaced by this,

  // if true, emit arrays instead of stringified arrays or buffers
  objectMode: false,

  // if set to true, uses first row as keys -> [ { column1: value1, column2: value2 }, ...]
  columns: false
}, function (err, result) {
  if (err) throw err
  // our csv has been parsed succesfully
  process(result);
});

const data = [];
// emits each line as a buffer or as a string representing an array of fields
// parser.on('data', function (lineBuffer) {
// Convert from an encoded buffer to js string.
// data.push(iconv.decode(lineBuffer, 'utf8'));
// })


/**
 * Init CSV writing mechanism
 */
var csvWriter = require('csv-write-stream')
var writer = csvWriter({
  separator: ',',
  newline: '\n',
  headers: ['date', 'name', 'amount', 'txnId', 'balance'],
  sendHeaders: true
})

/**
 * CSV parsing
 */
// now pipe some data into it
fs.createReadStream(inputFilepath).pipe(parser)

Object.size = function (obj) {
  var size = 0,
    key;
  for (key in obj) {
    if (obj.hasOwnProperty(key)) size++;
  }
  return size;
};

function process(data) {
  var current;
  var counter = 0;
  writer.pipe(fs.createWriteStream(outputFilepath))
  data.forEach(function (line, index, arr) {
    var date = moment(line[0], "MM/DD/YYYY");
    if (!date.isValid()) {
      date = moment(line[0], "YYYY-MM-DD");
    }
    if (date.isValid()) {
      current = {};
      current.date = date.format('DD/MM/YYYY');
      if (line[1] == "ΑΤΜ-ΑΝΑΛΗΨΗ ΜΕΤΡΗΤΩΝ") {
        current.name = [line[1], arr[index + 2][1]];
      } else {
        current.name = [arr[index + 2][1], line[1]];

      }
      current.name = current.name.join(' ').substring(0, 44);
      current.txnId = arr[index + 1][1];
      current.amount = Number(line[4].replace(',', '.'));
      current.balance = Number(line[5].replace(',', '.'));

      // console.log(current);
      if(current.amount != 0) {
        counter++;
        writer.write(current);
      }
    } else {
      console.log("Invalid line", line);
    }
  });
  writer.end()
  console.log("Complete: " + Object.keys(data).length + " input lines produced " + counter + " output lines");
}
