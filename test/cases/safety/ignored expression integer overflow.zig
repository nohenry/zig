const std = @import("std");

pub fn panic(cause: std.builtin.PanicCause, stack_trace: ?*std.builtin.StackTrace, _: ?usize) noreturn {
    _ = stack_trace;
    if (cause == .integer_overflow) {
        std.process.exit(0);
    }
    std.process.exit(1);
}

pub fn main() !void {
    var x: usize = undefined;
    x = 0;
    // We ignore this result but it should still trigger a safety panic!
    _ = x - 1;
    return error.TestFailed;
}

// run
// backend=llvm
// target=native
