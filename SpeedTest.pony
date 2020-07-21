class WriteArray
var env: Env

new create(env: Env) =>
env = env

env.out.print("Starting to write Array")




class TransferArray


actor Main
var _env: Env

new create(env: Env) =>
_env = env

_env.out.print("Size of the array is set to: ")

_env.out.print("Done writing arrays. Duration: ")

_env.out.print("Done transferring arrays. Duration: ")


