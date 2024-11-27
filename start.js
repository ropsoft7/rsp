const RSp = require('rsp-libjscript')
const path = require('path');

const roodir = __dirname,
      scriptdir = path.join(roodir, 'script');

const rsp = new RSp();

console.log("Executing: rsp/start.js")

rsp.exec('sudo killall -9 apt')
rsp.exec('sudo killall -9 dpkg')
rsp.exec("sudo dpkg --configure -a")

rsp.prin("Running: " + `${scriptdir}/git-fetch-all-proj.sh`)
rsp.exec(`${scriptdir}/git-fetch-all-proj.sh`);

rsp.prin("Setting up rsp/rsp-fsystem")
rsp.exec(`cd ${roodir}/rsp-fsystem && npm install && npm start`);

rsp.prin("Finally...")
rsp.util.runIndexScript(scriptdir);

console.log("Finished execution of: rsp/start.js")
