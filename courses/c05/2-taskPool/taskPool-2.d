module taskPool_2;

import std.parallelism;
import std.stdio;
import core.thread;

int anOperation(string id)
{
    writefln("Executing %s", id);
    Thread.sleep(1.seconds);
    return 42;
}

void main()
{
    /* Construct a task object that will execute
     * anOperation(). The function parameters that are
     * specified here are passed to the task function as its
     * function parameters. */
    auto theTask = task!anOperation("theTask");
    /* the main thread continues to do stuff */

    //theTask.executeInNewThread(); // start task execution
    taskPool.put(theTask);
    writeln(taskPool.size);

    immutable taskResult = theTask.yieldForce();
    writefln("All finished; the result is %s\n", taskResult);
}
