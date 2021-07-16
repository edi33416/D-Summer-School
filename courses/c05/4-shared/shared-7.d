module shared_7;

import std.concurrency;
import std.stdio;
import std.conv;
import core.thread;

void worker(shared bool *isDone)
{
    writefln("Is done = %s\n", *isDone);
}

void main()
{
    shared bool isDone = true;
    spawn(&worker, &isDone);
    thread_joinAll();
}
