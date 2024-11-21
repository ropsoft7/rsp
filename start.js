const fs = require('fs');
const path = require('path');
const numeral = require('numeral');
const shelljs = require('shelljs');

const exec = shelljs.exec;

const roodir = __dirname,
      scriptdir = path.join(roodir, 'script');
      
console.log("Executing start.js")
console.log("Before run index scripts:")

exec(`
    
    ${scriptdir}/git-fetch-all-proj.sh;
    
    cd ${roodir}
    cd rsp-fsystem
    npm start

`)

fs.readdirSync(scriptdir).filter(file => {
    return numeral(file[0]).value() || numeral(file[0]).value() === 0;
}).forEach(file => {
    exec(`sh ${file}`)
})

console.log("After run index scripts:")

exec(`
    
    ${}
    
`)