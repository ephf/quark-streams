# Quark Streams

> [Quark Programming Language](https://quar.k.vu)

Read / write operations for Unix file descriptors.

Here is a simple program that echos what the user writes,

```quark
import lib::streams;

int extern STDIN_FILENO;

Stream input = Stream::from(STDIN_FILENO);
String message = String::new();

while(true) {
    input.read_into(&message, 0);

    write_file(stdout, "Echo: ");
    write_file(stdout, message.to_str());

    message.vector.size = 0;
}
```

## Stream Structure

The `Stream` structure is define as follows,

```quark
struct Stream {
    Int fdin;   // file descriptor to 'read' from 
    Int fdout;  // file descriptor to 'write' to
}
```

You can create a new `Stream` to write to and read from using the `Stream::new()` function:

```quark
Stream messages = Stream::new();
```

`Stream::new()` uses `pipe` to create a an input and output file descriptor pair. You can write to this `messages` stream, then read from it at a later time to recieve the data written.

```quark
messages.write("Hello World");

String greeting = messages.read(0);
print(greeting.to_str()); // Hello World
```

## Includes

`unistd.h`
