#! /usr/bin/env node
let child_process = require('child_process');
let path = require('path')



console.log(path.resolve(__dirname, 'add+commit+push'))


 let iocmds = [
    /*
    `rm -rf /home/cloud/temp/`,
    `rm -rf /home/cloud/hadoop-2.6.4/dfs/data/current/`,
    `rm -rf /home/cloud/hadoop-2.6.4/dfs/name/current/`,
    */
]

let cmds = [
    `git add .`,
    `git commit -m 'update in ${new Date()}'`,
    `git push`
]



for (let iocmd of iocmds) {
    child_process.execSync(iocmd, (err, stdout, stderr) => {
        if (err) return console.log(err)
        console.log(stdout)
    });
}


for (let cmd of cmds) {
    child_process.execSync(cmd, {
        cwd: '/Users/Captain/Downloads/Git_Rrpositories/Obective_C_Basics'
    }, (err, stdout, stderr) => {
        if (err) return console.log(err)
        console.log(stdout)
    });
}