#!/usr/local/bin/rsp.nodeJS

const RSp = require('rsp-libjscript');
const path = require('path');
const fs = require('fs')

const rsp = new RSp()

const rootDir = path.resolve(__dirname, '..');

const rspProjDirs = fs.readdirSync(rootDir).filter((dirItem) => {
    return dirItem.startsWith('rsp-');
})

console.log('Firstly: Git syncying root project directory ')

rsp.exec(`cd ${rootDir}; /usr/local/bin/rsp.gitSyncronize`)

console.log('Git syncying status of all RSP projects in', rootDir)

rspProjDirs.forEach((dir) => {
    
    const projDirPath = path.join(rootDir, dir);
    
    console.log('projDirPath', projDirPath)
    
    rsp.exec(`cd ${projDirPath}; /usr/local/bin/rsp.gitSyncronize`)

})
