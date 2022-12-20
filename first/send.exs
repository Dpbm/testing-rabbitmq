{:ok, connection} = AMQP.Connection.open("amqp://guest:guest@127.0.0.1:5672")
{:ok, channel} = AMQP.Channel.open(connection)

AMQP.Queue.declare(channel, "first")

AMQP.Basic.publish(channel, "", "first", "Hello, World!")

IO.puts "Sent: 'Hello, world!'"

AMQP.Connection.close(connection)
