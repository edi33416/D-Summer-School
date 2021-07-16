module fiber_10;

import core.thread;
import std.stdio;

private int goods;
private bool exit;

void producerFiber()
{
    foreach (i; 0..3)
    {
        goods = i^^2;
        writefln("Produced %s", goods);
        Thread.sleep(500.msecs);
        Fiber.yield();
    }
}

void consumerFiber()
{
    while (!exit)
    {
        /* do something */
        writefln("Consumed %s", goods);
        Thread.sleep(500.msecs);
        Fiber.yield();
    }
}

void main()
{
    auto producer = new Fiber(&producerFiber);
    auto consumer = new Fiber(&consumerFiber);
    while (producer.state != Fiber.State.TERM)
    {
        producer.call();
        exit = producer.state == Fiber.State.TERM;
        consumer.call();
    }
}
