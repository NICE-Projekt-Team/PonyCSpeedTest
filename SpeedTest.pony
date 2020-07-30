use "collections"
use "random"
actor TransferActor

    var size: U32 = 1
    var list: List[U64]
    var rand: Rand
    var dice: Dice
    new create(size': U32, env: Env) =>
        size = size'
        list = List[U64]()
        rand = Rand
        dice = Dice(rand)


    be writeArray(env: Env) =>
        var count: U32 = 0
        while count < size do
            var value = dice.apply(1, 2) -1
            list.push(value)
            env.out.print(value.string())
            count = count +1
        end


    be transferArray(env: Env) =>
        env.out.print("Starting to transfer Array")
        var count: U32 = 0
        while count < size do
            env.out.print(count.string())
            count  = count + 1
        end



actor Main
    var size: U32 = 8000000
    new create(env: Env) =>
        env.out.print("Size of the array is set to: ")
        var transferActor1 = TransferActor(size, env)
        var transferActor2 = TransferActor(size, env)
        var transferActor3 = TransferActor(size, env)
        transferActor1.writeArray(env)
        transferActor2.writeArray(env)
        transferActor3.writeArray(env)
        env.out.print("Done writing arrays. Duration: ")


        env.out.print("Done transferring arrays. Duration: ")


