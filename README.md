## saltssh-intro
Example repository for salt-ssh introduction  

### Requirements:
Vagrant and Virtualbox  

### Usage:
Execute:  
`vagrant up`  

Login to saltsshbox:  
`vagrant ssh saltsshbox`  

Become root:  
`vagrant@saltsshbox:~$ sudo -i`

You are ready to test salt-ssh:   
`salt-ssh -i '*' test.ping`

```
root@saltsshbox:~# salt-ssh -i '*' test.ping
testserver:
    True
```

