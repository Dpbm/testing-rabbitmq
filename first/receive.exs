defmodule Receive do
  def wait_for_messages do
    receive do
      {:basic_deliver, payload, _meta} ->
        IO.puts "[*] Received #{payload}"
        wait_for_messages()
    end
    
  end
end


{:ok, connection} = AMQP.Connection.open
{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "first")

AMQP.Basic.consume(channel, "first", nil, no_ack: true)

IO.puts "Waiting for messages...."

Receive.wait_for_messages()
