const Foo = struct {};
const Bar = struct {};

export fn entry() void {
    var Bar : i32 = undefined;
    _ = Bar;
}

// error
// backend=stage1
// target=native
//
// tmp.zig:5:9: error: local shadows declaration of 'Bar'
// tmp.zig:2:1: note: declared here