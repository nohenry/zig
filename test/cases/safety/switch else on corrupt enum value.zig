const std = @import("std");

pub fn panic(cause: std.builtin.PanicCause, stack_trace: ?*std.builtin.StackTrace, _: ?usize) noreturn {
    _ = stack_trace;
    if (cause == .corrupt_switch) {
        std.process.exit(0);
    }
    std.process.exit(1);
}
const E = enum(u32) {
    one = 1,
    two = 2,
};
pub fn main() !void {
    var a: E = undefined;
    @as(*u32, @ptrCast(&a)).* = 255;
    switch (a) {
        else => @panic("else"),
    }
}
// run
// backend=llvm
// target=native
