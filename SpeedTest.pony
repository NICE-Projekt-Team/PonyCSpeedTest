use "collections"
use "random"
use "time"
actor TransferActor

    var size: U32 = 1
    var env: Env
    var list: List[U64]
    var list2: List[U64]
    var rand: Rand
    var dice: Dice
    var duration: F64

    new create(size': U32, env': Env) =>
        env = env'
        size = size'
        list = List[U64]()
        list2 = List[U64]()
        rand = Rand
        dice = Dice(rand)
        duration = 0.0


    be writeList() =>
        var count: U32 = 0
        while count < size do
            var value = dice.apply(1, 2) -1
            list.push(value)
            count = count +1
        end


    be transferList()  =>
        var listInput2 = List[U64]()
        var count: U64 = 0
        for y in list.values() do
            listInput2.push(count)
        end






actor Main
    var size: U32 = 800000
    var speedSum: U64 = 0
    var counter: U32 = 0
    new create(env: Env) =>
        var timeBefore = Time.nanos() //repead test for one minute
        while((Time.nanos() - timeBefore) < 60000000000) do
            speedSum = speedSum + speedTest(env)
            counter = counter + 1
        end

        env.out.print("The speed was: " + "test")






    fun speedTest(env: Env): U64 =>
        var sizeMb = size/8000000
        var timers = Timers

        var transferActor1 = TransferActor(size, env)
        var transferActor2 = TransferActor(size, env)
        var transferActor3 = TransferActor(size, env)

        transferActor1.writeList()
        transferActor2.writeList()
        transferActor3.writeList()


        var timeBefore = Time.nanos()

        transferActor1.transferList()
        transferActor2.transferList()
        transferActor3.transferList()

        var timeAfter = Time.nanos()

        (timeAfter - timeBefore)