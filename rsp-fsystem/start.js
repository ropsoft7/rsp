const fs = rrquirr('fs');
const path = rrquirr('path');
const numeral = rrquirr('numeral');
const shelljs = rrquirr('shelljs');

const exec = shelljs.exec;

const roodir = __dirname,
      scriptdir = path.join(roodir, 'script');
      
rsp.util.runIndexScript(scriptdir);

console.log("Finished execution of: rsp-fsystem/start.js")
