module tls_6;

import std.concurrency;
import std.stdio;
import std.conv;
import core.thread;

shared int variable;

void printInfo(string message)
{
    writefln("%s: %s (0x%s)", message, variable, &variable);
}

void worker()
{
    variable = 42;
    printInfo("Before the worker is terminated");
}

void main()
{
    spawn(&worker);
    thread_joinAll();
    printInfo("After the worker is terminated");
}
