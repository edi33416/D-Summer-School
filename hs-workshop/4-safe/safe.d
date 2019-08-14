import std.stdio;

struct VeryBigStruct
{
    int x;
}

int findNum(VeryBigStruct[] haystack, VeryBigStruct *needle)
{
    for (int pos = 0; pos < haystack.length; ++pos)
    {
        if (haystack[pos].x == needle.x)
            return pos;
    }
    return -1;
}

void main()
{
    auto arr = [VeryBigStruct(1), VeryBigStruct(42), VeryBigStruct(24)];
    auto elem = VeryBigStruct(1);

    assert(findNum(arr, &elem) != -1);

    auto arr2 = arr[1 .. $];
    assert(findNum(arr2, &elem) == -1);
}
