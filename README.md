# RexshackGaming
- discord : https://discord.gg/eW3ADkf4Af
- youtube : https://www.youtube.com/channel/UCikEgGfXO-HCPxV5rYHEVbA
- github : https://github.com/Rexshack-RedM

# Dependancies
- rsg-core
- ox_lib

# Installation
- ensure that the dependancies are added and started
- add the following table to your database : rsg-saloontender.sql
- add rsg-saloontender to your resources folder

# add to shared jobs
```lua
    ['valsaloontender'] = { --valentine
        label = 'Valentine Saloon',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 25 },
            ['1'] = { name = 'Tender',  payment = 50 },
            ['2'] = { name = 'Manager', isboss = true, payment = 75 },
        },
    },
    ['blasaloontender'] = { --blackwater
        label = 'Blackwater Saloon',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 25 },
            ['1'] = { name = 'Tender',  payment = 50 },
            ['2'] = { name = 'Manager', isboss = true, payment = 75 },
        },
    },
    ['rhosaloontender'] = { --rhodes
        label = 'Rhodes Saloon',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 25 },
            ['1'] = { name = 'Tender',  payment = 50 },
            ['2'] = { name = 'Manager', isboss = true, payment = 75 },
        },
    },
    ['stdenissaloontender1'] = { --saint denis 1
        label = 'Saint Denis Saloon 1',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 25 },
            ['1'] = { name = 'Tender',  payment = 50 },
            ['2'] = { name = 'Manager', isboss = true, payment = 75 },
        },
    },
    ['stdenissaloontender2'] = { --saint denis 2
        label = 'Saint Denis Saloon 2',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 25 },
            ['1'] = { name = 'Tender',  payment = 50 },
            ['2'] = { name = 'Manager', isboss = true, payment = 75 },
        },
    },
    ['vansaloontender'] = { --van horn
        label = 'Van Horn Saloon',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 25 },
            ['1'] = { name = 'Tender',  payment = 50 },
            ['2'] = { name = 'Manager', isboss = true, payment = 75 },
        },
    },
    ['armsaloontender'] = { --armadillo
        label = 'Armadillo Saloon',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 25 },
            ['1'] = { name = 'Tender',  payment = 50 },
            ['2'] = { name = 'Manager', isboss = true, payment = 75 },
        },
    },
    ['tumsaloontender'] = { --tumbleweed
        label = 'Tumbleweed Saloon',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 25 },
            ['1'] = { name = 'Tender',  payment = 50 },
            ['2'] = { name = 'Manager', isboss = true, payment = 75 },
        },
    },
```

# add to shared items & add the images to your inventory
```lua
    -- saloon
    ['malt']   = {['name'] = 'malt', ['label']   = 'Malt',   ['weight'] = 50, ['type'] = 'item', ['image'] = 'malt.png',   ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'used by saloons'},
    ['hops']   = {['name'] = 'hops', ['label']   = 'Hops',   ['weight'] = 50, ['type'] = 'item', ['image'] = 'hops.png',   ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'used by saloons'},
    ['yeast']  = {['name'] = 'yeast', ['label']  = 'Yeast',  ['weight'] = 50, ['type'] = 'item', ['image'] = 'yeast.png',  ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'used by saloons'},
    ['water']  = {['name'] = 'water', ['label']  = 'Water',  ['weight'] = 50, ['type'] = 'item', ['image'] = 'water.png',  ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'used by saloons'},
    ['bottle'] = {['name'] = 'bottle', ['label'] = 'Bottle', ['weight'] = 50, ['type'] = 'item', ['image'] = 'bottle.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'used by saloons'},
```

# Starting the resource
- add the following to your server.cfg file : ensure rsg-blacksmith
