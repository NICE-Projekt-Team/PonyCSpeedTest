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
        for y in listInput.values() do
            list.push(count) //TODO: replace this
        end


    fun ref getList(): (List[U64] val) =>
        env.out.print("Sending list")
        list




actor Main
    var size: U32 = 8000000
    new create(env: Env) =>
        speedtest(env)


    fun speedtest(env: Env): U64 =>
        var sizeMb = size/8000000
        var timers = Timers
        env.out.write("Size of the list is set to: ")
        env.out.write(sizeMb.string())
        env.out.write("mb")
        env.out.print("")
        var transferActor1 = TransferActor(size, env)
        var transferActor2 = TransferActor(size, env)
        var transferActor3 = TransferActor(size, env)

        var timer = Timer()

        transferActor1.writeList()
        transferActor2.writeList()
        transferActor3.writeList()
        env.out.print("Done writing lists. Duration: ")

        var list1 = transferActor1.getList()
        var list2 = transferActor2.getList()
        var list3 = transferActor3.getList()

        env.out.print("Starting to transfer lists")

        var timeBefore = Time.nanoseconds()

        transferActor1.transferList(list2)
        transferActor2.transferList(list3)
        transferActor3.transferList(list1)

        var timeAfter = Time.nanoseconds()
        env.out.print("Done transferring lists. Duration: ")
        timeAfter-timeBefore



    class SpeedTestTimer is TimerNorify
        var _env: Env
          var _count: U64 = 0

          new iso create(env: Env) =>
            _env = env

          fun ref apply(timer: Timer, count: U64): Bool =>
            _count = _count + count
            _env.out.print("timer: " + _count.string())
            _count < 10

          fun ref cancel(timer: Timer) =>
            _env.out.print("timer cancelled")





