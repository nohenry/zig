const std = @import("std");

pub fn panic(cause: std.builtin.PanicCause, stack_trace: ?*std.builtin.StackTrace, _: ?usize) noreturn {
    _ = stack_trace;
    if (cause == .divide_by_zero) {
        std.process.exit(0);
    }
    std.process.exit(1);
}
pub fn main() !void {
    const x = rem0(999, 0);
    _ = x;
    return error.TestFailed;
}
fn rem0(a: i32, b: i32) i32 {
    return @rem(a, b);
}
// run
// backend=llvm
// target=native
