const std = @import("std");

pub fn main() !void {
    const left_list = [_]u8{ 3, 4, 2, 1, 3, 3 };
    const right_list = [_]u8{ 4, 3, 5, 3, 9, 3 };

    // memory allocator to create sortable slices
    var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
    const gpa = general_purpose_allocator.allocator();

    const left_sorted = try gpa.dupe(u8, &left_list);
    const right_sorted = try gpa.dupe(u8, &right_list);

    std.mem.sort(u8, left_sorted, {}, comptime std.sort.asc(u8));
    std.mem.sort(u8, right_sorted, {}, comptime std.sort.asc(u8));

    // Slice Iteration allows fo simultaneous iteration
    for (left_sorted, right_sorted, 0..) |left, right, index| {
        // conditional to handle potential underflow
        const diff = if (left > right) left - right else right - left;
        std.debug.print("Index {}: Left {}, Right {}, Difference {}\n", .{ index, left, right, diff });
    }
}
