// importing the standard library
const std = @import("std");

// Created a basic list of unsigned 8bit integers.
// Thought here being that I will not need to allocate all but the smallest unit for these arrays that will not change.
const left_list = [_]u8{ 3, 4, 2, 1, 3, 3 };
const right_list = [_]u8{ 4, 3, 5, 3, 9, 3 };

// Pair up the smallest number in the left list with the smallest number in the right list
// sort int[] from smallest to largest
// find the difference between each

pub fn main() !void {
    // better iterating over array behavior.
    var i: u8 = 0;
    while (i < 5) : (i += 1) {
        const left = left_list[i];
        const right = right_list[i];
        std.debug.print("#{}: {},{}\n", .{ i, left, right });
        const dex = left - right;
        std.debug.print("Difference: {}", .{dex});
    }
}
