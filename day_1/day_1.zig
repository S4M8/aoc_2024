const std = @import("std");

fn compare() !void {}

pub fn main() !void {
    std.debug.print("Advent of Code: Day 1");
    const left_list = [_]u8{ 3, 4, 2, 1, 3, 3 };
    const right_list = [_]u8{ 4, 3, 5, 3, 9, 3 };

    std.debug.print("Sorting...");
    // memory allocator to create sortable slices
    var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
    const gpa = general_purpose_allocator.allocator();

    const left_sorted = try gpa.dupe(u8, &left_list);
    const right_sorted = try gpa.dupe(u8, &right_list);

    std.mem.sort(u8, left_sorted, {}, comptime std.sort.asc(u8));
    std.mem.sort(u8, right_sorted, {}, comptime std.sort.asc(u8));

    // Slice Iteration allows fo simultaneous iteration
    // Note: The conditional is required or else 
    // there will be an underflow when a smaller integer is substracted by a larger number.

    std.debug.print("Comparing...");
    for (left_sorted, right_sorted, 0..) |left, right, index| {
        const diff = if (left > right) left - right else right - left; // conditional to handle potential underflow.
        std.debug.print("Index {}: Left {}, Right {}, Difference {}\n", .{ index, left, right, diff });
    }

    defer left_sorted.deinit();
    defer right_sorted.deinit();
}
