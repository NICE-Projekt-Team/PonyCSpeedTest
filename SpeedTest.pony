use "collections"
use "random"
actor TransferActor

    var size: U32 = 1
    var env: Env
    var list: List[U64]
    var rand: Rand
    var dice: Dice
    var duration: F64
    var timers: Timers

    new create(size': U32, env': Env) =>
        env = env'
        size = size'
        list = List[U64]()
        rand = Rand
        dice = Dice(rand)
        duration = 0.0


    be writeList() =>
        env.out.print("Writing data to an list")
        var count: U32 = 0
        while count < size do
            var value = dice.apply(1, 2) -1
            list.push(value)
            count = count +1
        end
        env.out.print("Done writing data")


    be transferList(listInput: List[U64] iso)  =>
        env.out.print("Transferrring data from and to list")
        var count: U32 = 0
        while count < size do
            list
            env.out.print(count.string())
            count  = count + 1
        end

    fun ref getSpeed(): ( F64 val) =>
        env.out.print("Sending time")
        duration




actor Main
    var size: U32 = 80000000
    new create(env: Env) =>
        speedtest(env)


    fun speedtest(env: Env) =>
        var sizeMb = size/8000000
        env.out.write("Size of the list is set to: ")
        env.out.write(sizeMb.string())
        env.out.write("mb")
        env.out.print("")
        var transferActor1 = TransferActor(size, env)
        var transferActor2 = TransferActor(size, env)
        var transferActor3 = TransferActor(size, env)
        transferActor1.writeList()
        transferActor2.writeList()
        transferActor3.writeList()
        env.out.print("Done writing lists. Duration: ")
        
        env.out.print("Starting to transfer lists")
        //transferActor1.transferList(env, list2)
        //transferActor2.transferList(env, list3)
        //transferActor3.transferList(env, list1)

        env.out.print("Done transferring lists. Duration: ")


