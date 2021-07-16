module race_8;

import std.concurrency;
import std.stdio;
import std.conv;
import core.thread;
import core.atomic;

void inc(shared(int)* val)
{
    //++*val;
    int* tmp = cast(int*) val;
    ++*tmp;

    //atomicOp!"+="(*val, 1);

}

void main()
{
    shared int x = 0;
    foreach (i; 0 .. 10) {
        spawn(&inc, &x);
    }
    thread_joinAll();
    writeln(x);
}
