const fs = require('fs');
const path = require('path');
const numeral = require('numeral');
const shelljs = require('shelljs');

const exec = shelljs.exec;

const roodir = __dirname,
      scriptdir = path.join(roodir, 'script');
      
console.log("Executing: rsp-fsystem/start.js")

fs.readdirSync(scriptdir).filter(file => {
    return numeral(file[0]).value() || numeral(file[0]).value() === 0;
}).forEach(file => {
    exec(`yes | ${scriptdir}/${file}`)
})

console.log("Finished execution of: rsp-fsystem/start.js")
